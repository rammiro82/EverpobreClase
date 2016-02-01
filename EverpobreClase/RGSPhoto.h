#import "_RGSPhoto.h"

@import UIKit;

@interface RGSPhoto : _RGSPhoto {}

@property (strong, nonatomic) UIImage *image;

+(instancetype) photoWithImage:(UIImage *) image
                       context:(NSManagedObjectContext *) context;

@end
