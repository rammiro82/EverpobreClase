
@import UIKit;
@import MapKit;

#import "_RGSMapSnapshot.h"

@interface RGSMapSnapshot : _RGSMapSnapshot {}

@property (nonatomic, strong) UIImage *image;

+(instancetype) mapSnapshotForLocation:(RGSLocation*) location;

@end
