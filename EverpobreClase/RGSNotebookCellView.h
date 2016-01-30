//
//  RGSNotebookCellView.h
//  EverpobreClase
//
//  Created by Ramiro García Salazar on 30/1/16.
//  Copyright © 2016 Ramiro García Salazar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RGSNotebookCellView : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel *nameView;
@property (nonatomic, strong) IBOutlet UILabel *numberOfNotesView;

+(NSString *) cellId;
+(CGFloat) cellHeight;
@end
