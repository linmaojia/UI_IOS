//
//  UINavigationBar+Alpha.m
//  NavigationBar
//
//  Created by hebe on 15/11/24.
//  Copyright © 2015年 __ZhangXiaoLiang__. All rights reserved.
//

#import "UINavigationBar+Alpha.h"
#import <objc/runtime.h>



@implementation UINavigationBar (Alpha)

static char key;
- (CALayer *)barlayer
{
    CALayer *layer = objc_getAssociatedObject(self, &key);
    if (!layer) {
        [self setBackgroundImage:[UIImage imageNamed:@"someclear_bg-1"] forBarMetrics:UIBarMetricsDefault];
        [self setShadowImage:[UIImage imageNamed:@"someclear_bg-1"]];
        layer = [CALayer layer];
        layer.frame = CGRectMake(0, -20, UIScreen.mainScreen.bounds.size.width, 64);
        [self.layer insertSublayer:layer atIndex:0];
        objc_setAssociatedObject(self, &key, layer, OBJC_ASSOCIATION_ASSIGN);
    }
    
    return layer;
}

-(void)setXl_Alpha:(CGFloat)xl_Alpha
{
    self.barlayer.backgroundColor = [NavigationBarBgColor colorWithAlphaComponent:xl_Alpha].CGColor;
}
-(CGFloat)xl_Alpha{return 0;}



@end
