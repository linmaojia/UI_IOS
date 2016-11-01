//
//  YZGAlertView.m
//  Masonry
//
//  Created by LXY on 16/6/14.
//  Copyright © 2016年 AVGD. All rights reserved.
//

#import "YZGAlertView.h"
static float const ALERTVIEW_HEIGHT = 130;  /**< 提示框宽度 */
static float const ALERTVIEW_WIDTH = 250;  /**< 提示框高度 */


@interface YZGAlertView()

@property (nonatomic,copy) void(^confirmBlock)();     /**< 确定按钮点击 */
@property (nonatomic,copy) void(^cancelBlock)();     /**< 取消按钮点击 */

@property (nonatomic, strong) UIButton *confirmBtn;
@property (nonatomic, strong) UIButton *cancelBtn;
@property (nonatomic, strong) UILabel *titleLab;
@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) UIView *centerView;

@end

@implementation YZGAlertView

- (UIButton *)cancelBtn
{
    if (!_cancelBtn)
    {
        _cancelBtn=[[UIButton alloc]init];
        [_cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        [_cancelBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _cancelBtn.titleLabel.font = systemFont(14);//标题文字大小
        [_cancelBtn addTarget:self action:@selector(cancelBtnClick:) forControlEvents:UIControlEventTouchDown];
    }
    return _cancelBtn;
}
- (UIButton *)confirmBtn
{
    if (!_confirmBtn)
    {
        _confirmBtn=[[UIButton alloc]init];
        [_confirmBtn setTitle:@"确定" forState:UIControlStateNormal];
        [_confirmBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _confirmBtn.titleLabel.font = systemFont(14);//标题文字大小
        _confirmBtn.backgroundColor = mainColor;
        [_confirmBtn addTarget:self action:@selector(confirmBtnClick:) forControlEvents:UIControlEventTouchDown];
    }
    return _confirmBtn;
}
- (UIView *)lineView
{
    if (!_lineView)
    {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = RGB(227, 229, 230);
    }
    return _lineView;
}
- (UIView *)centerView
{
    if (!_centerView)
    {
        _centerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, AUTO_MATE_WIDTH(ALERTVIEW_WIDTH), AUTO_MATE_HEIGHT(ALERTVIEW_HEIGHT))];
        _centerView.center = self.center;
        _centerView.layer.cornerRadius = 10;
        _centerView.clipsToBounds = YES;
        _centerView.backgroundColor = [UIColor whiteColor];
        _centerView.alpha = 0;
        
    }
    return _centerView;
}
- (UILabel *)titleLab
{
    if (!_titleLab)
    {
        _titleLab = [[UILabel alloc] init];
        _titleLab.text = @"是否清除全部选项";
        _titleLab.textAlignment = NSTextAlignmentCenter;
        _titleLab.font = [UIFont systemFontOfSize:14];
        _titleLab.numberOfLines = 0;
    }
    return _titleLab;
}

+ (void)showAlertViewWithTitle:(NSString *)title ConfirmBlock:(void(^)())confirmBlock CancelBlock:(void(^)())cancelBlock
{
    
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    
    YZGAlertView *blackView = [[YZGAlertView alloc] initWithFrame:keyWindow.frame];//黑色阴影
    [keyWindow addSubview:blackView];
    
    blackView.titleLab.text = title;
    
    blackView.confirmBlock = confirmBlock;
    blackView.cancelBlock = cancelBlock;
    
    
}
#pragma mark **************** init
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.backgroundColor = RGBA(0, 0, 0, 0);
        self.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)];
        [self addGestureRecognizer:tap];//添加手势
        
        [self addSubviewsForAlertView];//添加子控件
        [self layoutSubviewsForAlertView];//布局子控件
        [self show];
    }
    return self;
}
#pragma mark ************** 显示
- (void)show {
    
    [UIView animateWithDuration:0.2f animations:^{
        [self setBackgroundColor:RGBA(0, 0, 0, 0.5)];
         self.centerView.alpha = 1;
    } completion:nil];
}
#pragma mark ************** 消失
- (void)dismiss
{
    [UIView animateWithDuration:0.2 animations:^{
        self.backgroundColor = RGBA(0, 0, 0, 0);
        self.centerView.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}
#pragma mark ************** 取消
- (void)cancelBtnClick:(UIButton *)sender{
   [self dismiss];
    self.cancelBlock();
   
}
#pragma mark ************** 确定
- (void)confirmBtnClick:(UIButton *)sender{
     [self dismiss];
    self.confirmBlock();
}

#pragma mark **************** 添加子控件
- (void)addSubviewsForAlertView
{
    [self addSubview:self.centerView];
    
    [self.centerView addSubview:self.titleLab];
    [self.centerView addSubview:self.lineView];
    [self.centerView addSubview:self.confirmBtn];
    [self.centerView addSubview:self.cancelBtn];
    
}
#pragma mark **************** 添加约束
- (void)layoutSubviewsForAlertView {
    
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.centerView);
        make.right.left.equalTo(self.centerView);
        make.height.equalTo(@(AUTO_MATE_HEIGHT(80)));
    }];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_titleLab.bottom);
        make.right.left.equalTo(self.centerView);
        make.height.equalTo(@(0.5));
    }];
    [self.cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_lineView.bottom);
        make.left.bottom.equalTo(self.centerView);
        make.width.equalTo(@(AUTO_MATE_WIDTH(ALERTVIEW_WIDTH/2)));
    }];
    [self.confirmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_lineView.bottom);
        make.left.equalTo(_cancelBtn.right);
        make.bottom.right.equalTo(self.centerView);
    }];
}

@end
