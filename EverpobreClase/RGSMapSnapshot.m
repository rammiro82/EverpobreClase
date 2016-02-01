#import "RGSMapSnapshot.h"
#import "RGSLocation.h"
#import "RGSPhoto.h"

@interface RGSMapSnapshot ()

// Private interface goes here.

@end

@implementation RGSMapSnapshot

#pragma mark - properties
-(UIImage *) image{
    return [UIImage imageWithData:self.snapshotData];
}

-(void) setImage:(UIImage *)image{
    self.snapshotData = UIImageJPEGRepresentation(image, 0.9);
}

#pragma mark - Class Names
+(instancetype) mapSnapshotForLocation:(RGSLocation *)location{
    RGSMapSnapshot *snap = [RGSMapSnapshot insertInManagedObjectContext:location.managedObjectContext];
    snap.location = location;
    
    return snap;
}

-(void) awakeFromInsert{
    [super awakeFromInsert];
    
    [self startObserving];
}

-(void) awakeFromFetch{
    [super awakeFromFetch];
    
    [self startObserving];
}


-(void) willTurnIntoFault{
    [super willTurnIntoFault];
    
    [self stopObserving];
}

#pragma mark - KVO
-(void) startObserving{
    [self addObserver:self
           forKeyPath:@"location"
              options:NSKeyValueObservingOptionNew
              context:NULL];
}

-(void) stopObserving{
    @try {
        [self removeObserver:self
                  forKeyPath:@"location"];
    }
    @catch (NSException *exception) {
        
    }
}

-(void) observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSString *,id> *)change
                       context:(void *)context{
    
    // recalculamos el mapSnapshot
    CLLocationCoordinate2D center = CLLocationCoordinate2DMake(self.location.latitudeValue, self.location.longitudeValue);
    
    MKMapSnapshotOptions *options = [MKMapSnapshotOptions new];
    options.region = MKCoordinateRegionMakeWithDistance(center, 300, 300);
    options.mapType = MKMapTypeHybrid;
    options.size = CGSizeMake(300, 130);
    
    MKMapSnapshotter *shotter = [[MKMapSnapshotter alloc] initWithOptions:options];
    
    [shotter startWithCompletionHandler:^(MKMapSnapshot * _Nullable snapshot, NSError * _Nullable error) {
        if (!error) {
            // sin error
            self.image = snapshot.image;
        }else{
            // se produce error
            [self setPrimitiveLocation:nil];
            [self.managedObjectContext deleteObject:self];
        }
    }];
}
@end