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
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    // asignar region y animar
}

#pragma mark - Actions
- (IBAction)standardMap:(id)sender {
}

- (IBAction)satelliteMap:(id)sender {
}

- (IBAction)hybridMap:(id)sender {
}

#pragma mark - MKMapViewDelegate

@end
