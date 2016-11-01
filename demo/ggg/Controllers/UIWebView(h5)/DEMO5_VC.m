//
//  DEMO1_VC.m
//  ggg
//
//  Created by LXY on 16/9/29.
//  Copyright © 2016年 AVGD. All rights reserved.
//

#import "DEMO5_VC.h"
#import "Reachability.h"
@interface DEMO5_VC ()<UIWebViewDelegate>

@property (nonatomic, strong) UIWebView *webView;/**< webView */

@end

@implementation DEMO5_VC
- (UIWebView *)webView {
    if (!_webView) {
        _webView = [[UIWebView alloc] init];
        _webView.delegate = self;
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:APIHelpCenter]];
        [_webView loadRequest:request];
        
    }
    return _webView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self netWork];//监听网络状态
    
    [self addSubviewsForView];
    
    [self addConstraintsForView];
    
    [self setNav];
    
}
- (void)netWork{
    
    Reachability* reach = [Reachability reachabilityWithHostName:@"www.baidu.com"];
    NetworkStatus status = [reach currentReachabilityStatus];
    switch (status) {
        case NotReachable:
            [SVProgressHUD showErrorWithStatus:@"没网络"];
            break;
        default:
            [SVProgressHUD show];
            break;
    }
    
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
    [self.view addSubview:self.webView];
}
#pragma mark ************** 添加约束
- (void)addConstraintsForView
{
    
    [_webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}



@end
