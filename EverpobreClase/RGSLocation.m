#import "RGSLocation.h"
#import "RGSNote.h"
#import "RGSMapSnapshot.h"
#import <CoreLocation/CoreLocation.h>

@import AddressBookUI;
@import Contacts;

@interface RGSLocation ()

// Private interface goes here.

@end

@implementation RGSLocation

+(instancetype) locationWithCLLocation:(CLLocation *) location
                               forNote:(RGSNote *) note{
    
    NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[RGSLocation entityName]];
    NSPredicate *latitude = [NSPredicate predicateWithFormat:@"abs(latitude) - abs(%lf) < 0.001", location.coordinate.latitude];
    NSPredicate *longitude = [NSPredicate predicateWithFormat:@"abs(longitude) - abs(%lf) < 0.001", location.coordinate.longitude];
    req.predicate = [NSCompoundPredicate andPredicateWithSubpredicates:@[latitude, longitude]];
    
    NSError *error = nil;
    NSArray *results = [note.managedObjectContext executeFetchRequest:req
                                                                error:&error];
    
    NSAssert(results, @"Error al buscar");
    
    if ([results count]) {
        //aprovechamos
        RGSLocation *found = [results lastObject];
        [found addNotesObject:note];
        
        return found;
    }else{
        // la creamos desde cero
        
        RGSLocation *loc = [self insertInManagedObjectContext:note.managedObjectContext];
        
        loc.latitudValue = location.coordinate.latitude;
        loc.longitudValue = location.coordinate.longitude;
        [loc addNotesObject:note];
        
        // creamos la dirección dirección
        CLGeocoder *coder = [CLGeocoder new];
        [coder reverseGeocodeLocation:location
                    completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
                        if (error) {
                            NSLog(@"Erro while obtaining adress!\n%@", error);
                        }else{
                            CLPlacemark *placemark = [placemarks lastObject];
                            
                            // use the Contacts framework to create a readable formatter address
                            CNMutablePostalAddress *postalAddress = [[CNMutablePostalAddress alloc] init];
                            postalAddress.street = placemark.thoroughfare;
                            postalAddress.city = placemark.locality;
                            postalAddress.state = placemark.administrativeArea;
                            postalAddress.postalCode = placemark.postalCode;
                            postalAddress.country = placemark.country;
                            postalAddress.ISOCountryCode = placemark.ISOcountryCode;
                            
                            loc.address = [CNPostalAddressFormatter stringFromPostalAddress:postalAddress style:CNPostalAddressFormatterStyleMailingAddress];
                            
                            NSLog(@"Address is %@", loc.address);
                        }
                    }];
        
        
        // creamos un mapSnapshot
        loc.mapSnapshot = [RGSMapSnapshot mapSnapshotForLocation:loc];
        
        return loc;
    }
    
    
}

#pragma mark - MKAnnotation
-(NSString* ) title{
    return @"Aquí escribí una nota";
}
-(NSString*) subtitle{
    NSArray *lines = [self.address componentsSeparatedByString:@"\n"];
    NSMutableString *concat = [@"" mutableCopy];
    for (NSString *line in lines) {
        [concat appendFormat:@"%@ ", line];
    }
    return concat;
}
-(CLLocationCoordinate2D) coordinate{
    return CLLocationCoordinate2DMake(self.latitudValue, self.longitudValue);
}
@end
