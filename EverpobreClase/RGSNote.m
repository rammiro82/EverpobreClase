#import "RGSNote.h"
#import "RGSPhoto.h"
#import "RGSNotebook.h"
#import "RGSLocation.h"

@import CoreLocation;

@interface RGSNote () <CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *locationManager;

@end

@implementation RGSNote

@synthesize locationManager = _locationManager;

-(BOOL) hasLocation{
    return (nil != self.location);
}

+(NSArray*) observableKeys{
    return @[@"name", @"text", @"notebook", @"photo.imageData", @"location"];
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
    
    
    CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
    
    if (((status == kCLAuthorizationStatusAuthorizedAlways) || (status == kCLAuthorizationStatusAuthorizedWhenInUse) ||
         (status == kCLAuthorizationStatusNotDetermined)) &&
        ([CLLocationManager locationServicesEnabled])) {
        // tenemos localización
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.delegate = self;
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        
        [self.locationManager requestWhenInUseAuthorization];
        [self.locationManager startUpdatingLocation];
        
        // sólo datos recientes
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self zapLocationManager];
        });
    }
    
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

#pragma mark - CLLocationManagerDelegate
-(void) locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations{
    
    // lo paramos
    [self zapLocationManager];
    
    if (![self hasLocation]) {
        
        //pillamos la última localización
        CLLocation *loc = [locations lastObject];
        
        //creamos location
        self.location = [RGSLocation locationWithCLLocation:loc forNote:self];
    }else{
        NSLog(@"No se debería de llegar aquí");
    }
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


#pragma mark - Utils
-(void)zapLocationManager{
    [self.locationManager stopUpdatingLocation];
    self.locationManager.delegate = nil;
    self.locationManager = nil;
}

@end
