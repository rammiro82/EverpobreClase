#import "_RGSLocation.h"
#import <MapKit/MapKit.h>

@import CoreLocation;


@interface RGSLocation : _RGSLocation<MKAnnotation> {}
// Custom logic goes here.


+(instancetype) locationWithCLLocation:(CLLocation *) location
                               forNote:(RGSNote *) note;

@end
