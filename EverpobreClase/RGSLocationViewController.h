//
//  RGSLocationViewController.h
//  EverpobreClase
//
//  Created by Ramiro García Salazar on 1/2/16.
//  Copyright © 2016 Ramiro García Salazar. All rights reserved.
//
@import CoreData;
#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

#import "RGSLocation.h"

@class RGSLocation;

@interface RGSLocationViewController : UIViewController

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) NSFetchedResultsController *frc;
@property (nonatomic, readonly) BOOL hasLocationSSS;

- (IBAction)standardMap:(id)sender;
- (IBAction)satelliteMap:(id)sender;
- (IBAction)hybridMap:(id)sender;

-(id) initWithLocation:(RGSLocation*) location;
-(id) initWithLocations:(NSArray<RGSLocation *>*)locations;
-(id) initWithFechedResultsController:(NSFetchedResultsController *) aFrc;


@end
