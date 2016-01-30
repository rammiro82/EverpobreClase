//
//  RGSNoteCellView.h
//  EverpobreClase
//
//  Created by Ramiro García Salazar on 30/1/16.
//  Copyright © 2016 Ramiro García Salazar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RGSNoteCellView : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *photoView;
@property (weak, nonatomic) IBOutlet UILabel *modificationDateView;
@property (weak, nonatomic) IBOutlet UILabel *titleView;

@end
