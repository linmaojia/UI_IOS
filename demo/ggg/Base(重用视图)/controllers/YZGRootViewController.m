//
//  YZGRootViewController.m
//  yzg
//
//  Created by AVGD—JK on 16/5/30.
//  Copyright © 2016年 AVGD. All rights reserved.
//

#import "YZGRootViewController.h"


@interface YZGRootViewController ()

@end

@implementation YZGRootViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"[%@]===已被创建",NSStringFromClass([self class]));
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = _titleStr;
    
    
    // ios7关于NavigationBar与布局重叠 问题
//    if( ([[[UIDevice currentDevice] systemVersion] doubleValue]>=7.0))
//    {
//        self.edgesForExtendedLayout= UIRectEdgeNone;
//    }
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}
- (void)dealloc
{
    NSLog(@"[%@]===已被释放",NSStringFromClass([self class]));
}

@end
