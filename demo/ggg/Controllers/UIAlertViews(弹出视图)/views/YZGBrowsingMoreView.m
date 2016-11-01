//
//  ETCollectMoreView.m
//  ETao
//
//  Created by AVGD－Mai on 16/3/7.
//  Copyright © 2016年 jacky. All rights reserved.
//

#import "YZGBrowsingMoreView.h"

static float const BTNBGVIEW_HEIGHT = 70;        /**< 按钮背景高度 */
static float const BOTTOMVIEW_HEIGHT = 120;        /**< 底部背景高度 */


@interface YZGBrowsingMoreView ()
@property (nonatomic,strong) NSArray *titleArray;     /**< 标题数组 */

@property (nonatomic, strong) UIView *bottomView;      /**< 背景 */
@property (nonatomic, strong) UIView *btnBgView;     /**< 按钮背景View */
@property (nonatomic, strong) UIView *lineView;    /**< 分割线 */
@property (nonatomic, strong) UIButton *cancel;    /**< 取消按钮 */

@property (nonatomic,copy) void(^titleBtnBlock)(NSString *text);     /**< 按钮回调 */


@end

@implementation YZGBrowsingMoreView

- (UIView *)bottomView {
    if (!_bottomView) {
        _bottomView = [[UIView alloc] init];
        _bottomView.backgroundColor = [UIColor whiteColor];
        _bottomView.alpha = 0;
    }
    return _bottomView;
}
- (UIView *)btnBgView {
    if (!_btnBgView) {
        _btnBgView = [[UIView alloc] init];
        _btnBgView.backgroundColor = [UIColor whiteColor];
    }
    return _btnBgView;
}
- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = hexColor(D7D7D7);
    }
    return _lineView;
}

- (UIButton *)cancel {
    if (!_cancel) {
        _cancel = [UIButton buttonWithType:UIButtonTypeCustom];
        [_cancel setTitle:@"取消" forState:UIControlStateNormal];
        [_cancel setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _cancel.layer.cornerRadius = 3;
        _cancel.backgroundColor = hexColor(D7D7D7);
        [_cancel addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchDown];
    }
    return _cancel;
}

+ (void)showAlertViewWithTitleArray:(NSArray *)titleArray TitleBtnBlock:(void(^)(NSString *title))titleBtnBlock{
  
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    
    YZGBrowsingMoreView *blackView = [[YZGBrowsingMoreView alloc] initWithFrame:keyWindow.frame];//黑色阴影
    [keyWindow addSubview:blackView];
    
    blackView.titleArray = titleArray;
    
    blackView.titleBtnBlock = titleBtnBlock;
    
}
#pragma mark **************** init
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.backgroundColor = RGBA(0, 0, 0, 0);
        self.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)];
        [self addGestureRecognizer:tap];//添加手势
        
    }
    return self;
}

- (void)setTitleArray:(NSArray *)titleArray{
    _titleArray = titleArray;
    
    [self addSubviewsForAlertView];//添加子控件
    [self layoutSubviewsForAlertView];//布局子控件
    [self show];//显示视图
    
}
- (void)creatButton {
    
    NSArray *imageArray = [NSArray arrayWithObjects:[UIImage imageNamed:@"qxsc"], [UIImage imageNamed:@"SHOP"], [UIImage imageNamed:@"share"],nil];
    
    NSMutableArray *viewArray = [NSMutableArray array];
    for (int i = 0; i < 3; i++) {
        
        UIView *view = [[UIView alloc]init];
        view.backgroundColor = [UIColor whiteColor];
        [self.btnBgView addSubview:view];
        [viewArray addObject:view];
        view.tag = 100+i;
        view.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(viewClick:)];
        [view addGestureRecognizer:tap];
        
        //图片
        UIImageView *titleImg = [[UIImageView alloc] init];
        titleImg.image = imageArray[i];
        [titleImg setContentMode:UIViewContentModeScaleAspectFit];
        [view addSubview:titleImg];
        [titleImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(view);
            make.centerY.equalTo(view).offset(AUTO_MATE_HEIGHT(-10));
            make.height.width.equalTo(@(AUTO_MATE_HEIGHT(30)));
        }];
        //文本
        UILabel *titleLab = [[UILabel alloc] init];
        titleLab.textAlignment = NSTextAlignmentCenter;
        titleLab.textColor = [UIColor blackColor];
        titleLab.font = systemFont(12);
        titleLab.text = self.titleArray[i];
        [view addSubview:titleLab];
        [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(titleImg.bottom).offset(3);
            make.centerX.equalTo(view);
            make.height.equalTo(@(AUTO_MATE_HEIGHT(20)));
            make.right.left.equalTo(view);
        }];
    }
    
    
    [viewArray mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
    [viewArray makeConstraints:^(MASConstraintMaker *make) {
        
        make.height.equalTo(@(AUTO_MATE_HEIGHT(BTNBGVIEW_HEIGHT)));
        make.top.equalTo(_btnBgView);
    }];
}

#pragma mark ************** 按钮被点击
-(void)viewClick:(UITapGestureRecognizer *)sender{
   
    //传递标题回调
   NSInteger index = sender.view.tag-100;
   self.titleBtnBlock(self.titleArray[index]);
    
   [self dismiss];
    
}

- (void)show{
    [UIView animateWithDuration:0.3 animations:^{
        self.backgroundColor = RGBA(0, 0, 0, 0.5);
        self.bottomView.alpha = 1;
    }];
}

- (void)dismiss {
    [UIView animateWithDuration:0.3 animations:^{
        self.backgroundColor = RGBA(0, 0, 0, 0);
        self.bottomView.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}
#pragma mark **************** 添加子控件
- (void)addSubviewsForAlertView
{
    [self addSubview:self.bottomView];
    [self.bottomView addSubview:self.btnBgView];
    [self.bottomView addSubview:self.lineView];
    [self.bottomView addSubview:self.cancel];
    [self creatButton];  //创建按钮
    
}
- (void)layoutSubviewsForAlertView
{
    [_bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(self);
        make.height.equalTo(@(AUTO_MATE_HEIGHT(BOTTOMVIEW_HEIGHT)));

    }];
    [_btnBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(_bottomView);
        make.height.equalTo(@(AUTO_MATE_HEIGHT(BTNBGVIEW_HEIGHT)));
    }];
    [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_btnBgView.bottom);
        make.left.right.equalTo(_bottomView);
        make.height.equalTo(@(0.5));
        
    }];
    [_cancel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bottomView).offset(35);
        make.right.equalTo(_bottomView).offset(-35);
        make.top.equalTo(_lineView.bottom).offset(AUTO_MATE_HEIGHT(8));
        make.height.equalTo(@(AUTO_MATE_HEIGHT(35)));
        
    }];

}

@end
