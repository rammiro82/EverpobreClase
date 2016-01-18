#import "RGSNote.h"
#import "RGSPhoto.h"
#import "RGSNotebook.h"


@interface RGSNote ()

// Private interface goes here.

@end

@implementation RGSNote

+(NSArray*) observableKeys{
    return @[@"name", @"text", @"notebook", @"photo.imageData"];
}

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

#pragma mark - Life cycle

-(void) awakeFromInsert{
    [super awakeFromInsert];
    
    //se llama sólo una vez
    [self setupKVO];
}

-(void) awakeFromFetch{
    [super awakeFromFetch];
    
    //se llama un huevo de veces
    [self setupKVO];
}

-(void) willTurnIntoFault{
    [super willTurnIntoFault];
    
    [self tearDownKVO];
}


#pragma mark - KVO
-(void) setupKVO{
    
    for (NSString *key in [self.class observableKeys]){
        // alta de notificaciones
        [self addObserver:self
               forKeyPath:key
                  options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                  context:NULL];
        
    }
    
}

-(void) tearDownKVO{
    
    // baja de notificaciones
    for (NSString *key in [self.class observableKeys]){
        [self removeObserver:self
                  forKeyPath:key];
    }
}

-(void) observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSString *,id> *)change
                       context:(void *)context{
    
    self.modificationDate = [NSDate date];
}

@end
