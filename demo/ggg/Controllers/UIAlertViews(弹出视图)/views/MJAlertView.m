//
//  YZGAlertView.m
//  Masonry
//
//  Created by LXY on 16/6/14.
//  Copyright © 2016年 AVGD. All rights reserved.
//

#import "MJAlertView.h"

@interface MJAlertView()

@property (nonatomic,copy) void(^confirmBlock)();     /**< 确定按钮点击 */
@property (nonatomic,copy) void(^cancelBlock)();     /**< 取消按钮点击 */

@property (nonatomic, strong) UIButton *confirmBtn;
@property (nonatomic, strong) UIButton *cancelBtn;
@property (nonatomic, strong) UILabel *titleLab;
@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) UIView *centerView;

@end

@implementation MJAlertView

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
        _lineView.backgroundColor = [UIColor colorWithRed:227/255.0 green:229/255.0 blue:230/255.0 alpha:1];
    }
    return _lineView;
}
- (UIView *)centerView
{
    if (!_centerView)
    {
        _centerView = [[UIView alloc]initWithFrame:CGRectZero];
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
    MJAlertView *blackView = [[MJAlertView alloc] initWithFrame:keyWindow.frame];//黑色阴影
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
        self.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0];
        self.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)];
        [self addGestureRecognizer:tap];//添加手势
        
        [self addSubviewsForAlertView];//添加子控件
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
#pragma mark ************** 父控件布局完成
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat ALERTVIEW_H = 130;  /**< 提示框高度 */
    CGFloat ALERTVIEW_W = 250;  /**< 提示框宽度 */
    CGFloat lab_H = 80;
    CGFloat lineView_H = 0.5;
    CGFloat btn_W = ALERTVIEW_W/2;
    CGFloat btn_H = ALERTVIEW_H - lab_H - lineView_H;

    
    _centerView.frame = CGRectMake(0, 0, ALERTVIEW_W, ALERTVIEW_H);
    _centerView.center = self.center;
    _titleLab.frame = CGRectMake(0, 0, ALERTVIEW_W, lab_H);
    _lineView.frame = CGRectMake(0, _titleLab.frame.size.height, ALERTVIEW_W, lineView_H);
    
    CGFloat lineView_y = _lineView.frame.origin.y + _lineView.frame.size.height;
    _cancelBtn.frame = CGRectMake(0, lineView_y, btn_W, btn_H);
    _confirmBtn.frame = CGRectMake(btn_W, lineView_y, btn_W, btn_H);


}

@end
