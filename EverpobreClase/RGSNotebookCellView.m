//
//  RGSNotebookCellView.m
//  EverpobreClase
//
//  Created by Ramiro García Salazar on 30/1/16.
//  Copyright © 2016 Ramiro García Salazar. All rights reserved.
//

#import "RGSNotebookCellView.h"

@implementation RGSNotebookCellView

#pragma mark - Class methos
+(NSString *) cellId{
    return NSStringFromClass(self);
}
+(CGFloat) cellHeight{
    return 60;
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
