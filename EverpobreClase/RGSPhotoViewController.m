//
//  RGSPhotoViewController.m
//  EverpobreClase
//
//  Created by Ramiro García Salazar on 22/1/16.
//  Copyright © 2016 Ramiro García Salazar. All rights reserved.
//

#import "RGSPhotoViewController.h"
#import "RGSNote.h"
#import "RGSPhoto.h"

@interface RGSPhotoViewController ()
- (IBAction)takePhoto:(id)sender;
- (IBAction)deletePhoto:(id)sender;
- (IBAction)applyFilter:(id)sender;

@property (weak, nonatomic) IBOutlet UIImageView *photoView;

@property (nonatomic) BOOL shouldSaveImageToModel;
@property (nonatomic, strong) RGSNote *model;

@end

@implementation RGSPhotoViewController


-(id) initWithModel:(RGSNote*) note{
    if(self = [super initWithNibName:nil
                              bundle:nil]){
        _model = note;
        
        if(note.photo.imageData == nil){
            _shouldSaveImageToModel = YES;
        }else{
            _shouldSaveImageToModel = NO;
        }
    }
    return self;
}

#pragma mark - Ciclo de Vida

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.title = self.model.name;
    
    if (self.model.photo.imageData) {
        self.photoView.image = self.model.photo.image;
        self.shouldSaveImageToModel = YES;
    }else{
        self.photoView.image = [UIImage imageNamed:@"Person_NoPhotoAvailable.png"];
        self.shouldSaveImageToModel = NO;
    }
    
}

-(void) viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    if (self.shouldSaveImageToModel) {
        self.model.photo.image = self.photoView.image;
    }
}

#pragma mark - Actions

- (IBAction)deletePhoto:(id)sender {
    self.model.photo.image = nil;
}

- (IBAction)takePhoto:(id)sender {
    
}

- (IBAction)applyFilter:(id)sender {
    
}

@end
