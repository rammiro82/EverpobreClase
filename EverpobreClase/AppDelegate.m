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

@interface AppDelegate ()
@property (strong, nonatomic) AGTCoreDataStack *model;
@end

@implementation AppDelegate

-(void) createDummyDate{
    RGSNotebook *nb = [RGSNotebook notebookWithName:@"Ex novias"
                                            context:self.model.context];
    
    //buscar objetos
    NSFetchRequest *req =[NSFetchRequest fetchRequestWithEntityName:[RGSNote entityName]];
    
    [RGSNote noteWithName:@"pampita" notebook:nb context:self.model.context];
    [RGSNote noteWithName:@"marina" notebook:nb context:self.model.context];
    [RGSNote noteWithName:@"camila" notebook:nb context:self.model.context];
    
    req.fetchBatchSize = 25;
    //req.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:RGSNoteAttributes.name ascending:YES]];
    req.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:RGSNoteAttributes.name
                                                          ascending:YES
                                                           selector:@selector(caseInsensitiveCompare:)]];
    req.predicate = [NSPredicate predicateWithFormat:@"notebook = %@", nb];
    
    NSArray *res = [self.model executeFetchRequest:req errorBlock:^(NSError *error) {
        NSLog(@"Un poco la gagaste");
    }];
    
    NSLog(@"%@", res);
    
//    [self.model saveWithErrorBlock:^(NSError *error) {
//        NSLog(@"La cagamos");
//    }];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.model = [AGTCoreDataStack coreDataStackWithModelName:@"Everpobre"];
    
    // meto los datos chorras
    [self createDummyDate];
    
    // creo la window y tal y cual
    
    // Override point for customization after application launch.
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
