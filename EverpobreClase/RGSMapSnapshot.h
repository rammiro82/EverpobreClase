#import "_RGSMapSnapshot.h"
#import "RGSPhoto.h"

@import UIKit;
@import MapKit;

@interface RGSMapSnapshot : _RGSMapSnapshot {}

@property (nonatomic, strong) UIImage *image;

+(instancetype) mapSnapshotForLocation:(RGSLocation*) location;
@end
