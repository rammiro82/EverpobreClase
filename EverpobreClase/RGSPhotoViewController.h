//
//  RGSPhotoViewController.h
//  EverpobreClase
//
//  Created by Ramiro García Salazar on 22/1/16.
//  Copyright © 2016 Ramiro García Salazar. All rights reserved.
//

@import UIKit;
@class RGSNote;

@interface RGSPhotoViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

-(id) initWithModel:(RGSNote*) note;


@end
