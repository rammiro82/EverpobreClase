//
//  RGSNotesViewController.h
//  EverpobreClase
//
//  Created by Ramiro García Salazar on 21/1/16.
//  Copyright © 2016 Ramiro García Salazar. All rights reserved.
//

@import UIKit;
@import CoreData;

#import "AGTCoreDataTableViewController.h"

@class RGSNotebook;

@interface RGSNotesViewController : AGTCoreDataTableViewController


-(id) initWithFetchedResultsController:(NSFetchedResultsController *)aFetchedResultsController style:(UITableViewStyle)aStyle notebook: (RGSNotebook* ) notebook;

@end
