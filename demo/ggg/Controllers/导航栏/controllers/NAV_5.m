//
//  DEMO1_VC.m
//  ggg
//
//  Created by LXY on 16/9/29.
//  Copyright © 2016年 AVGD. All rights reserved.
//

#import "NAV_5.h"

@interface NAV_5 ()

@end

@implementation NAV_5

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addSubviewsForView];
    
    [self addConstraintsForView];
    
    [self setNav];
    
}
#pragma mark ************** 设置导航栏
- (void)setNav
{
    
    //文字
   UIBarButtonItem *editItem = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(backAction)];
    self.navigationItem.rightBarButtonItem = editItem;
    
    //图片
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.frame = CGRectMake(0, 0, 35, 35);
    imageView.backgroundColor = [UIColor redColor];
    imageView.image = [UIImage imageNamed:@"imgd"];
    imageView.layer.cornerRadius = 20;
    imageView.layer.masksToBounds = YES;
    UIBarButtonItem *rbutItems = [[UIBarButtonItem alloc] initWithCustomView:imageView];
     self.navigationItem.leftBarButtonItem = rbutItems;

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
