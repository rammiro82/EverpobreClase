#import "_RGSLocation.h"
#import <MapKit/MapKit.h>

@interface RGSLocation : _RGSLocation<MKAnnotation> {}

+(instancetype) locationWithCLLocation:(CLLocation *) location
                               forNote:(RGSNote *) note;
@end
