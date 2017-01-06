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

@property (nonatomic,copy) void(^titleBlock)(NSString *title);/*标题回调*/

- (id)initWithTitles:(NSArray *)titles Images:(NSArray *)images;
@end
