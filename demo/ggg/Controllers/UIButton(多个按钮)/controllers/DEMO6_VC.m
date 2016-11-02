//
//  DEMO1_VC.m
//  ggg
//
//  Created by LXY on 16/9/29.
//  Copyright © 2016年 AVGD. All rights reserved.
//

#import "DEMO6_VC.h"
#import "Reachability.h"
#import "MJMoreBtnView.h"
@interface DEMO6_VC ()

@property (nonatomic, strong) MJMoreBtnView *mjMoreBtnView;

@end

@implementation DEMO6_VC
- (MJMoreBtnView *)mjMoreBtnView{
    if(!_mjMoreBtnView){
        
        NSArray *imageArray = @[@"icon_obligation",@"icon_committed",@"icon_Receipt",@"icon_order"];
        NSArray *titleArray = @[@"待付款",@"待发货",@"待收货",@"我的订单"];
        
        CGRect frame = CGRectMake(0, 0, SCREEN_WIDTH, 80);
        _mjMoreBtnView = [[MJMoreBtnView alloc]initWithFrame:frame];
        [_mjMoreBtnView crearBtnViewWithTitle:titleArray ImgArray:imageArray];
        _mjMoreBtnView.titleBlock = ^(NSString *title)
        {
            NSLog(@"----%@",title);
        };
    }
    return _mjMoreBtnView;
}
- (void)viewDidLoad {
    [super viewDidLoad];

    
    [self addSubviewsForView];
    
    [self addConstraintsForView];
    
    [self setNav];
    
}

-(void)webViewDidFinishLoad:(UIWebView*)webView
{
    [SVProgressHUD dismiss];
}
#pragma mark ************** 设置导航栏
- (void)setNav
{
    
}

#pragma mark ************** 添加子控件
- (void)addSubviewsForView
{
    [self.view addSubview:self.mjMoreBtnView];
}
#pragma mark ************** 添加约束
- (void)addConstraintsForView
{

}



@end
