//
//  YZGPickerView.m
//  Masonry
//
//  Created by LXY on 16/7/7.
//  Copyright © 2016年 AVGD. All rights reserved.
//

#import "YZGDatePicker.h"

@interface YZGDatePicker ()

@property (nonatomic, strong)UIDatePicker *datePicker;
@property (nonatomic, strong) UIView *bgView;     /**< 白色背景View */
@property (nonatomic,copy) void(^titleBtnBlock)(NSString *text);     /**< 按钮回调 */
@property (nonatomic, strong) UIButton *confirmBtn;    /**< 取消按钮 */
@property (nonatomic, strong) NSString *dataString;    /**< 时间 */

@end

@implementation YZGDatePicker

#pragma mark **************** init
- (UIButton *)confirmBtn {
    if (!_confirmBtn) {
        _confirmBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        _confirmBtn.frame = CGRectMake(self.frame.size.width - 40, 0, 40, 40);
        [_confirmBtn setTitle:@"完成" forState:UIControlStateNormal];
        [_confirmBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_confirmBtn addTarget:self action:@selector(confirmAction) forControlEvents:UIControlEventTouchDown];
    }
    return _confirmBtn;
}
- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [[UIView alloc] initWithFrame:CGRectMake(0,self.frame.size.height,self.frame.size.width,240)];
        _bgView.backgroundColor = [UIColor whiteColor];
    }
    return _bgView;
}
- (UIDatePicker *)datePicker
{
    if(!_datePicker)
    {
        _datePicker = [ [ UIDatePicker alloc] initWithFrame:CGRectMake(0,40,self.frame.size.width,200)];
        //设置最小日期
        NSDateFormatter  * formatter = [[ NSDateFormatter   alloc ] init ];
        [formatter  setDateFormat : @"yyyy-MM-dd" ];
        NSString  * mindateStr =  @"1900-01-01" ;
        
        NSDate * mindate = [formatter  dateFromString :mindateStr];
        NSDate * currentDate = [NSDate date];
        _datePicker.minimumDate = mindate;
        _datePicker.maximumDate = currentDate;//设置最大日期
        
        
        
        // 设置picker的显示模式：只显示日期
        _datePicker.datePickerMode = UIDatePickerModeDate;
        // 设置区域为中国简体中文
        _datePicker.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
        [_datePicker addTarget:self action:@selector(pickerValueChanged:) forControlEvents:UIControlEventValueChanged];
        [self addSubview: _datePicker];
        
     
    }
    return _datePicker;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
        self.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)];
        [self addGestureRecognizer:tap];//添加手势
        
         [self creatView];  //创建时间视图
        
    }
    return self;
}
+ (void)showAlertViewWithTitle:(NSString *)dataString TitleBtnBlock:(void(^)(NSString *title))titleBtnBlock{
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    
    YZGDatePicker *blackView = [[YZGDatePicker alloc] initWithFrame:keyWindow.frame];//黑色阴影
    [keyWindow addSubview:blackView];
    
    blackView.dataString = dataString;
    blackView.titleBtnBlock = titleBtnBlock;
}
#pragma mark ************** 创建视图
- (void)creatView
{
    [self addSubview:self.bgView];
    [self.bgView addSubview:self.confirmBtn];

    [self.bgView addSubview:self.datePicker];

}
- (void)setDataString:(NSString *)dataString{
   
    NSDateFormatter  * formatter = [[ NSDateFormatter   alloc ] init ];
    [formatter  setDateFormat : @"yyyy-MM-dd" ];
    
     NSDate * mindate = [formatter  dateFromString :dataString];
    
     _datePicker.date = mindate;
    
     [self show];//显示视图
}
//时刻监听
- (void)pickerValueChanged:(UIDatePicker *)sender
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    
   
//    NSLog(@"%@",[formatter stringFromDate:sender.date]);
    
    
}
#pragma mark ************** 完成回调
- (void)confirmAction{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *str = [formatter stringFromDate:_datePicker.date];
    
    self.titleBtnBlock(str);
    
    [self dismiss];
}
- (void)show{
    [UIView animateWithDuration:0.3 animations:^{
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
     
        CGRect frame = _bgView.frame;
        frame.origin.y -= frame.size.height;
        _bgView.frame = frame;
        
    }];
}

- (void)dismiss {
    [UIView animateWithDuration:0.3 animations:^{
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
      
        CGRect frame = _bgView.frame;
        frame.origin.y += frame.size.height;
        _bgView.frame = frame;
        
    } completion:^(BOOL finished) {
   
        [self removeFromSuperview];
  
        
    }];
}

@end
