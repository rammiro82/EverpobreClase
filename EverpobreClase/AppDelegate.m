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

@interface AppDelegate ()
@property (strong, nonatomic) AGTCoreDataStack *model;
@end

@implementation AppDelegate

-(void) createDummyDate{
    RGSNotebook *nb = [RGSNotebook notebookWithName:@"Ex novias"
                                            context:self.model.context];
    RGSNotebook *nb2 = [RGSNotebook notebookWithName:@"Sitios por visitar"
                                            context:self.model.context];
    
    //buscar objetos
    NSFetchRequest *req =[NSFetchRequest fetchRequestWithEntityName:[RGSNote entityName]];
    
    [RGSNote noteWithName:@"pampita" notebook:nb context:self.model.context];
    [RGSNote noteWithName:@"marina" notebook:nb context:self.model.context]; 
    
    [RGSNote noteWithName:@"camila" notebook:nb2 context:self.model.context];
    
    req.fetchBatchSize = 25;
    //req.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:RGSNoteAttributes.name ascending:YES]];
    req.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:RGSNoteAttributes.name
                                                          ascending:YES
                                                           selector:@selector(caseInsensitiveCompare:)]];
    req.predicate = [NSPredicate predicateWithFormat:@"notebook = %@", nb];
    
    NSArray *res = [self.model executeFetchRequest:req errorBlock:^(NSError *error) {
        NSLog(@"Un poco la gagaste");
    }];
    
    
//    [self.model saveWithErrorBlock:^(NSError *error) {
//        NSLog(@"La cagamos");
//    }];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self printContextState];
    
    self.model = [AGTCoreDataStack coreDataStackWithModelName:@"Everpobre"];
    
    // meto los datos chorras
    if (ADD_DUMY_DATA) {
        [self.model zapAllData];
        [self createDummyDate];
        
    }
    
    if (AUTO_SAVE) {
        [self autoSave];
    }
    
    // creo la window y tal y cual
    self.window = [[UIWindow alloc] initWithFrame:
                   [[UIScreen mainScreen] bounds]];
    
    //  nsfecth request
    NSFetchRequest *r = [NSFetchRequest fetchRequestWithEntityName:[RGSNotebook entityName]];
    
    r.fetchBatchSize = 25;
    r.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:RGSNoteAttributes.name
                                                        ascending:YES
                                                         selector:@selector(caseInsensitiveCompare:)],
                          [NSSortDescriptor sortDescriptorWithKey:RGSNoteAttributes.modificationDate
                                                        ascending:NO]];
    
    // NSFetchedResultsController
    NSFetchedResultsController *fc = [[NSFetchedResultsController alloc] initWithFetchRequest:r managedObjectContext:self.model.context sectionNameKeyPath:nil cacheName:nil];
    
    RGSNotebookViewController *tVC = [[RGSNotebookViewController alloc] initWithFetchedResultsController:fc style:UITableViewStylePlain];
    
    self.window.rootViewController = [tVC wrappedInNavigation];
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    [self.model saveWithErrorBlock:^(NSError *error) {
        NSLog(@"Error al guardar en resignAcitve");
    }];
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    
    
    [self.model saveWithErrorBlock:^(NSError *error) {
        NSLog(@"Error al guardar antes de ir a segundo plano");
    }];
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


#pragma mark - AutoSave

-(void) autoSave{
    
    // guardamos
    [self.model saveWithErrorBlock:^(NSError *error) {
        NSLog(@"Errod al autorguardar");
    }];
    
    // agendamos la siguiente llamada
    NSLog(@"AutoGuardado");
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
    
    req = [NSFetchRequest fetchRequestWithEntityName:[RGSLocation entityName]];
    NSUInteger numLocations = [[self.model executeFetchRequest:req
                                                    errorBlock:nil] count];
    
    printf("-------------------------------------------------------------------\n");
    printf("Tot objects:    %lu\n", (unsigned long)self.model.context.registeredObjects.count);
    printf("Notebook        %lu\n", (unsigned long)numNotebooks);
    printf("Notes           %lu\n", (unsigned long)numNotes);
    printf("Locations       %lu\n", (unsigned long)numLocations);
    printf("-------------------------------------------------------------------\n");
    
    [self performSelector:@selector(printContextState)
               withObject:nil
               afterDelay:5];
}


@end
