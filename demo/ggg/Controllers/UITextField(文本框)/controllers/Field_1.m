/*
 时刻监听文本框内容变化
 文本框的代理方法
 
 *** 设置了rightView 就 不能设置 clearButtonMode 会被遮盖，
 */

#import "Field_1.h"
#import "JKTextField.h"
@interface Field_1 ()<UITextFieldDelegate>
{
    BOOL isOpen;
}
@property(nonatomic, strong)UITextField *tf;   /** 代理文本框  */
@property(nonatomic, strong)JKTextField *searchBar;   /** 文本框 左边图片  */
@property(nonatomic, strong)UIView *userView;   /** 账号View  */
@property(nonatomic, strong)UITextField *userNameTf;   /** 账号  */

@property (nonatomic, strong) UIButton *editBtn;             /**<  账号左边按钮 */
@end

@implementation Field_1


#pragma mark ************** 懒加载控件
- (UITextField *)tf
{
    if(!_tf)
    {
        _tf = [[UITextField alloc]initWithFrame:CGRectMake(50,80, SCREEN_WIDTH-100, 40)];
        _tf.backgroundColor = [UIColor grayColor];
        _tf.borderStyle=UITextBorderStyleRoundedRect;//设置边框样式
        _tf.keyboardType=UIKeyboardTypeDefault; //设置键盘样式
        _tf.delegate = self;
        _tf.placeholder = @"我是添加代码的文本框";
        _tf.clearButtonMode=YES;//设置清除按钮
        
        //实现同步监听文本用这种方法
        [_tf addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
        
    }
    return _tf;
}
- (JKTextField *)searchBar
{
    if(!_searchBar)
    {
        _searchBar = [[JKTextField alloc]initWithFrame:CGRectMake(50,150, SCREEN_WIDTH-100, 40)];
        _searchBar.backgroundColor = [UIColor grayColor];
        _searchBar.borderStyle=UITextBorderStyleRoundedRect;
        _searchBar.placeholder = @"淘淘淘宝贝";
        _searchBar.clearButtonMode=YES;
        _searchBar.font = [UIFont systemFontOfSize:14];
        //右侧图片
        UIImageView *searchImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 18, 18)];
        searchImage.image = [UIImage imageNamed:@"shan"];
        searchImage.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(titleImgClick:)];
        [searchImage addGestureRecognizer:tap];
        _searchBar.rightView = searchImage;
        _searchBar.rightViewMode = UITextFieldViewModeAlways;
        
        //左侧图片
        UIImageView *Image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 18, 18)];
        Image.image = [UIImage imageNamed:@"shan"];
        Image.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapp=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(titleImgClick:)];
        [Image addGestureRecognizer:tapp];
        _searchBar.leftView = Image;
        _searchBar.leftViewMode = UITextFieldViewModeAlways;
        
    }
    return _searchBar;
}
- (UIView *)userView{
    
    if(!_userView){
        
        _userView = [[UIView alloc]initWithFrame:CGRectMake(0,210, SCREEN_WIDTH, 50)];
        _userView.backgroundColor = [UIColor whiteColor];
        
    }
    
    return _userView;
}
- (UITextField *)userNameTf{
    
    if(!_userNameTf){
        
        _userNameTf = [[UITextField alloc]initWithFrame:CGRectMake(10,0, SCREEN_WIDTH-40, 50)];
        _userNameTf.textColor = [UIColor blackColor];
        _userNameTf.backgroundColor = [UIColor whiteColor];
        _userNameTf.keyboardType=UIKeyboardTypeNumberPad; //设置键盘样式
        _userNameTf.placeholder=@"QQ号/手机号/邮箱";
        _userNameTf.textAlignment = NSTextAlignmentCenter;//文本居中
        _userNameTf.clearButtonMode=YES;//设置清除按钮
        
    }
    
    return _userNameTf;
}
- (UIButton *)editBtn {
    if (!_editBtn) {
        _editBtn = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-30,0, 30, 50)];
        [_editBtn setImage:[UIImage imageNamed:@"shang"] forState:UIControlStateNormal];
        [_editBtn addTarget:self action:@selector(shangClick:) forControlEvents:UIControlEventTouchDown];
    }
    return _editBtn;
}
#pragma mark ************** 按钮被点击
- (void)shangClick:(UIButton *)sender{
    
    if(isOpen)
    {
        [sender setImage:[UIImage imageNamed:@"shang"] forState:UIControlStateNormal];
        _userNameTf.secureTextEntry = NO;
    }
    else
    {
        [sender setImage:[UIImage imageNamed:@"xia"] forState:UIControlStateNormal];
        _userNameTf.secureTextEntry = YES;
    }
    isOpen = !isOpen;
}
#pragma mark ************** 个人背景被点击
-(void)titleImgClick:(UITapGestureRecognizer *)sender{
    _searchBar.text = @"";
}
#pragma mark ************** 系统方法
- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = RGB(231 ,233, 237 );
    [self layoutSubviews];//控件布局
}
#pragma mark ************** 触摸文本框
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    
    NSLog(@"开始编辑---%@",textField.text);
    
}
#pragma mark ************** 手指离开文本框
- (void)textFieldDidEndEditing:(UITextField *)textField{
    
    NSLog(@"结束编辑---%@",textField.text);
    
    
}
#pragma mark ************** 时时监测文本框的内容
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    //检测当前字符串的位置  range
    // NSLog(@"range=%@ string=%@",[NSValue valueWithRange:range],string);
    
    NSLog(@"string=%@",string);//每次输入的字符
    NSLog(@"string----=%@",textField.text);
    return YES;
}

#pragma mark ************** 点击了clear按钮
- (BOOL)textFieldShouldClear:(UITextField *)textField{
    NSLog(@"点击了clear按钮");
    return YES;
}

#pragma mark ************** 点击return 隐藏键盘
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
    
}

#pragma mark ************** 当文本内容改变时调用
- (void)textChange
{
    NSLog(@"accountTextF=xxx=%@",self.tf.text);
    
}

#pragma mark - 控件布局
- (void)layoutSubviews {
    [self.view addSubview:self.tf];
    [self.view addSubview:self.searchBar];
    [self.view addSubview:self.userView];
    [self.userView addSubview:self.userNameTf];
    [self.userView addSubview:self.editBtn];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
