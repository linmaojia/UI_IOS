
/*
 基本文本框控件使用
 view随键盘高度移动
 
 //键盘样色
 http://jingyan.baidu.com/article/e75aca855a7c03142edac6c9.html
 */

#import "Field_2.h"

@interface Field_2 ()<UITextFieldDelegate>
{
}
@property(nonatomic, strong)UITextField *userNameTf;   /** 账号  */
@property(nonatomic, strong)UITextField *passwordTf;   /** 密码  */
@property(nonatomic, strong)UIButton *loginBtn;   /** 登陆按钮  */
@property(nonatomic, strong)UIView *line;  /** 线  */

@end

@implementation Field_2

#pragma mark 懒加载控件
- (UIButton *)loginBtn{
    
    if(!_loginBtn){
        
        _loginBtn = [[UIButton alloc]init];
        _loginBtn.backgroundColor = RGBA(19, 155, 232, 1);
        _loginBtn.layer.cornerRadius=3;
        _loginBtn.layer.masksToBounds=YES;
        [_loginBtn setTitle:@"登陆" forState:0];
        [_loginBtn setTitleColor:[UIColor whiteColor] forState:0];
        [_loginBtn addTarget:self action:@selector(loginAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _loginBtn;
}
- (UITextField *)userNameTf{
    
    if(!_userNameTf){
        
        _userNameTf = [[UITextField alloc]init];
        _userNameTf.textColor = [UIColor blackColor];
        _userNameTf.backgroundColor = [UIColor whiteColor];
        _userNameTf.font = [UIFont boldSystemFontOfSize:18.0f];
        _userNameTf.clearButtonMode=YES;
        _userNameTf.keyboardType=UIKeyboardTypeNumberPad; //设置键盘样式
        _userNameTf.placeholder=@"QQ号/手机号/邮箱";
        _userNameTf.textAlignment = NSTextAlignmentCenter;//文本居中
        
        
        
        //设置提示文本颜色
        //[_userNameTf setValue:[UIColor redColor] forKeyPath:@"_placeholderLabel.textColor"];
        
        //设置oneTextField的外观样式
        //_userNameTf.borderStyle = UITextBorderStyleRoundedRect;
    }
    
    return _userNameTf;
}
- (UITextField *)passwordTf{
    
    if(!_passwordTf){
        
        _passwordTf = [[UITextField alloc]init];
        _passwordTf.backgroundColor = [UIColor whiteColor];
        _passwordTf.delegate = self;//设置代理
        _passwordTf.clearButtonMode=YES;//设置清除按钮
        _passwordTf.keyboardType=UIKeyboardTypeDefault; //设置键盘样式
        _passwordTf.secureTextEntry=YES; //文本框文字是否保密
        _passwordTf.placeholder=@"密码";
        _passwordTf.textAlignment = NSTextAlignmentCenter;
        _passwordTf.font = [UIFont boldSystemFontOfSize:18.0f];
        
        _passwordTf.returnKeyType = UIReturnKeyJoin; // 设置return样色，登陆时使用
        
    }
    
    return _passwordTf;
}

- (UIView *)line{
    
    if(!_line){
        _line = [[UIView alloc]init];
        _line.backgroundColor = RGBA(236, 237, 241, 1);
    }
    
    return _line;
}

#pragma mark - 系统方法
- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    
    
}
- (void)viewWillDisappear:(BOOL)animated
{
  [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNav];//设置导航栏
    [self keyBoardNotifi]; //键盘通知
    [self layoutSubviews];//控件布局
    
    
}
#pragma mark ************** 点击键盘的return 按钮监听

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"点击了搜索");
    [self.navigationController popViewControllerAnimated:YES];
    self.navigationController.navigationBarHidden = NO;
    
    return YES;
}
- (void)loginAction:(UIButton *)sender{
    
    [self.view endEditing:YES];//结束编辑
}

- (void)setNav {
    self.view.backgroundColor = RGB(231 ,233, 237 );
    
    //延迟执行
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self become];
    });
}
#pragma mark ************** 弹出键盘
- (void)become{
    
    [_userNameTf becomeFirstResponder];
}

#pragma mark ************** 添加通知
-(void)keyBoardNotifi{
    
    //键盘弹出通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(show_Action:) name:UIKeyboardWillShowNotification object:nil];//键盘显示时的方法
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hide_Action:) name:UIKeyboardWillHideNotification object:nil];//键盘隐藏时的方法
    
}

#pragma mark ************** 键盘显示通知
-(void)show_Action:(NSNotification *)sender{
    
    //view 向上移动
    NSLog(@"userinfo = %@",sender.userInfo);
    
    NSValue *value = sender.userInfo[UIKeyboardFrameEndUserInfoKey];
    CGRect rect = [value CGRectValue]; //获取键盘的高度
    
    CGFloat loginBtn_h = self.loginBtn.frame.size.height+self.loginBtn.frame.origin.y;
    
    if (rect.origin.y < loginBtn_h) {
        
        [UIView animateWithDuration:0.3 animations:^(){
            
            self.view.frame = CGRectMake(0, rect.origin.y-loginBtn_h-10, SCREEN_WIDTH, SCREEN_HEIGHT);
            
        } completion:nil];
        
    }
    
}

#pragma mark ************** 键盘隐藏通知
-(void)hide_Action:(NSNotification *)sender{
    
    //view 向下移动
    [UIView animateWithDuration:0.3 animations:^(){
        
        self.view.frame = CGRectMake(0, 0, SCREEN_WIDTH , SCREEN_HEIGHT);
        
    } completion:nil];
    
}

#pragma mark ************** 点击屏幕
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    //[self.user_text resignFirstResponder];
    //[self.passwordTf resignFirstResponder];
    [self.view endEditing:YES];//结束编辑
    
    
    [self.navigationController popViewControllerAnimated:YES];

    
}
#pragma mark ************** 移除通知的接受者
-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}


#pragma mark ************** 控件布局
- (void)layoutSubviews {
    [self.view addSubview:self.userNameTf];
    [self.view addSubview:self.passwordTf];
    [self.view addSubview:self.loginBtn];
    [self.view addSubview:self.line];
    
    
    [_userNameTf makeConstraints:^(MASConstraintMaker *make) {
        
        make.height.equalTo(@(SCREEN_HEIGHT/10));
        make.top.equalTo(self.view).offset((SCREEN_HEIGHT/10*3)-10);
        make.left.right.equalTo(self.view);
    }];
    [_line makeConstraints:^(MASConstraintMaker *make) {
        
        make.height.equalTo(@(0.5));
        make.top.equalTo(_userNameTf.bottom);
        make.left.right.equalTo(self.view);
    }];
    [_passwordTf makeConstraints:^(MASConstraintMaker *make) {
        
        make.height.equalTo(@(SCREEN_HEIGHT/10));
        make.top.equalTo(_userNameTf.bottom);
        make.left.right.equalTo(self.view);
    }];
    
    [_loginBtn makeConstraints:^(MASConstraintMaker *make) {
        
        make.height.equalTo(@(SCREEN_HEIGHT/10));
        make.top.equalTo(_passwordTf.bottom).offset(15);
        make.left.equalTo(@15);
        make.right.equalTo(@(-15));
    }];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
