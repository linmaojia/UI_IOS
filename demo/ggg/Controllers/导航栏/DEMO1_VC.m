//
//  DEMO1_VC.m
//  ggg
//
//  Created by LXY on 16/9/29.
//  Copyright © 2016年 AVGD. All rights reserved.
//

#import "DEMO1_VC.h"
#import "NAV_1.h"
#import "NAV_2.h"
#import "NAV_3.h"
#import "NAV_4.h"
#import "NAV_5.h"
#import "NAV_6.h"
@interface DEMO1_VC ()
{
    NSMutableArray *buttonArray;    /**< 按钮数组 */
}
@property (nonatomic, strong) UIView *bottomView;    /**< 底部视图 */
@property (nonatomic, strong) NSArray *classArray;    /**< 类名数组 */

@end

@implementation DEMO1_VC
- (NSArray *)classArray {
    if (!_classArray) {
        _classArray = @[[NAV_1 class],[NAV_2 class],[NAV_3 class],[NAV_4 class],[NAV_5 class],[NAV_6 class]];
        
    }
    return _classArray;
}
- (UIView *)bottomView{
    
    if(!_bottomView){
        
        buttonArray = [NSMutableArray new];//使用数组约束
        _bottomView = [[UIView alloc]init];
        _bottomView.backgroundColor = [UIColor whiteColor];
        NSArray *array = @[@"自定义-back",@"系统-back",@"导航栏透明-隐藏",@"item",@"文本，图片",@"上滑隐藏导航栏"];
        for(int i=0;i<array.count;i++){
            
            UIButton *button=[UIButton buttonWithType:UIButtonTypeSystem];
            
            button.backgroundColor = RGB(238, 91, 40);
            [button setTitleColor:[UIColor whiteColor] forState:0];
            [button setTitle:array[i] forState:UIControlStateNormal];
            button.titleLabel.font= boldSystemFont(15);
            button.tag=100+i;
            [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
            [self.bottomView addSubview:button];
            [buttonArray addObject:button];
            
        }
        
        
    }
    return _bottomView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addSubviewsForView];
    
    [self addConstraintsForView];
    
    [self setNav];
    
}
#pragma mark ************** 设置导航栏
- (void)setNav
{
    
}
- (void)viewWillAppear:(BOOL)animated
{

}
#pragma mark ************************* 监听button方法
-(void)buttonAction:(UIButton *)sender{
    
    self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;//添加手势左滑返回
    
    switch (sender.tag) {
        case 100:{
            NAV_1 *vc = [[NAV_1 alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 101:{
            NAV_2 *vc = [[NAV_2 alloc]init];
            
            
            UIBarButtonItem *backItem = [[UIBarButtonItem alloc] init];
            backItem.title = @"返回";
            self.navigationItem.backBarButtonItem = backItem;
            
            [self.navigationController pushViewController:vc animated:YES];
            
        }
            break;
        case 102:{
            NAV_3 *vc = [[NAV_3 alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
            
        }
            break;
        case 103:{
            NAV_4 *vc = [[NAV_4 alloc]init];
            
            UIBarButtonItem *backItem = [[UIBarButtonItem alloc] init];
            backItem.title = @"返回";
            self.navigationItem.backBarButtonItem = backItem;
            
            [self.navigationController pushViewController:vc animated:YES];
            
        }
            break;
        case 104:{
            NAV_5 *vc = [[NAV_5 alloc]init];
     
            [self.navigationController pushViewController:vc animated:YES];
            
        }
            break;
        case 105:{
            NAV_6 *vc = [[NAV_6 alloc]init];
            
            [self.navigationController pushViewController:vc animated:YES];
            
        }
            break;
        default:
            break;
    }

    
    
    
    
    

    
}

#pragma mark ************** 添加子控件
- (void)addSubviewsForView
{
     [self.view addSubview:self.bottomView];
}
#pragma mark ************** 添加约束
- (void)addConstraintsForView
{
   
    
    [_bottomView makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.equalTo(@200);
        make.top.bottom.equalTo(self.view);
    }];
    
    //平均分配 水平
    
    [buttonArray mas_distributeViewsAlongAxis:MASAxisTypeVertical withFixedSpacing:5 leadSpacing:5 tailSpacing:5];
    [buttonArray makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.equalTo(@200);
        make.left.equalTo(self.bottomView);
    }];
}



@end
