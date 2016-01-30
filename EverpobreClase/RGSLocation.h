#import "_RGSLocation.h"

@import CoreLocation;

@interface RGSLocation : _RGSLocation {}
// Custom logic goes here.


+(instancetype) locationWithCLLocation:(CLLocation *) location
                               forNote:(RGSNote *) note;

@end
