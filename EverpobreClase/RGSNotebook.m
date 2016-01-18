#import "RGSNotebook.h"

@interface RGSNotebook ()

// Private interface goes here.

@end

@implementation RGSNotebook

#pragma mark - Class Methods

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
    // alta de notificaciones
    [self addObserver:self
           forKeyPath:"name"
              options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
              context:]
}

-(void) tearDownKVO{
    // baja de notificaciones
    
}

@end
