//
//  RGSNoteCellView.m
//  EverpobreClase
//
//  Created by Ramiro García Salazar on 30/1/16.
//  Copyright © 2016 Ramiro García Salazar. All rights reserved.
//

#import "RGSNoteCellView.h"
#import "RGSNote.h"
#import "RGSPhoto.h"

@interface RGSNoteCellView()

@property (strong, nonatomic) RGSNote* note;

@end

@implementation RGSNoteCellView

+(NSArray*)keys{
    return @[@"name", @"modificationDate", @"photo.image", @"location.address", @"location.latitude", @"location.longitude"];
}


-(void) observeNote:(RGSNote*) note{
    // guardar en la propiedad
    self.note = note;
    
    // observar ciertas propiedades
    for (NSString *key in [RGSNoteCellView keys]) {
        [self.note addObserver:self
                    forKeyPath:key
                       options:NSKeyValueObservingOptionNew
                       context:NULL];
    }
    
    [self syncWithNote];
}

-(void) syncWithNote{
    
    // configurar la celda
    self.titleView.text = self.note.name;
    
    NSDateFormatter *fmt = [NSDateFormatter new];
    fmt.dateStyle = NSDateFormatterMediumStyle;
    self.modificationDateView.text = [fmt stringFromDate:self.note.modificationDate];
    
    UIImage *img;
    
    if (self.note.photo.image == nil) {
        img = [UIImage imageNamed:@"Person_NoPhotoAvailable"];
    }else{
        img = self.note.photo.image;
    }
    
    self.photoView.image = img;
    
    if(self.note.hasLocation){
        self.locationView.image = [UIImage imageNamed:@"placemark.png"];
    }else{
        self.locationView.image = nil;
    }
}

-(void) observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSString *,id> *)change
                       context:(void *)context{
    [self syncWithNote];
}

-(void)prepareForReuse{
    
    self.note = nil;
    [self syncWithNote];
}

@end
