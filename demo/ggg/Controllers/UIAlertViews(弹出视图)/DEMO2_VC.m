//
//  DEMO1_VC.m
//  ggg
//
//  Created by LXY on 16/9/29.
//  Copyright © 2016年 AVGD. All rights reserved.
//

#import "DEMO2_VC.h"
#import "CustomAlertView.h"
#import "YZGBrowsingMoreView.h"
#import "YZGAlertView.h"
#import "YZGPickerView.h"
#import "YZGDatePicker.h"
#import "YZGAdderssPickerView.h"
#import "MJAlertView.h"
@interface DEMO2_VC ()
{
    NSMutableArray *buttonArray;    /**< 按钮数组 */
}
@property (nonatomic, strong) UIView *bottomView;    /**< 底部视图 */
@property (nonatomic, strong) NSArray *classArray;    /**< 类名数组 */
@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) NSArray *cityArray;


@end

@implementation DEMO2_VC
- (NSArray *)cityArray
{
    if(!_cityArray)
    {
        NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"city" ofType:@"plist"];
        NSDictionary *dictionry = [NSDictionary dictionaryWithContentsOfFile:plistPath];
        NSArray *array = dictionry[@"cityList"];
        _cityArray = [NSArray arrayWithArray:array];
    }
    return _cityArray;
}
- (NSArray *)dataArray
{
    if(!_dataArray)
    {
        NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"PhoneInfoList" ofType:@"plist"];
        NSArray *array = [NSArray arrayWithContentsOfFile:plistPath];
        _dataArray = [NSArray arrayWithArray:array];
    }
    return _dataArray;
}
- (UIView *)bottomView{
    
    if(!_bottomView){
        
        buttonArray = [NSMutableArray new];//使用数组约束
        _bottomView = [[UIView alloc]init];
        _bottomView.backgroundColor = [UIColor whiteColor];
        NSArray *array = @[@"原生底部",@"原生中部",@"拍照",@"分享",@"删除",@"手机",@"时间",@"城市"];
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
            [self alert];
        }
            break;
        case 101:{
            [self alert1];
            
        }
            break;
        case 102:{
             [self alert2];
            
        }
            break;
        case 103:{
            [self alert3];
            
        }
            break;
        case 104:{
           [self alert4];
            
        }
            break;
        case 105:{
          [self alert5];
        }
            break;
        case 106:{
            [self alert6];
        }
            break;
        case 107:{
            [self alert7];
        }
            break;
            
        default:
            break;
    }


    
}
-(void)alert
{
    ESWeakSelf;
    UIAlertController *alertController=[UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *gen = [UIAlertAction actionWithTitle:@"版本更新" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        //点击确定执行的方法
        //block 里面要用
        //        __weakSelf
        
        NSLog(@"傻逼");
        
    }];
    UIAlertAction *fan = [UIAlertAction actionWithTitle:@"反馈" style:UIAlertActionStyleDefault handler:nil];
    UIAlertAction *tui = [UIAlertAction actionWithTitle:@"退出QQ" style:UIAlertActionStyleDefault handler:nil];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    //添加多个按钮会排成几行
    [alertController addAction:gen];
    [alertController addAction:fan];
    [alertController addAction:tui];
    [alertController addAction:cancel];
    
    [self presentViewController:alertController animated:YES completion:nil];
}
-(void)alert1
{
    UIAlertController *alertController=[UIAlertController alertControllerWithTitle:@"标题" message:@"ios新UIAlertController" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        //点击确定执行的方法
        NSLog(@"傻逼");
        
    }];
    //添加多个按钮会排成几行
    [alertController addAction:okAction];//确定按钮
    [alertController addAction:cancelAction];//取消按钮
    [self presentViewController:alertController animated:YES completion:nil];
}
-(void)alert2
{
    [CustomAlertView showAlertViewWithTitleArray:@[@"拍照",@"从手机相册选择"] TitleBtnBlock:^(NSString *title) {
        if([title isEqualToString:@"拍照"])
        {
            NSLog(@"拍照");
        }
        else if([title isEqualToString:@"从手机相册选择"])
        {
            NSLog(@"从手机相册选择");
        }
    }];
}
-(void)alert3
{
    NSArray *titleArray = @[@"删除历史",@"进入店铺",@"分享"];
    [YZGBrowsingMoreView showAlertViewWithTitleArray:titleArray TitleBtnBlock:^(NSString *title) {
        
        if([title isEqualToString:@"删除历史"])
        {
            NSLog(@"删除历史");
        }
        else if([title isEqualToString:@"进入店铺"])
        {
            NSLog(@"进入店铺");
        }
        else if([title isEqualToString:@"分享"])
        {
            NSLog(@"分享");
        }
        
    }];
}
-(void)alert4
{
    [MJAlertView showAlertViewWithTitle:@"删除历史" ConfirmBlock:^{
        NSLog(@"确定");
    } CancelBlock:^{
        NSLog(@"取消");
    }];
}
-(void)alert5
{
    ESWeakSelf;
    [YZGPickerView showAlertViewWithTitleArray:self.dataArray TitleBtnBlock:^(NSString *title) {
        
        __weakSelf.title = title;
    }];
}
-(void)alert6
{
    ESWeakSelf;
    NSString  * mindateStr =  @"1993-10-20" ;
    [YZGDatePicker showAlertViewWithTitle:mindateStr TitleBtnBlock:^(NSString *title) {
       __weakSelf.title = title;
    }];
}
-(void)alert7
{
    ESWeakSelf;
    [YZGAdderssPickerView showAlertViewWithAdderssArray:self.cityArray AdderssBlock:^(ETAreaListModel *province, City *city, Town *town) {
        
        NSString *address = nil;
        address = [NSString stringWithFormat:@" 省、市、区：%@",province.name];
        
        if (city) {
            address = [NSString stringWithFormat:@" 省、市、区：%@ %@",province.name,city.name];
        }
        if (town) {
            address = [NSString stringWithFormat:@" 省、市、区：%@ %@ %@",province.name,city.name,town.name];
        }
        
         __weakSelf.title = address;
    }];
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
