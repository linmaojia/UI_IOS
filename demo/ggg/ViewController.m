//
//  ViewController.m
//  Masonry
//
//  Created by LXY on 16/4/27.
//  Copyright © 2016年 AVGD. All rights reserved.
//

#import "ViewController.h"
#import "YZGRootViewController.h"
#import "DEMO1_VC.h"
#import "DEMO2_VC.h"
#import "DEMO3_VC.h"
#import "DEMO4_VC.h"
#import "DEMO5_VC.h"
#import "DEMO6_VC.h"
@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
{
}
@property (nonatomic, strong) UITableView *tableView;    /**< RootTableView */
@property (nonatomic, strong) NSArray *nameArray;    /**< 名称数组 */
@property (nonatomic, strong) NSArray *classArray;    /**< 类名数组 */
@end

@implementation ViewController

#pragma mark 懒加载控件
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = [UIColor whiteColor];
    }
    return _tableView;
}

- (NSArray *)nameArray {
    
    if (!_nameArray) {
        _nameArray = @[@"导航栏-1",@"弹出框-2",@"UITextField-3",@"UITextView-4",@"UIWebView-5",@"UIButton-6"];
        
    }
    return _nameArray;
}
- (NSArray *)classArray {
    if (!_classArray) {
        _classArray = @[[DEMO1_VC class],[DEMO2_VC class],[DEMO3_VC class],[DEMO4_VC class],[DEMO5_VC class],[DEMO6_VC class]];
        
    }
    return _classArray;
}
#pragma mark - 系统方法
- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNav];//设置导航栏
    [self layoutSubviews];//控件布局
}

#pragma mark - 设置导航栏
- (void)setNav {
    
    self.view.backgroundColor = [UIColor yellowColor];
    self.navigationItem.title = @"UI-组件";
    
}


#pragma mark- tableview代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.nameArray.count;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return AUTO_MATE_HEIGHT(50);
    
}
//系统cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIden = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIden];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:cellIden];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone; //选中cell时无色
    cell.textLabel.text = self.nameArray[indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:16];
    cell.textLabel.textColor = [UIColor colorWithRed:0.540  green:0.564  blue:0.589 alpha:1];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"DEMO%ld",(long)indexPath.row+1 ];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    
    YZGRootViewController *vc = [[self.classArray[indexPath.row] alloc] init];
    
    vc.titleStr = self.nameArray[indexPath.row];
    
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - 控件布局
- (void)layoutSubviews {
    
    [self.view addSubview:self.tableView];
    
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        //设置tableView的边缘==父视图
        make.edges.equalTo(self.view);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
