

#import "JKCountDownButton.h"

@interface JKCountDownButton ()
{
    int _second; //秒数
    int _count;
    NSTimer * _timer;
}
@property (nonatomic,copy) void(^toucheBlock)();     /**< 第一次点击回调 */
@property (nonatomic,copy) void(^nextToucheBlock)();     /**< 第二次点击回调 */

@end

@implementation JKCountDownButton

#pragma mark ************** 初始化
- (void)customWithTime:(int)time ToucheBlock:(void(^)())toucheBlock NextToucheBlock:(void(^)())nextToucheBlock
{
     _second = time;
     _count = time;
      self.toucheBlock = toucheBlock;
      self.nextToucheBlock = nextToucheBlock;
    
    [self addTarget:self action:@selector(touched:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark ************** 点击回调
-(void)touched:(JKCountDownButton*)sender{
     self.enabled = NO;
     self.toucheBlock();

}

#pragma mark ************** 开始倒计时
- (void)showTime
{
     [_timer setFireDate:[NSDate distantPast]];
    
    //    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeFireMethod) userInfo:nil repeats:YES];
    
    //开始倒计时
     _timer= [NSTimer  timerWithTimeInterval:1.0 target:self selector:@selector(timeFireMethod)userInfo:nil repeats:YES];
     [[NSRunLoop currentRunLoop]addTimer:_timer forMode:NSRunLoopCommonModes];
     [_timer fire];//点击就执行定时器
}

-(void)timeFireMethod{
    
    _second--;
   
    NSString *title = [NSString stringWithFormat:@"剩余%d秒",_second];
    [self setTitle:title forState:UIControlStateNormal];
   
    if(_second==0){
        
        _second = _count;
        
        [_timer invalidate]; //停止
    
        self.enabled = YES;
        
        self.nextToucheBlock();
    }
}


@end
