//
//  MJTextField.m
//  ggg
//
//  Created by LXY on 17/2/9.
//  Copyright © 2017年 AVGD. All rights reserved.
//

#import "MJTextField.h"

@implementation MJTextField

/* 初始化ib */
- (void)awakeFromNib
{
    [super awakeFromNib];
    
}
- (IBAction)rightBtnClick:(id)sender {
    
    self.rightBtn.selected = !self.rightBtn.selected;

    if(self.rightBtnBlock)
        self.rightBtnBlock(self.rightBtn.selected);
}


@end
