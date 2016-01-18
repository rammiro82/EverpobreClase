//
//  UIViewController+Navigation.m
//  EverpobreClase
//
//  Created by Ramiro García Salazar on 19/1/16.
//  Copyright © 2016 Ramiro García Salazar. All rights reserved.
//

#import "UIViewController+Navigation.h"

@implementation UIViewController (Navigation)

-(UINavigationController *) wrappedInNavigation{
    
    // creamos el navigation controller
    UINavigationController *nav = [[UINavigationController alloc] init];
    
    // le encasquetamos
    [nav pushViewController:self
                   animated:NO];
    
    //  lo devolvemos
    return nav;
}

@end
