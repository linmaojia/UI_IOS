//
//  YZGPickerView.m
//  Masonry
//
//  Created by LXY on 16/7/7.
//  Copyright © 2016年 AVGD. All rights reserved.
//

#import "YZGPickerView.h"

@interface YZGPickerView () <UIPickerViewDataSource,UIPickerViewDelegate>

@property (nonatomic, strong)NSArray *dataArray;
@property (nonatomic, strong)UIPickerView *pickerView;

@property (nonatomic,copy) void(^titleBtnBlock)(NSString *text);     /**< 按钮回调 */
@end

@implementation YZGPickerView

#pragma mark **************** init
- (UIPickerView *)pickerView
{
    if(!_pickerView)
    {
        //_pickerView = [[UIPickerView alloc]init]; //不能这样初始化
        _pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, self.frame.size.height, SCREEN_WIDTH, 200)];
        _pickerView.backgroundColor = [UIColor whiteColor];
        _pickerView.delegate = self;
        _pickerView.dataSource = self;
    }
    return _pickerView;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.backgroundColor = RGBA(0, 0, 0, 0);
        self.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)];
        [self addGestureRecognizer:tap];//添加手势
        
    }
    return self;
}
+ (void)showAlertViewWithTitleArray:(NSArray *)dataArray TitleBtnBlock:(void(^)(NSString *title))titleBtnBlock{
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    
    YZGPickerView *blackView = [[YZGPickerView alloc] initWithFrame:keyWindow.frame];//黑色阴影
    [keyWindow addSubview:blackView];
    
    blackView.dataArray = dataArray;
    blackView.titleBtnBlock = titleBtnBlock;
}

- (void)setDataArray:(NSArray *)dataArray{
    _dataArray = dataArray;
    
    [self addSubview:self.pickerView];
    [self show];//显示视图
}
- (void)show{
    [UIView animateWithDuration:0.3 animations:^{
        self.backgroundColor = RGBA(0, 0, 0, 0.5);
     
        CGRect frame = _pickerView.frame;
        frame.origin.y -= frame.size.height;
        _pickerView.frame = frame;
        
    }];
}

- (void)dismiss {
    [UIView animateWithDuration:0.3 animations:^{
        self.backgroundColor = RGBA(0, 0, 0, 0);
      
        CGRect frame = _pickerView.frame;
        frame.origin.y += frame.size.height;
        _pickerView.frame = frame;
        
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

#pragma mask --- pickerView 代理方法
//一共有多少列
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

//第component列一共有多少行
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return self.dataArray.count;
}
//第component列第row行显示怎样的view(内容)
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    return self.dataArray[row];
}
//选中了pickerView的第component列第row行
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    self.titleBtnBlock(self.dataArray[row]);
    
}
@end
