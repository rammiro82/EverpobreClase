#import "_RGSNote.h"

@import CoreLocation;

@class RGSNotebook;

@interface RGSNote : _RGSNote {}

@property (nonatomic, readonly) BOOL hasLocation;


+(instancetype) noteWithName: (NSString *) name
                    notebook:(RGSNotebook *) notebook
                     context:(NSManagedObjectContext *) context;
@end
