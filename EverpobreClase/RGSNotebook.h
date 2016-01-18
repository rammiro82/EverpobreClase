#import "_RGSNotebook.h"

@interface RGSNotebook : _RGSNotebook {}
// Custom logic goes here.

+(instancetype) notebookWithName: (NSString *) name
                         context:(NSManagedObjectContext *) context;
@end
