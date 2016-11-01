

#import <UIKit/UIKit.h>

@interface JKCountDownButton : UIButton

/* 点击回调方法*/
- (void)customWithTime:(int)time ToucheBlock:(void(^)())toucheBlock NextToucheBlock:(void(^)())nextToucheBlock;
- (void)showTime; /* 开启计时器*/

@end
