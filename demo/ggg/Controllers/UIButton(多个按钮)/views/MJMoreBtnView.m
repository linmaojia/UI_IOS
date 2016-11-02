//
//  YZGMineTableHeadView.m
//  yzg
//
//  Created by LXY on 16/6/1.
//  Copyright © 2016年 AVGD. All rights reserved.
//

#import "MJMoreBtnView.h"

@interface MJMoreBtnView()
{
     CGFloat view_width,view_height;
     CGFloat self_width,self_height;
}
@property (nonatomic, strong) NSArray *titleArray;
@property (nonatomic, strong) NSArray *imgArray;
@end

@implementation MJMoreBtnView
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {

        self_width = self.frame.size.width;
        self_height = self.frame.size.height;
        
//        [self addSubviewsForView];
//        [self addConstraintsForView];
    }
    return self;
}
#pragma mark ************** 懒加载控件
- (void)crearBtnViewWithTitle:(NSArray *)titleArray ImgArray:(NSArray *)imgArray
{
    
    self.titleArray = titleArray;
    
    view_width  =  self_width/titleArray.count;
    view_height =  self_height;
    
    for (int i = 0; i < titleArray.count; i++) {
        
        UIView *view = [[UIView alloc]init];
        view.backgroundColor = [UIColor whiteColor];
        [self addSubview:view];
        view.tag = 100+i;
        view.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(viewClick:)];
        [view addGestureRecognizer:tap];
        view.frame = CGRectMake(i*view_width, 0, view_width, view_height);
        NSLog(@"%@",NSStringFromCGRect( view.frame));
        //图片
        UIImageView *titleImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
        titleImg.image = [UIImage imageNamed:imgArray[i]];
        [titleImg setContentMode:UIViewContentModeScaleAspectFit];
        [view addSubview:titleImg];
        titleImg.frame =  CGRectMake(0, 0, 40, 40);
        titleImg.center = CGPointMake(view_height/2, view_height/2 - 10);
        
        //文本
        UILabel *titleLab = [[UILabel alloc] init];
        titleLab.textAlignment = NSTextAlignmentCenter;
        titleLab.textColor = RGB(102,102,102);
        titleLab.font = systemFont(14);
        titleLab.text = titleArray[i];
        [view addSubview:titleLab];
        CGFloat titleLab_y = titleImg.frame.origin.y + titleImg.frame.size.height;
        titleLab.frame =  CGRectMake(0, titleLab_y, view_width, 20);
        
        
    }

}

#pragma mark ************** downView上的button点击事件
- (void)viewClick:(UITapGestureRecognizer *)sender
{
    
    if(self.titleBlock)
    {
        self.titleBlock(self.titleArray[sender.view.tag - 100]);
    }
}

#pragma mark ************** 添加子控件
- (void)addSubviewsForView
{
//    [self addSubview:self.totalPrices];
    

}
#pragma mark ************** 添加约束
- (void)addConstraintsForView
{
//    [_totalPrices mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.top.right.equalTo(self);
//        make.height.equalTo(@(10));
//    }];
}

@end
