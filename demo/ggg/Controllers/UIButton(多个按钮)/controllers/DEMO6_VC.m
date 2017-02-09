//
//  DEMO1_VC.m
//  ggg
//
//  Created by LXY on 16/9/29.
//  Copyright © 2016年 AVGD. All rights reserved.

// UIEdgeInsetsMake的使用
// http://blog.csdn.net/nlforever/article/details/12967371
// http://www.jianshu.com/p/be4543ad4960    网址

#import "DEMO6_VC.h"
#import "Reachability.h"
#import "UIButton+JWCenter.h"
@interface DEMO6_VC ()

@property (nonatomic, strong) UIButton *leftBtn;
@property (nonatomic, strong) UIButton *rightBtn;
@property (nonatomic, strong) UIButton *topBtn;
@property (nonatomic, strong) UIButton *bottonBtn;

@property (nonatomic, strong) UIButton *WBtn;


@end

@implementation DEMO6_VC
- (UIButton *)bottonBtn {
    if (!_bottonBtn) {
        // 创建自定义按钮
        UIButton *btn_click = [UIButton buttonWithType:UIButtonTypeCustom];
        
        btn_click.frame =CGRectMake(0,280, SCREEN_WIDTH/3,59);
        //创建普通状态按钮图片
        [btn_click setImage:[UIImage imageNamed:@"tab_service"]forState:UIControlStateNormal];
        //创建高亮或选中状态按钮图片
        [btn_click setImage:[UIImage imageNamed:@"iconfont-SHOP-60x60"]forState:UIControlStateHighlighted];
        
        //设置按钮普通状态标题
        [btn_click setTitle:@"我的主帖"forState:UIControlStateNormal];
        // 设置按钮字体
        btn_click.titleLabel.font = [UIFont systemFontOfSize:14];
        //设置按钮普通状态标题颜色
        [btn_click setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        //设置按钮高亮或选中状态标题颜色
        [btn_click setTitleColor:[UIColor yellowColor] forState:UIControlStateHighlighted];
        // 设置按钮背颜色
        [btn_click setBackgroundColor:[UIColor grayColor]];
        //按钮按下后的模糊状态
        [btn_click setAdjustsImageWhenHighlighted:NO];
        //按钮图片和标题总高度
        // 图片和标题相差距离
        CGFloat spaceHeight = 20;
        //设置按钮标题偏移(先写)
        [btn_click setTitleEdgeInsets:UIEdgeInsetsMake(-spaceHeight, -btn_click.imageView.frame.size.width, 0.0,0.0)];
        //设置按钮图片偏移
        [btn_click setImageEdgeInsets:UIEdgeInsetsMake(spaceHeight,0.0, -10, -btn_click.titleLabel.frame.size.width)];
        
        _bottonBtn = btn_click;
    }
    return _bottonBtn;
}
- (UIButton *)topBtn {
    if (!_topBtn) {
        // 创建自定义按钮
        UIButton *btn_click = [UIButton buttonWithType:UIButtonTypeCustom];
        
         btn_click.frame =CGRectMake(0,200, SCREEN_WIDTH/3,59);
        //创建普通状态按钮图片
        [btn_click setImage:[UIImage imageNamed:@"tab_service"]forState:UIControlStateNormal];
        //创建高亮或选中状态按钮图片
        [btn_click setImage:[UIImage imageNamed:@"iconfont-SHOP-60x60"]forState:UIControlStateHighlighted];
        
        //设置按钮普通状态标题
        [btn_click setTitle:@"我的主帖"forState:UIControlStateNormal];
        // 设置按钮字体
        btn_click.titleLabel.font = [UIFont systemFontOfSize:14];
        //设置按钮普通状态标题颜色
        [btn_click setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        //设置按钮高亮或选中状态标题颜色
        [btn_click setTitleColor:[UIColor yellowColor] forState:UIControlStateHighlighted];
        // 设置按钮背颜色
        [btn_click setBackgroundColor:[UIColor grayColor]];
        //按钮按下后的模糊状态
        [btn_click setAdjustsImageWhenHighlighted:NO];
        //按钮图片和标题总高度
        // 图片和标题相差距离
        CGFloat spaceHeight = 20;
        //设置按钮标题偏移(先写)
        [btn_click setTitleEdgeInsets:UIEdgeInsetsMake(spaceHeight, -btn_click.imageView.frame.size.width, -10,0.0)];
        //设置按钮图片偏移
        [btn_click setImageEdgeInsets:UIEdgeInsetsMake(-spaceHeight,0.0, 0.0, -btn_click.titleLabel.frame.size.width)];
        
        _topBtn = btn_click;
    }
    return _topBtn;
}
- (UIButton *)rightBtn {
    if (!_rightBtn) {
        UIButton *button=[[UIButton alloc]init];
        button.frame = CGRectMake(10, 80, 100, 50);
        [button setImage:[UIImage imageNamed:@"tab_service"] forState:UIControlStateNormal];
        [button setTitle:@"右边图片" forState:0];
        [button setTitleColor:[UIColor blackColor] forState:0];
        button.titleLabel.font = [UIFont systemFontOfSize:13];
        button.titleEdgeInsets = UIEdgeInsetsMake(0, -button.imageView.frame.size.width - 5, 0, button.imageView.frame.size.width + 5);//标题居中左偏移15（上左下右）
        button.imageEdgeInsets = UIEdgeInsetsMake(0, button.titleLabel.frame.size.width + 5, 0, -button.titleLabel.frame.size.width - 5);//标题居中左偏移15
        [button addTarget:self action:@selector(deleBtnClick) forControlEvents:UIControlEventTouchDown];
        button.backgroundColor = [UIColor grayColor];
        _rightBtn = button;
    }
    return _rightBtn;
}
- (UIButton *)leftBtn {
    if (!_leftBtn) {
        UIButton *button=[[UIButton alloc]init];
         button.frame = CGRectMake(10, 20, 100, 50);
        [button setImage:[UIImage imageNamed:@"tab_service"] forState:UIControlStateNormal];
        [button setTitle:@"左边图片" forState:0];
        [button setTitleColor:[UIColor blackColor] forState:0];
        button.titleLabel.font = [UIFont systemFontOfSize:13];
        button.titleLabel.textAlignment = NSTextAlignmentCenter;
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 15, 0, 0);//标题居中左偏移15（上左下右）
        [button addTarget:self action:@selector(deleBtnClick) forControlEvents:UIControlEventTouchDown];
        button.backgroundColor = [UIColor whiteColor];
        //按钮按下后的模糊状态
        [button setAdjustsImageWhenHighlighted:NO];
        _leftBtn = button;
    }
    return _leftBtn;
}
- (UIButton *)WBtn {
    if (!_WBtn) {
        UIButton *button=[[UIButton alloc]init];
        button.frame = CGRectMake(10, 400, 100, 60);
        [button setImage:[UIImage imageNamed:@"tab_service"] forState:UIControlStateNormal];
        [button setTitle:@"左边图片" forState:0];
        [button setTitleColor:[UIColor blackColor] forState:0];
        button.titleLabel.font = [UIFont systemFontOfSize:13];
        [button addTarget:self action:@selector(deleBtnClick) forControlEvents:UIControlEventTouchDown];
        button.backgroundColor = [UIColor grayColor];
//        [button centerStyle:CenterButtonImageStyleTop padding:10];
        [button centerStyle:CenterButtonImageStyleBottom padding:10];//调用分类

        _WBtn = button;
    }
    return _WBtn;
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
#pragma mark ************** 设置导航栏
- (void)deleBtnClick
{
    
}
#pragma mark ************** 添加子控件
- (void)addSubviewsForView
{
    [self.view addSubview:self.leftBtn];
    [self.view addSubview:self.rightBtn];
    [self.view addSubview:self.topBtn];
    [self.view addSubview:self.bottonBtn];
    [self.view addSubview:self.WBtn];

}
#pragma mark ************** 添加约束
- (void)addConstraintsForView
{
   
   

}



@end
