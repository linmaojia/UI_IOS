//
//  YZGPickerView.h
//  Masonry
//
//  Created by LXY on 16/7/7.
//  Copyright © 2016年 AVGD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YZGPickerView : UIView

+ (void)showAlertViewWithTitleArray:(NSArray *)dataArray TitleBtnBlock:(void(^)(NSString *title))titleBtnBlock;

@end
