//
//  DEMO1_VC.m
//  ggg
//
//  Created by LXY on 16/9/29.
//  Copyright © 2016年 AVGD. All rights reserved.
/*
 
 隐藏返回按钮得字
 系统back
 修改返回按钮文字
 */

#import "NAV_2.h"

@interface NAV_2 ()

@end

@implementation NAV_2

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addSubviewsForView];
    
    [self addConstraintsForView];
    
    [self setNav];
    
}
#pragma mark ************** 设置导航栏
- (void)viewWillAppear:(BOOL)animated
{
    
}
- (void)setNav
{
   
    
    
    
}
/*
 隐藏返回按钮得字
 
 [[UIBarButtonItem appearance]setBackButtonTitlePositionAdjustment:UIOffsetMake(0,
 -60)forBarMetrics:UIBarMetricsDefault];
 
 将返回的字改为中文
 
 Info.plist 中
 Localization native development region    设为  china
 
 */
#pragma mark ************** 添加子控件
- (void)addSubviewsForView
{
}
#pragma mark ************** 添加约束
- (void)addConstraintsForView
{
}



@end
