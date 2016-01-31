//
//  RGSNoteViewController.h
//  EverpobreClase
//
//  Created by Ramiro García Salazar on 21/1/16.
//  Copyright © 2016 Ramiro García Salazar. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RGSNote.h"
#import "RGSNotebook.h"

@interface RGSNoteViewController : UIViewController

-(id) initWithModel:(RGSNote*) model;

-(id) initForNewNoteInNotebook:(RGSNotebook *) notebook;
@end
