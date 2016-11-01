//
//  DEMO1_VC.m
//  ggg
//
//  Created by LXY on 16/9/29.
//  Copyright © 2016年 AVGD. All rights reserved.
//

#import "NAV_4.h"

@interface NAV_4 ()

@end

@implementation NAV_4

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addSubviewsForView];
    
    [self addConstraintsForView];
    
    [self setNav];
    
}
#pragma mark ************** 设置导航栏
- (void)setNav
{
#pragma mark ************** 第一种
    //
    //    //左边图片
    //    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    //    [leftButton setImage:[UIImage imageNamed:@"go_back"] forState:UIControlStateNormal];
    //    [leftButton.imageView setContentMode:UIViewContentModeScaleAspectFit];
    //    leftButton.frame = CGRectMake(0, 0, 40, 40);
    //    [leftButton addTarget:self action:@selector(editCell:) forControlEvents:UIControlEventTouchUpInside];
    //    leftButton.contentEdgeInsets = UIEdgeInsetsMake(0, -40, 0, 0);//向左偏移
    //    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    //
    //    //左边文字
    //    UIButton *rbut = [UIButton buttonWithType:UIButtonTypeCustom];
    //     [rbut setTitle:@"返回" forState:UIControlStateNormal];
    //    rbut.frame = CGRectMake(0, 0, 40, 40);
    //    [rbut addTarget:self action:@selector(editCell:) forControlEvents:UIControlEventTouchUpInside];
    //    rbut.contentEdgeInsets = UIEdgeInsetsMake(0, -80, 0, 0);//向左偏移
    //    UIBarButtonItem *rbutItem = [[UIBarButtonItem alloc] initWithCustomView:rbut];
    //
    //    self.navigationItem.leftBarButtonItems = @[leftBtn,rbutItem];
    //
    //    self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;
    
    
#pragma mark ************** 第二种
    //    UIButton *leftButton = [[UIButton alloc]init];
    //    leftButton.frame = CGRectMake(0, 0, 80, 40);
    //    [leftButton setTitle:@"返回" forState:UIControlStateNormal];
    //    [leftButton.imageView setContentMode:UIViewContentModeScaleAspectFit];
    //    leftButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    //    leftButton.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);//标题居中左偏移15
    //    [leftButton setImage:[UIImage imageNamed:@"go_back"] forState:UIControlStateNormal];
    //
    //    //高亮状态的颜色
    //    [leftButton setImage:[UIImage imageNamed:@"go_back"] forState:UIControlStateNormal|UIControlStateHighlighted];
    //
    //    [leftButton addTarget:self action:@selector(editCell:) forControlEvents:UIControlEventTouchUpInside];
    //    leftButton.contentEdgeInsets = UIEdgeInsetsMake(0, -40, 0, 0);//向左偏移
    //    UIBarButtonItem *rbutItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    //    self.navigationItem.leftBarButtonItem = rbutItem;
    //    self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;
    
    
    
    
    //图片
    UIImage *backImage = [[UIImage imageNamed:@"nav_back"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 25, 0, 0)];
    
    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:backImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
    
#pragma mark ************** 右边
    
    
    
    
    UIButton *rightButton = [[UIButton alloc]init];
    //    rightButton.backgroundColor = [UIColor grayColor];
    rightButton.frame = CGRectMake(0, 0, 100, 30);
    [rightButton setTitle:@"保存" forState:UIControlStateNormal];
    rightButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [rightButton setImage:[UIImage imageNamed:@"gou1"] forState:UIControlStateNormal];
    [rightButton.imageView setContentMode:UIViewContentModeScaleAspectFit];
    //高亮状态的颜色
    [rightButton setImage:[UIImage imageNamed:@"gou1"] forState:UIControlStateNormal|UIControlStateHighlighted];
    
    [rightButton addTarget:self action:@selector(editCell:) forControlEvents:UIControlEventTouchUpInside];
    rightButton.contentEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);//向右边偏移,注意点
    UIBarButtonItem *rbutItems = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    
    if(([[[UIDevice currentDevice] systemVersion] floatValue]>=7.0?20:0)){
        UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                           initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                           target:nil action:nil];
        negativeSpacer.width = -15;//注意点
        self.navigationItem.rightBarButtonItems = @[negativeSpacer, rbutItems];
    }
    else{
        self.navigationItem.rightBarButtonItem = rbutItems;
    }
    
    

}
#pragma mark - 监听button方法
- (void)editCell:(UIButton *)sender {
    NSLog(@"点击了左边");
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
