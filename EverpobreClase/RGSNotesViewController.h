//
//  RGSNotesViewController.h
//  EverpobreClase
//
//  Created by Ramiro García Salazar on 21/1/16.
//  Copyright © 2016 Ramiro García Salazar. All rights reserved.
//

@import UIKit;
@import CoreData;

#import "AGTCoreDataCollectionViewController.h"
@class RGSNotebook;

@interface RGSNotesViewController : AGTCoreDataCollectionViewController

@property (nonatomic, strong) RGSNotebook *notebook;

-(id) initWithFetchedResultsController:(NSFetchedResultsController *)aFetchedResultsController
                                 layout:(UICollectionViewLayout*) layout
                              notebook: (RGSNotebook* ) notebook;

@end
