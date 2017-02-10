//
//  UILabel+Extend.m
//  ggg
//
//  Created by LXY on 17/1/2.
//  Copyright © 2017年 AVGD. All rights reserved.
//

#import "UILabel+Extend.h"

@implementation UILabel (Extend)

/**
 *  @method 指定的字符串修改颜色
 *
 *  @param arrString 字符串数组
 *  @param color     修改的颜色
 */
- (void)paragraphStyleWithArrString:(NSArray *)arrString Color:(UIColor *)color
{
    NSInteger textAlignment = self.textAlignment;
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 4.0f;// 行间距
    NSDictionary *ats = @{NSParagraphStyleAttributeName : paragraphStyle};
    NSMutableAttributedString *paragraphString = [[NSMutableAttributedString alloc] initWithString:self.text attributes:ats];
    for(NSString *string in arrString)
    {
        [paragraphString addAttribute:NSForegroundColorAttributeName
                            value:color
                            range:[self.text rangeOfString:string]];
    }
    self.attributedText = paragraphString;
    self.textAlignment = textAlignment;
}

/**
 *  @method 多行字符串
 *
 *  @param lineSpacing  行空隙
 */
- (void)paragraphStyleWithLineSpacing:(CGFloat)lineSpacing
{
    NSMutableAttributedString * attributedString = [[NSMutableAttributedString alloc] initWithString:self.text];
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpacing];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [self.text length])];
    self.attributedText = attributedString;
    self.lineBreakMode = NSLineBreakByTruncatingTail;
    [self sizeToFit];
}
@end
