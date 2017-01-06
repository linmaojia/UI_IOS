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
#import "UIButton+JWCenter.h"
@interface DEMO6_VC ()

@property (nonatomic, strong) UIButton *editBtn;

@end

@implementation DEMO6_VC
- (UIButton *)editBtn {
    if (!_editBtn) {
        _editBtn = [[UIButton alloc]init];
        [_editBtn setImage:[UIImage imageNamed:@"tab_service"] forState:UIControlStateNormal];
        [_editBtn.imageView setContentMode:UIViewContentModeScaleAspectFit];
        [_editBtn setTitle:@"分享链接" forState:0];
        [_editBtn setTitleColor:[UIColor blackColor] forState:0];
        _editBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        _editBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        _editBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 15, 0, 0);//标题居中左偏移15
        [_editBtn addTarget:self action:@selector(deleBtnClick:) forControlEvents:UIControlEventTouchDown];
        _editBtn.backgroundColor = [UIColor whiteColor];
        
    }
    return _editBtn;
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

#pragma mark ************** 添加子控件
- (void)addSubviewsForView
{
    [self.view addSubview:self.editBtn];
}
#pragma mark ************** 添加约束
- (void)addConstraintsForView
{
    [_editBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.view).offset(80);
        make.height.equalTo(@50);
        make.width.equalTo(@100);
    }];
}



@end
