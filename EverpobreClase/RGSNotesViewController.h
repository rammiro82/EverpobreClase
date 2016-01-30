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


-(id) initWithFetchedResultsController:(NSFetchedResultsController *)aFetchedResultsController style:(UITableViewStyle)aStyle notebook: (RGSNotebook* ) notebook;

@end
