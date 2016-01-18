#import "RGSNote.h"
#import "RGSPhoto.h"
#import "RGSNotebook.h"


@interface RGSNote ()

// Private interface goes here.

@end

@implementation RGSNote

// Custom logic goes here.

+(instancetype) noteWithName:(NSString *) name
                    notebook:(RGSNotebook *) notebook
                     context:(NSManagedObjectContext *) context{
    
    RGSNote *note = [self insertInManagedObjectContext:context];
    
    note.name = name;
    note.notebook = notebook;
    note.creationDate = [NSDate date];
    note.modificationDate = [NSDate date];
    note.photo = [RGSPhoto insertInManagedObjectContext:context];
    
    return note;
    
}

@end
