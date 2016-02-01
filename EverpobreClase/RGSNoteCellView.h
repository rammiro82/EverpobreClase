//
//  RGSNoteCellView.h
//  EverpobreClase
//
//  Created by Ramiro García Salazar on 30/1/16.
//  Copyright © 2016 Ramiro García Salazar. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RGSNote;

@interface RGSNoteCellView : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *photoView;
@property (weak, nonatomic) IBOutlet UILabel *modificationDateView;
@property (weak, nonatomic) IBOutlet UILabel *titleView;
@property (weak, nonatomic) IBOutlet UIImageView *locationView;


-(void) observeNote:(RGSNote*) note;

@end
