//
//  MJTextField.h
//  ggg
//
//  Created by LXY on 17/2/9.
//  Copyright © 2017年 AVGD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MJTextField : UIView
@property (strong, nonatomic) IBOutlet UITextField *mTextField;
@property (strong, nonatomic) IBOutlet UIButton *rightBtn;
@property (strong, nonatomic) IBOutlet UIButton *leftBtn;

@property (nonatomic,copy) void(^rightBtnBlock)(BOOL isSelect);

@end
