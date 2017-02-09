//
//  UIButton+JWCenter.m
//  hysc
//
//  Created by AVGD-Jarvi on 16/11/5.
//  Copyright © 2016年 AVGD. All rights reserved.
//

#import "UIButton+JWCenter.h"

@implementation UIButton (JWCenter)

- (void)centerStyle:(CenterButtonImageStyle)style padding:(CGFloat)padding{
    CGFloat lableWidth = (self.imageView.frame.size.width+self.titleLabel.frame.size.width)/2-(self.titleLabel.frame.size.width)/2+padding/2;
    CGFloat lableHeight = self.titleLabel.frame.size.height/2+padding/2;
    
    CGFloat imageWidth = (self.imageView.frame.size.width+self.titleLabel.frame.size.width)/2-(self.imageView.frame.size.width)/2+padding/2;
    CGFloat imageHeight = self.imageView.frame.size.height/2+padding/2;
    switch (style) {
        case CenterButtonImageStyleTop:
            [self setTitleEdgeInsets:UIEdgeInsetsMake(lableHeight, -self.imageView.frame.size.width, -lableHeight, 0)];
            [self setImageEdgeInsets:UIEdgeInsetsMake(-imageHeight, 0, imageHeight, -self.titleLabel.frame.size.width)];
            break;
        case CenterButtonImageStyleBottom:
            [self setTitleEdgeInsets:UIEdgeInsetsMake(-lableHeight, -self.imageView.frame.size.width, lableHeight, 0)];
            [self setImageEdgeInsets:UIEdgeInsetsMake(imageHeight, 0, -imageHeight, -self.titleLabel.frame.size.width)];
            break;
        case CenterButtonImageStyleLeft:
            [self setTitleEdgeInsets:UIEdgeInsetsMake(0, padding/2, 0, 0)];
            [self setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, padding/2)];
            break;
        case CenterButtonImageStyleRight:
            [self setTitleEdgeInsets:UIEdgeInsetsMake(0, -self.imageView.frame.size.width-padding/2, 0, self.imageView.frame.size.width+padding/2)];
            [self setImageEdgeInsets:UIEdgeInsetsMake(0, self.titleLabel.frame.size.width+padding/2, 0, -self.titleLabel.frame.size.width-padding/2)];
            break;
            
        default:
            break;
    }
}

@end
