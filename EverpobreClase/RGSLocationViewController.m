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
@property (nonatomic, strong) NSArray<RGSLocation *>*modelArray;

@end

@implementation RGSLocationViewController

-(id) initWithLocation:(RGSLocation*) location{
    if (self = [super initWithNibName:nil
                               bundle:nil]) {
        _model = location;
    }
    return self;
}

-(id) initWithFechedResultsController:(NSFetchedResultsController *) aFrc{
    if (self = [super init]) {
        _frc = aFrc;
    }
    return self;
}

-(id)initWithLocations:(NSArray<RGSLocation *>*)locations{
    if (self = [super initWithNibName:nil
                               bundle:nil]) {
        _modelArray = locations;
    }
    return self;
}

-(BOOL) hasLocationSSS{
    return (nil != self.modelArray);
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    if(nil == self.model){
        [self.mapView removeAnnotations:self.modelArray];NSError *error;
        [self.frc performFetch:&error];
        if (error) NSLog(@"[%@ %@] %@ (%@)", NSStringFromClass([self class]), NSStringFromSelector(_cmd), [error localizedDescription], [error localizedFailureReason]);
        
        self.modelArray = self.frc.fetchedObjects;
        [self.mapView addAnnotations:self.modelArray];
    }else if(nil != self.model){
        // una sola location
        
        // pasarselo al mapView
        [self.mapView addAnnotation:self.model];
        
        //region inicial
        MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(self.model.coordinate, 2000000, 2000000);
        
        [self.mapView setRegion:region];
        
    }else{
        
    }
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    if (self.hasLocationSSS) { // muchas locations
        self.mapView.centerCoordinate = self.modelArray.firstObject.coordinate;
        
    }else if(nil != self.model){// una sola location
        // asignar region y animar
        
        MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(self.model.coordinate, 500, 500);
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)( 1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.mapView setRegion:region
                           animated:YES];
        });
    }else{
        
    }
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

@end
