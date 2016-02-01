#import "_RGSNotebook.h"

@interface RGSNotebook : _RGSNotebook {}

+(instancetype) notebookWithName: (NSString *) name
                         context:(NSManagedObjectContext *) context;

@end
