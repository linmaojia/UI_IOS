//
//  DEMO1_VC.m
//  ggg
//
//  Created by LXY on 16/9/29.
//  Copyright © 2016年 AVGD. All rights reserved.
//

#import "DEMO3_VC.h"
#import "Field_1.h"
#import "Field_2.h"
#import "Field_3.h"
@interface DEMO3_VC ()
{
    NSMutableArray *buttonArray;    /**< 按钮数组 */
}
@property (nonatomic, strong) UIView *bottomView;    /**< 底部视图 */
@property (nonatomic, strong) NSArray *classArray;    /**< 类名数组 */

@end

@implementation DEMO3_VC

- (UIView *)bottomView{
    
    if(!_bottomView){
        
        buttonArray = [NSMutableArray new];//使用数组约束
        _bottomView = [[UIView alloc]init];
        _bottomView.backgroundColor = [UIColor whiteColor];
        NSArray *array = @[@"1-UITextField",@"2-UITextField",@"界面"];
        for(int i=0;i<array.count;i++){
            
            UIButton *button=[UIButton buttonWithType:UIButtonTypeSystem];
            
            button.backgroundColor = RGB(238, 91, 40);
            [button setTitleColor:[UIColor whiteColor] forState:0];
            [button setTitle:array[i] forState:UIControlStateNormal];
            button.titleLabel.font= boldSystemFont(15);
            button.tag=100+i;
            [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
            [self.bottomView addSubview:button];
            [buttonArray addObject:button];
            
        }
        
        
    }
    return _bottomView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addSubviewsForView];
    
    [self addConstraintsForView];
    
    [self setNav];
    
}
#pragma mark ************** 设置导航栏
- (void)setNav
{
    
}
- (void)viewWillAppear:(BOOL)animated
{

}
#pragma mark ************************* 监听button方法
-(void)buttonAction:(UIButton *)sender{
    
    self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;//添加手势左滑返回
    
    switch (sender.tag) {
        case 100:{
            Field_1 *vc = [[Field_1 alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 101:{
      
            Field_3 *vc = [[Field_3 alloc]init];
            
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 102:{
            Field_2 *vc = [[Field_2 alloc]init];
            
            [self.navigationController pushViewController:vc animated:YES];
            
        }
            break;
        case 103:{
         
            
        }
   
            break;
        default:
            break;
    }

    
    
    
    
    

    
}

#pragma mark ************** 添加子控件
- (void)addSubviewsForView
{
     [self.view addSubview:self.bottomView];
}
#pragma mark ************** 添加约束
- (void)addConstraintsForView
{
   
    
    [_bottomView makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.equalTo(@200);
        make.top.bottom.equalTo(self.view);
    }];
    
    //平均分配 水平
    
    [buttonArray mas_distributeViewsAlongAxis:MASAxisTypeVertical withFixedSpacing:5 leadSpacing:5 tailSpacing:5];
    [buttonArray makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.equalTo(@200);
        make.left.equalTo(self.bottomView);
    }];
}



@end
