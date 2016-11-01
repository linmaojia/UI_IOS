//
//  DEMO1_VC.m
//  ggg
//
//  Created by LXY on 16/9/29.
//  Copyright © 2016年 AVGD. All rights reserved.
/*
 
 自定义Back 按钮，左滑返回
 */

#import "NAV_1.h"

@interface NAV_1 ()

@end

@implementation NAV_1

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addSubviewsForView];
    
    [self addConstraintsForView];
    
    [self setNav];
    
}
#pragma mark ************** 设置导航栏
- (void)setNav
{
    self.title = @"关于";
    self.view.backgroundColor = RGB(235, 235, 241);
    
    UIButton  *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftBtn setImage:[UIImage imageNamed:@"nav_back"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    leftBtn.frame = CGRectMake(0, 0, 40, 40);
    [leftBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //将leftItem设置为自定义按钮
    leftBtn.contentEdgeInsets = UIEdgeInsetsMake(0, -40, 0, 0);
    UIBarButtonItem  *leftItem =[[UIBarButtonItem alloc]initWithCustomView: leftBtn];
    self.navigationItem.leftBarButtonItem = leftItem;
    self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;//添加手势左滑返回
    
    
}
- (void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark ************** 添加子控件
- (void)addSubviewsForView
{
}
#pragma mark ************** 添加约束
- (void)addConstraintsForView
{
}



@end
