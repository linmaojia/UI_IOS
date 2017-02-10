//
//  UILabel+Extend.h
//  ggg
//
//  Created by LXY on 17/1/2.
//  Copyright © 2017年 AVGD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Extend)


/**
 *  @method 指定的字符串修改颜色
 *
 *  @param arrString 字符串数组
 *  @param color     修改的颜色
 */
- (void)paragraphStyleWithArrString:(NSArray *)arrString Color:(UIColor *)color;

/**
 *  @method 多行字符串
 *
 *  @param lineSpacing  行空隙
 */
- (void)paragraphStyleWithLineSpacing:(CGFloat)lineSpacing;

@end
