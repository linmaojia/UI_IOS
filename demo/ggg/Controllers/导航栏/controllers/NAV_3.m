//
//  DEMO1_VC.m
//  ggg
//
//  Created by LXY on 16/9/29.
//  Copyright © 2016年 AVGD. All rights reserved.
//
/*
 导航栏隐藏
 导航栏透明（未完成）坑，都不要用透明处理
 
 */
#import "NAV_3.h"
#import "DEMO1_VC.h"
@interface NAV_3 ()
@property (nonatomic, strong) UIButton *deleBtn;
@property (nonatomic, strong) UIButton *returnBtn;
@property (nonatomic, assign) CGFloat alphaMemory;

@end

@implementation NAV_3
- (UIButton *)deleBtn {
    if (!_deleBtn) {
        _deleBtn=[[UIButton alloc]initWithFrame:CGRectMake(0, 80, SCREEN_WIDTH, 40)];
        [_deleBtn setTitle:@"前进" forState:UIControlStateNormal];
        [_deleBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        _deleBtn.titleLabel.font = systemFont(14);//标题文字大小
        _deleBtn.layer.borderWidth = 0.5;
        _deleBtn.layer.borderColor = RGB(227, 229, 230).CGColor;
        _deleBtn.layer.cornerRadius = 3;
        _deleBtn.layer.masksToBounds = YES;
        [_deleBtn addTarget:self action:@selector(deleBtnClick) forControlEvents:UIControlEventTouchDown];
        
    }
    return _deleBtn;
}
- (UIButton *)returnBtn {
    if (!_returnBtn) {
        _returnBtn=[[UIButton alloc]initWithFrame:CGRectMake(0, 150, SCREEN_WIDTH, 40)];
        [_returnBtn setTitle:@"前进" forState:UIControlStateNormal];
        [_returnBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        _returnBtn.titleLabel.font = systemFont(14);//标题文字大小
        _returnBtn.layer.borderWidth = 0.5;
        _returnBtn.layer.borderColor = RGB(227, 229, 230).CGColor;
        _returnBtn.layer.cornerRadius = 3;
        _returnBtn.layer.masksToBounds = YES;
        [_returnBtn addTarget:self action:@selector(returnClick) forControlEvents:UIControlEventTouchDown];
        
    }
    return _returnBtn;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addSubviewsForView];
    
    [self addConstraintsForView];
    
    [self setNav];
    
}
- (void)viewWillAppear:(BOOL)animated
{

    
 
     //隐藏导航栏
     [self.navigationController setNavigationBarHidden:YES animated:animated];
     [super viewWillAppear:animated];
   
    
    /*
     //设置导航栏颜色为透明
     [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
     [self.navigationController.navigationBar setShadowImage:[UIImage new]];
     */
}

- (void)viewWillDisappear:(BOOL)animated
{


  
     //隐藏导航栏
     [self.navigationController setNavigationBarHidden:NO animated:animated];
     [super viewWillDisappear:animated];
   
   
    
    /*
     //设置导航栏颜色为蓝色
     [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationbar"] forBarMetrics:UIBarMetricsDefault];
     
     */
    
    
}

#pragma mark ************** 设置导航栏
- (void)setNav
{
    self.view.backgroundColor = [UIColor grayColor];
}
- (void)deleBtnClick
{
    DEMO1_VC *vc = [[DEMO1_VC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)returnClick
{
     [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark ************** 添加子控件
- (void)addSubviewsForView
{
    [self.view addSubview:self.deleBtn];
    [self.view addSubview:self.returnBtn];

}
#pragma mark ************** 添加约束
- (void)addConstraintsForView
{
}



@end
