//
//  RGSLocationViewController.h
//  EverpobreClase
//
//  Created by Ramiro García Salazar on 1/2/16.
//  Copyright © 2016 Ramiro García Salazar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "RGSLocation.h"

@class RGSLocation;

@interface RGSLocationViewController : UIViewController
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
- (IBAction)standardMap:(id)sender;
- (IBAction)satelliteMap:(id)sender;
- (IBAction)hybridMap:(id)sender;

-(id) initWithLocation:(RGSLocation*) location;
@end
