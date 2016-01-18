#import "RGSNotebook.h"

@interface RGSNotebook ()

// Private interface goes here.

@end

@implementation RGSNotebook

// Custom logic goes here.
+(instancetype) notebookWithName: (NSString*) name
                         context:(NSManagedObjectContext *) context{
    RGSNotebook *nb = [self insertInManagedObjectContext:context];
    
    nb.name = name;
    nb.creationDate = [NSDate date];
    nb.modificationDate = [NSDate date];
    
    return nb;
}

@end
