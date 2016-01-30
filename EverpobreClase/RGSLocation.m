#import "RGSLocation.h"
#import "RGSNote.h"

@import AddressBookUI;
@import Contacts;

@interface RGSLocation ()

// Private interface goes here.

@end

@implementation RGSLocation

+(instancetype) locationWithCLLocation:(CLLocation *) location
                               forNote:(RGSNote *) note{
    
    RGSLocation *loc = [self insertInManagedObjectContext:note.managedObjectContext];
    
    loc.latitudValue = location.coordinate.latitude;
    loc.longitudValue = location.coordinate.longitude;
    [loc addNotesObject:note];
    
    // dirección
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
                    }
                }];
    return loc;
}

@end
