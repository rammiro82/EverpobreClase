#import "RGSPhoto.h"

@interface RGSPhoto ()

// Private interface goes here.

@end

@implementation RGSPhoto

-(UIImage* ) image{
    return [UIImage imageWithData:self.imageData];
}

-(void) setImage:(UIImage *)image{
    [self setImageData:UIImageJPEGRepresentation(image, 1.0f)];
}

@end
