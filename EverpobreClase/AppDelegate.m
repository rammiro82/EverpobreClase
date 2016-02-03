//
//  AppDelegate.m
//  EverpobreClase
//
//  Created by Ramiro García Salazar on 16/1/16.
//  Copyright © 2016 Ramiro García Salazar. All rights reserved.
//

#import "AppDelegate.h"
#import "RGSNotebook.h"
#import "AGTCoreDataStack.h"
#import "RGSNote.h"
#import "RGSNotebookViewController.h"
#import "UIViewController+Navigation.h"
#import "Settings.h"
#import "RGSLocation.h"
#import "AGTCoreDataStack.h"
#import "RGSMapSnapshot.h"
#import "RGSLocationViewController.h"

@interface AppDelegate ()
@property (strong, nonatomic) AGTCoreDataStack *model;
@end

@implementation AppDelegate

-(void) createDummyData{
    RGSNotebook *novias = [RGSNotebook notebookWithName:@"Ex novias"
                                                context:self.model.context];
    [RGSNote noteWithName:@"pampita"
                 notebook:novias
                  context:self.model.context];
    [RGSNote noteWithName:@"marina"
                 notebook:novias
                  context:self.model.context];
    
    
    RGSNotebook *lugares = [RGSNotebook notebookWithName:@"Sitios por visitar"
                                                 context:self.model.context];
    [RGSNote noteWithName:@"peru"
                 notebook:lugares
                  context:self.model.context];
    
    // Guardamos
    [self save];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self printContextState];
    
    self.model = [AGTCoreDataStack coreDataStackWithModelName:@"EverpobrePro"];
    
    // meto los datos chorras
    if (ADD_DUMY_DATA) {
        [self.model zapAllData];
        [self createDummyData];
    }
    
    if (AUTO_SAVE) {
        [self autoSave];
    }
    
    // creo la window tal y cual
    self.window = [[UIWindow alloc] initWithFrame:
                   [[UIScreen mainScreen] bounds]];
    
    //  nsfecth request Notebooks
    NSFetchRequest *reqNotebooks = [NSFetchRequest fetchRequestWithEntityName:[RGSNotebook entityName]];
    
    reqNotebooks.fetchBatchSize = 25;
    reqNotebooks.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:RGSNamedEntityAttributes.name
                                                        ascending:YES
                                                         selector:@selector(caseInsensitiveCompare:)],
                          [NSSortDescriptor sortDescriptorWithKey:RGSNamedEntityAttributes.modificationDate
                                                        ascending:NO]];
    
    // NSFetchedResultsController Notebooks
    NSFetchedResultsController *fcNotebooks = [[NSFetchedResultsController alloc] initWithFetchRequest:reqNotebooks
                                                                         managedObjectContext:self.model.context
                                                                           sectionNameKeyPath:nil
                                                                                    cacheName:nil];
    // VC de la lista de notebook
    RGSNotebookViewController *tableVC = [[RGSNotebookViewController alloc]
                                      initWithFetchedResultsController:fcNotebooks
                                                                 style:UITableViewStylePlain];
    UINavigationController *navVC = [tableVC wrappedInNavigation];
    navVC.tabBarItem.title = @"Libretas";
    
    // nsfech de las locations de todas las notas
    NSFetchRequest *reqLocations = [NSFetchRequest fetchRequestWithEntityName:[RGSLocation entityName]];
    reqLocations.sortDescriptors =@[[NSSortDescriptor sortDescriptorWithKey:RGSLocationAttributes.address
                                                                  ascending:YES
                                                                   selector:@selector(caseInsensitiveCompare:)]];
    NSFetchedResultsController *fcLocations = [[NSFetchedResultsController alloc] initWithFetchRequest:reqLocations
                                                                                  managedObjectContext:self.model.context
                                                                                    sectionNameKeyPath:nil
                                                                                             cacheName:nil];
    
    // creamos un mapVC para mostrar las locations
    RGSLocationViewController *mapVC = [[RGSLocationViewController alloc] initWithFechedResultsController:fcLocations];
    mapVC.tabBarItem.title = @"Mapa";
    
    //cambiamos el rootVC por un tabVC
    UITabBarController *tabVC = [[UITabBarController alloc] init];
    
    [tabVC setViewControllers:@[navVC, mapVC] animated:YES];
    
    self.window.rootViewController = tabVC;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // guardamos
    [self save];
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // guardamos
    [self save];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    NSLog(@"Adios mundo cruel");
}


#pragma mark - Save
-(void)save{
    
    [self.model saveWithErrorBlock:^(NSError *error) {
        NSLog(@"Error al guardar %s \n\n %@", __func__, error);
    }];
}


#pragma mark - AutoSave
-(void) autoSave{
    NSLog(@"AutoGuardando");
    [self save];
    [self performSelector:@selector(autoSave)
               withObject:nil
               afterDelay:AUTO_SAVE_DELAY];
}



-(void) printContextState{
    NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[RGSNotebook entityName]];
    NSUInteger numNotebooks = [[self.model executeFetchRequest:req errorBlock:nil] count];
    
    req = [NSFetchRequest fetchRequestWithEntityName:[RGSNote entityName]];
    NSUInteger numNotes = [[self.model executeFetchRequest:req
                                                errorBlock:nil] count];
    
    req = [NSFetchRequest fetchRequestWithEntityName:[RGSPhoto entityName]];
    NSUInteger numPhotos = [[self.model executeFetchRequest:req
                                                errorBlock:nil] count];
    
    req = [NSFetchRequest fetchRequestWithEntityName:[RGSLocation entityName]];
    NSUInteger numLocations = [[self.model executeFetchRequest:req
                                                    errorBlock:nil] count];
    
    req = [NSFetchRequest fetchRequestWithEntityName:[RGSMapSnapshot entityName]];
    NSUInteger numMapSnapshots = [[self.model executeFetchRequest:req
                                                    errorBlock:nil] count];
    
    printf("-------------------------------------------------------------------\n");
    printf("Tot objects:    %lu\n", (unsigned long)self.model.context.registeredObjects.count);
    printf("Notebook        %lu\n", (unsigned long)numNotebooks);
    printf("Notes           %lu\n", (unsigned long)numNotes);
    printf("Photos          %lu\n", (unsigned long)numPhotos);
    printf("Locations       %lu\n", (unsigned long)numLocations);
    printf("numMapSnapshots %lu\n", (unsigned long)numMapSnapshots);
    printf("-------------------------------------------------------------------\n");
    
    [self performSelector:@selector(printContextState)
               withObject:nil
               afterDelay:5];
}


@end
