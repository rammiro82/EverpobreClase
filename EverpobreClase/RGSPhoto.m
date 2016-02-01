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

#pragma mark - Class Methods
+(instancetype) photoWithImage:(UIImage *) image
                       context:(NSManagedObjectContext *) context{
    
    RGSPhoto *p = [NSEntityDescription insertNewObjectForEntityForName:[RGSPhoto entityName]
                                                inManagedObjectContext:context];
    
    p.imageData = UIImageJPEGRepresentation(image, 0.9);
    
    
    return p;
    
}

@end
