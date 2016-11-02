//
//  YZGMineTableHeadView.h
//  yzg
//
//  Created by LXY on 16/6/1.
//  Copyright © 2016年 AVGD. All rights reserved.
//

#import <UIKit/UIKit.h>

/*多个按钮*/
@interface MJMoreBtnView : UIView

@property (nonatomic,copy) void(^titleBlock)(NSString *title);



- (void)crearBtnViewWithTitle:(NSArray *)titleArray ImgArray:(NSArray *)imgArray;
@end
