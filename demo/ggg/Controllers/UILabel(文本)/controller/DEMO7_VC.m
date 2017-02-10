//
//  DEMO1_VC.m
//  ggg
//
//  Created by LXY on 16/9/29.
//  Copyright © 2016年 AVGD. All rights reserved.



#import "DEMO7_VC.h"
#import "UILabel+Extend.h"
@interface DEMO7_VC ()

@property (nonatomic, strong) UILabel *titleLab;      /**<  标题 */
@property (nonatomic, strong) UILabel *titleLab11;      /**<  标题 */
@property (nonatomic, strong) UILabel *priceLabel;      /**<  标题 */


@end

@implementation DEMO7_VC
- (UILabel *)priceLabel
{
    if(!_priceLabel)
    {
        UILabel *label = [[UILabel alloc] init];
        label.numberOfLines = 0;
        label.font = [UIFont systemFontOfSize:14.f];
        label.textAlignment = NSTextAlignmentRight;
        label.text = @"合计:0.00元\n共: 0件 商品";
        label.backgroundColor = [UIColor grayColor];
        _priceLabel = label;
    }
    return _priceLabel;
}
- (UILabel *)titleLab {
    if (!_titleLab) {
        UILabel *label = [[UILabel alloc] init];
        label.textAlignment = NSTextAlignmentRight;
        label.font = systemFont(16);
        label.text = @"总价：103 共计：12件";
        _titleLab = label;
    }
    return _titleLab;
}
- (UILabel *)titleLab11 {
    if (!_titleLab11) {
        UILabel *label = [[UILabel alloc] init];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = systemFont(16);
        label.text = @"你是说的就发上来的副教授李发斯蒂芬";
        label.numberOfLines = 2;
        _titleLab11 = label;
    }
    return _titleLab11;
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
  [self.titleLab paragraphStyleWithArrString:@[@"103",@"12件"] Color:mainColor];
    
  [self.titleLab11 paragraphStyleWithLineSpacing:5];
    
  [self.priceLabel paragraphStyleWithArrString:@[@"0.00",@"0件"] Color:mainColor];

}

#pragma mark ************** 添加子控件
- (void)addSubviewsForView
{
   [self.view addSubview:self.titleLab];
    [self.view addSubview:self.titleLab11];
    [self.view addSubview:self.priceLabel];

}
#pragma mark ************** 添加约束
- (void)addConstraintsForView
{
    _titleLab.frame = CGRectMake(0, 20, SCREEN_WIDTH, 50);
    _titleLab11.frame = CGRectMake(0, 80, SCREEN_WIDTH/2, 50);
    _priceLabel.frame = CGRectMake(0, SCREEN_WIDTH/2, SCREEN_WIDTH/2, 50);


}



@end
