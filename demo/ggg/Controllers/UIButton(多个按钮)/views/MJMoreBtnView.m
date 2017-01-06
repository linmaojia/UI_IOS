//
//  YZGMineTableHeadView.m
//  yzg
//
//  Created by LXY on 16/6/1.
//  Copyright © 2016年 AVGD. All rights reserved.
//

#import "MJMoreBtnView.h"

@interface MJMoreBtnView()

@property (nonatomic, strong) NSArray *titles;

@property (nonatomic, strong) NSArray *images;

@end

@implementation MJMoreBtnView
#pragma mark ************** init
- (id)initWithTitles:(NSArray *)titles Images:(NSArray *)images
{
    self = [self initWithFrame:CGRectZero];
    
    if (self) {
        
        self.titles = titles;
        
        self.images = images;
        
        [self addSubviewsForView];
        
    }
    
    return self;
    
}
#pragma mark ************** 添加子控件
- (void)addSubviewsForView
{
    for (int i = 0; i < _titles.count; i++)
    {
        UIView *view = [[UIView alloc]initWithFrame:CGRectZero];
        view.backgroundColor = [UIColor whiteColor];
        [self addSubview:view];
        view.tag = 100+i;
        view.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(viewClick:)];
        [view addGestureRecognizer:tap];
        //图片
        UIImageView *titleImg = [[UIImageView alloc] initWithFrame:CGRectZero];
        titleImg.image = [UIImage imageNamed:_images[i]];
        [titleImg setContentMode:UIViewContentModeScaleAspectFit];
        [view addSubview:titleImg];
        titleImg.tag = 200+i;
        
        //文本
        UILabel *titleLab = [[UILabel alloc] initWithFrame:CGRectZero];
        titleLab.textAlignment = NSTextAlignmentCenter;
        titleLab.textColor = [UIColor blackColor];
        titleLab.font = [UIFont systemFontOfSize:14];
        titleLab.text = _titles[i];
        titleLab.backgroundColor = [UIColor whiteColor];
        [view addSubview:titleLab];
        titleLab.tag = 300+i;
    }
}


#pragma mark ************** subView点击事件
- (void)viewClick:(UITapGestureRecognizer *)sender
{
    if(self.titleBlock)
    self.titleBlock(_titles[sender.view.tag - 100]);
}

#pragma mark ************** 父控件布局完成
- (void)layoutSubviews
{
    [super layoutSubviews];

    CGFloat view_W = self.frame.size.width/self.titles.count;
    
    CGFloat view_H = self.frame.size.height;
    
    CGFloat imageView_H = 40;
    
    CGFloat lab_H = 20;

    for(int i = 0; i < self.titles.count; i++)
    {
        UIView *subView = (UIView *)[self viewWithTag:100+i];
        subView.frame = CGRectMake(i* view_W, 0, view_W, view_H);
        //图片
        UIImageView *imageView = (UIImageView *)[subView viewWithTag:200+i];
        imageView.frame =  CGRectMake(0, 0, imageView_H, imageView_H);
        imageView.center = CGPointMake(view_W/2, view_H/2 - 10);
        //文字
        UILabel *lable = (UILabel *)[subView viewWithTag:300+i];
        CGFloat titleLab_y = imageView.frame.origin.y + imageView.frame.size.height + lab_H/2;
        lable.frame =  CGRectMake(0, 0, view_W, lab_H);
        lable.center = CGPointMake(view_W/2, titleLab_y);
        
    }
    
}
@end
