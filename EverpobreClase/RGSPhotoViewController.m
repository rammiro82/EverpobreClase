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

@property (weak, nonatomic) IBOutlet UIBarButtonItem *deleteButton;
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
            _shouldSaveImageToModel = NO;
        }else{
            _shouldSaveImageToModel = YES;
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
    
    self.deleteButton.enabled = self.shouldSaveImageToModel;
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
    
    self.deleteButton.enabled = NO;
}

- (IBAction)applyFilter:(id)sender {
}

- (IBAction)takePhoto:(id)sender {
    // crear imagepicker
    UIImagePickerController *pVC = [[UIImagePickerController alloc] init];
    
    // cofigurarlo
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        // tenemos cámara
        pVC.sourceType = UIImagePickerControllerSourceTypeCamera;
        
    }else{
        // tiramos del carrete
        pVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    
    // hacerme su delegado
    pVC.delegate = self;
    
    // mostrarlo
    [self presentViewController:pVC
                       animated:YES
                     completion:nil];
    
    // actualizamos el estado del botón.
    self.deleteButton.enabled = NO;
}


#pragma mark - UIImagePickerControllerDelegate
-(void) imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    
    // extraer la foto del diccionario de info
    UIImage *img = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    // asegurarnos que la imagen se guarda
    self.shouldSaveImageToModel = YES;
    
    // lo metemos en el modelo
    self.model.photo.image = img;
    
    // ocultamos el picker
    [self dismissViewControllerAnimated:YES
                             completion:nil];
    
}





@end
