//
//  RGSLocationViewController.m
//  EverpobreClase
//
//  Created by Ramiro García Salazar on 1/2/16.
//  Copyright © 2016 Ramiro García Salazar. All rights reserved.
//

#import "RGSLocationViewController.h"

@interface RGSLocationViewController () <MKMapViewDelegate>

@property (nonatomic, strong) RGSLocation *model;

@end

@implementation RGSLocationViewController

-(id) initWithLocation:(RGSLocation*) location{
    if (self = [super initWithNibName:nil
                               bundle:nil]) {
        _model = location;
    }
    return self;
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    
    // pasarselo al mapView
    [self.mapView addAnnotation:self.model];
    
    //region inicial
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(self.model.coordinate, 2000000, 2000000);
    
    [self.mapView setRegion:region];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    // asignar region y animar
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(self.model.coordinate, 500, 500);
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)( 1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.mapView setRegion:region
                       animated:YES];
    });
}

#pragma mark - Actions
- (IBAction)standardMap:(id)sender {
    self.mapView.mapType = MKMapTypeStandard;
}

- (IBAction)satelliteMap:(id)sender {
    
    self.mapView.mapType = MKMapTypeSatellite;
}

- (IBAction)hybridMap:(id)sender {
    self.mapView.mapType = MKMapTypeHybrid;
}

#pragma mark - MKMapViewDelegate

@end
