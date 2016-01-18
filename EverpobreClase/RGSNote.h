#import "_RGSNote.h"

@class RGSNotebook;

@interface RGSNote : _RGSNote {}
// Custom logic goes here.


+(instancetype) noteWithName: (NSString *) name
                    notebook:(RGSNotebook *) notebook
                     context:(NSManagedObjectContext *) context;
@end
