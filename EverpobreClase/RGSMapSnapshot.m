#import "RGSMapSnapshot.h"
#import "RGSLocation.h"

@interface RGSMapSnapshot ()



@end

@implementation RGSMapSnapshot

#pragma mark - propertie
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
              options:NSKeyValueObservingOptionNew context:NULL];
}

-(void) stopObserving{
    [self removeObserver:self
              forKeyPath:@"location"];
}

-(void) observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSString *,id> *)change
                       context:(void *)context{
    
    // recalculamos el mapSnapshot
    CLLocationCoordinate2D center = CLLocationCoordinate2DMake(self.location.latitudValue, self.location.longitudValue);
    
    MKMapSnapshotOptions *options = [MKMapSnapshotOptions new];
    options.region = MKCoordinateRegionMakeWithDistance(center, 300, 300);
    options.mapType = MKMapTypeHybrid;
    options.size = CGSizeMake(150, 150);
    
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
