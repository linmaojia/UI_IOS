//
//  DEMO1_VC.m
//  ggg
//
//  Created by LXY on 16/9/29.
//  Copyright © 2016年 AVGD. All rights reserved.
//

#import "DEMO4_VC.h"
#import "MJTextViews.h"
#import "JKPlaceholderTextView.h"
@interface DEMO4_VC ()

@property (nonatomic, strong) MJTextViews *textView;    /**< 自定义textView */
@property (nonatomic, strong)  JKPlaceholderTextView *centerText;   /**< textView字体垂直居中 */

@end

@implementation DEMO4_VC
- (JKPlaceholderTextView *)centerText {
    if (!_centerText) {
        _centerText = [[JKPlaceholderTextView alloc] init];
        _centerText.textColor = [UIColor blackColor];
        _centerText.backgroundColor = RGB(227, 229, 230);
        _centerText.font = [UIFont systemFontOfSize:15];
        _centerText.text = @"请详细描述需要反馈的问题";
        [_centerText addObserver:self forKeyPath:@"contentSize" options:NSKeyValueObservingOptionNew context:nil];//垂直居中
        
    }
    return _centerText;
}
- (MJTextViews *)textView {
    if (!_textView) {
        _textView = [[MJTextViews alloc]init];
        _textView.limitTextLength = 200;
        _textView.layer.borderWidth = 0.5;
        _textView.layer.borderColor = RGB(227, 229, 230).CGColor;
        _textView.placehoderText = @"请详细描述需要反馈的问题";
        _textView.limitTextLengthBlock = ^(){
            [SVProgressHUD showErrorWithStatus:@"超出字数限制"];
        };
    }
    return _textView;
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
#pragma mark ************************* 移除kvo
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    UITextView *mText = object;
    
    CGFloat topCorrect = ([mText bounds].size.height - [mText contentSize].height);
    
    topCorrect = (topCorrect <0.0 ?0.0 : topCorrect);
    
    mText.contentOffset = (CGPoint){.x =0, .y = -topCorrect/2};
    
}
- (void)dealloc{
    
    [_centerText removeObserver:self forKeyPath:@"contentSize" context:nil];
}
#pragma mark ************** 添加子控件
- (void)addSubviewsForView
{
   
    [self.view addSubview:self.textView];
    [self.view addSubview:self.centerText];

}
#pragma mark ************** 添加约束
- (void)addConstraintsForView
{
   
    
    [_textView makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.height.equalTo(@150);
    }];
    [_centerText makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_textView.bottom).offset(10);
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.height.equalTo(@80);
    }];
}



@end
