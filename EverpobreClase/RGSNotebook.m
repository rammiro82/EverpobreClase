#import "RGSNotebook.h"

@interface RGSNotebook ()

// Private interface goes here.

@end

@implementation RGSNotebook

#pragma mark - Class Methods

+(NSArray*) observableKeys{
    return @[@"name", @"notes"];
}

// Custom logic goes here.
+(instancetype) notebookWithName: (NSString*) name
                         context:(NSManagedObjectContext *) context{
    RGSNotebook *nb = [self insertInManagedObjectContext:context];
    
    nb.name = name;
    nb.creationDate = [NSDate date];
    nb.modificationDate = [NSDate date];
    
    return nb;
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
