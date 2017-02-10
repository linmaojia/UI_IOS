
/*
 自定义 UITextField
 自定义 UITextView
 自定义 Button
 
 自定义 UITextView 文字居中
 正则判断
 */

#import "Field_3.h"
#import "JKTextField.h"
#import "JKPlaceholderTextView.h"
#import "JKCountDownButton.h"
#import "RegExpValidate.h"
#import "MJTextField.h"

static float const TEXT_HEIGHT = 50;  /**< 文本框高度 */

@interface Field_3 ()<UITextFieldDelegate>
@property(nonatomic, strong)UIButton *nextStepButton;   /**< 下一步 */
@property(nonatomic, strong) UIView *codeView;   /**< 自定义按钮View */


@property(nonatomic, strong) JKTextField *searchBar;   /** 文本框 左边图片  */
@property(nonatomic, strong) JKTextField *phoneTF;   /** 文本框 左边文本 */
@property(nonatomic, strong) JKTextField *nameTF;   /** 文本框 左边文本 */
@property(nonatomic, strong) JKTextField *authCodeTF;   /** 文本框 右边计时按钮 */

@property(nonatomic, strong) JKPlaceholderTextView *credentialText;   /** 文本框 左边文本 */
@property(nonatomic, strong) JKPlaceholderTextView *centerText;

@property(nonatomic, strong) UIScrollView *scroll;
@property (nonatomic, strong) MJTextField *mjTextField;
@property (nonatomic, strong) MJTextField *passTextField;


@end

@implementation Field_3

#pragma mark 懒加载控件
- (MJTextField *)passTextField{
    
    if(!_passTextField){
        ESWeakSelf;
        _passTextField = [[[NSBundle mainBundle] loadNibNamed:@"MJTextField" owner:self options:nil] objectAtIndex:0];
        _passTextField.mTextField.delegate = self;
        _passTextField.mTextField.returnKeyType = UIReturnKeyJoin;//变为搜索按钮
        _passTextField.mTextField.placeholder = @"输入密码";
        _passTextField.mTextField.secureTextEntry = YES;
        _passTextField.mTextField.keyboardType = UIKeyboardTypeASCIICapable;
        [_passTextField.leftBtn setImage:[UIImage imageNamed:@"password"] forState:0];
        [_passTextField.rightBtn setImage:[UIImage imageNamed:@"dl-yincang"] forState:0];
        [_passTextField.rightBtn setImage:[UIImage imageNamed:@"dl-xianshi"] forState:UIControlStateSelected];
        _passTextField.rightBtnBlock = ^(BOOL isSelect){
            
            __weakSelf.passTextField.mTextField.secureTextEntry = !__weakSelf.passTextField.mTextField.secureTextEntry;
           
        };
    }
    return _passTextField;
}
- (MJTextField *)mjTextField{
    
    if(!_mjTextField){
        ESWeakSelf;
        _mjTextField = [[[NSBundle mainBundle] loadNibNamed:@"MJTextField" owner:self options:nil] objectAtIndex:0];
        _mjTextField.mTextField.placeholder = @"输入手机号码";
        _mjTextField.mTextField.delegate = self;
        _mjTextField.mTextField.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
        [_mjTextField.leftBtn setImage:[UIImage imageNamed:@"Shape-"] forState:0];
        [_mjTextField.rightBtn setImage:[UIImage imageNamed:@"dl-yincang"] forState:0];
        [_mjTextField.rightBtn setImage:[UIImage imageNamed:@"dl-xianshi"] forState:UIControlStateSelected];
        _mjTextField.rightBtnBlock = ^(BOOL isSelect){
            
            [__weakSelf rightBtnClickWith:isSelect];
        };
    }
    return _mjTextField;
}
- (void)rightBtnClickWith:(BOOL)isSelect
{
    if(isSelect)
    {
        NSLog(@"选中");
    }
    else
    {
        NSLog(@"不选中");
    }
}
- (JKPlaceholderTextView *)centerText {
    if (!_centerText) {
        _centerText = [[JKPlaceholderTextView alloc] init];
        _centerText.textColor = [UIColor blackColor];
        _centerText.backgroundColor = [UIColor grayColor];
        _centerText.font = [UIFont systemFontOfSize:15];
        _centerText.text = @"";
        
        [_centerText addObserver:self forKeyPath:@"contentSize" options:NSKeyValueObservingOptionNew context:nil];//垂直居中
        
        
    }
    return _centerText;
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    UITextView *mText = object;
    
    CGFloat topCorrect = ([mText bounds].size.height - [mText contentSize].height);
    
    topCorrect = (topCorrect <0.0 ?0.0 : topCorrect);
    
    mText.contentOffset = (CGPoint){.x =0, .y = -topCorrect/2};
    
}
- (UIScrollView *)scroll
{
    if(!_scroll)
    {
        _scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _scroll.contentSize=CGSizeMake(SCREEN_WIDTH, 2*SCREEN_HEIGHT);
        _scroll.scrollEnabled=YES;
        _scroll.backgroundColor = [UIColor whiteColor];
    }
    return  _scroll;
}
- (JKTextField *)authCodeTF
{
    if(!_authCodeTF)
    {
        _authCodeTF = [[JKTextField alloc] init];
        _authCodeTF.keyboardType= UIKeyboardTypeNumberPad;
        _authCodeTF.clearButtonMode=YES;
        _authCodeTF.font = [UIFont systemFontOfSize:14];
        _authCodeTF.placeholder = @"输入号码";
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 85, TEXT_HEIGHT)];
        label.text = @"      验证码";
        label.font = [UIFont systemFontOfSize:14];
        _authCodeTF.leftView = label;
        _authCodeTF.leftViewMode = UITextFieldViewModeAlways;//一定要加上
        
        //右边计时按钮
        _authCodeTF.rightView = self.codeView;
        _authCodeTF.rightViewMode = UITextFieldViewModeAlways;
        
        
    }
    return _authCodeTF;
}
- (UIView *)codeView
{
    if(!_codeView)
    {
        _codeView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 90, TEXT_HEIGHT)];
        _codeView.backgroundColor = [UIColor clearColor];
        
        JKCountDownButton *countDownCode = [JKCountDownButton buttonWithType:UIButtonTypeCustom];
        countDownCode.frame = CGRectMake(10, (TEXT_HEIGHT-35)/2, 80, 35);
        [countDownCode setTitle:@"获取验证码" forState:0];
        countDownCode.titleLabel.font = systemFont(12);
        [countDownCode setTitleColor:RGB(38, 66, 136) forState:UIControlStateNormal];
        
        // ESWeak_(countDownCode);
        [countDownCode customWithTime:10 ToucheBlock:^{
            
            //第一次点击
            [countDownCode showTime];
            [countDownCode setTitleColor:RGB(170,170,170) forState:0];
            countDownCode.backgroundColor = hexColor(EEEEEE);
            
        } NextToucheBlock:^{
            
            //第二次点击
            [countDownCode setTitle:@"点击重新获取" forState:0];
            [countDownCode setTitleColor:RGB(38, 66, 136) forState:0];
            countDownCode.backgroundColor = [UIColor clearColor];
            
        }];
        
        [_codeView addSubview:countDownCode];
        
    }
    return _codeView;
    
}

- (UIButton *)nextStepButton
{
    if(!_nextStepButton)
    {
        _nextStepButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        _nextStepButton.titleLabel.font = boldSystemFont(14);
        [_nextStepButton setTitle:@"保存" forState:UIControlStateNormal];
        [_nextStepButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _nextStepButton.backgroundColor = mainColor;
        _nextStepButton.layer.cornerRadius = 3;
        [_nextStepButton addTarget:self action:@selector(nextStepButtonClick) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _nextStepButton;
    
}

- (JKTextField *)phoneTF
{
    if(!_phoneTF)
    {
        
        _phoneTF = [[JKTextField alloc]init];
        _phoneTF.backgroundColor = [UIColor whiteColor];
        _phoneTF.placeholder = @"输入号码";
        _phoneTF.font = [UIFont systemFontOfSize:14];
        _phoneTF.clearButtonMode=YES;
        //左侧文字
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 85, TEXT_HEIGHT)];
        label.text = @"  手机号码:";
        label.font = [UIFont systemFontOfSize:14];
        _phoneTF.leftViewMode = UITextFieldViewModeAlways;
        _phoneTF.leftView = label;
        
    }
    return _phoneTF;
}


- (JKPlaceholderTextView *)credentialText {
    if (!_credentialText) {
        _credentialText = [[JKPlaceholderTextView alloc] init];
        _credentialText.textColor = [UIColor blackColor];
        _credentialText.font = [UIFont systemFontOfSize:15];
        _credentialText.text = @"";
        _credentialText.layer.borderColor = [UIColor lightGrayColor].CGColor;
        _credentialText.layer.borderWidth = 0.5;
        _credentialText.placehoderText = @"200字以内";
        _credentialText.limitTextLength = 200;
        _credentialText.limitTextLengthBlock = ^(){
              [SVProgressHUD showErrorWithStatus:@"超出字数限制"];
        };
    }
    return _credentialText;
}

- (JKTextField *)searchBar
{
    if(!_searchBar)
    {
        _searchBar = [[JKTextField alloc]init];
        _searchBar.backgroundColor = [UIColor grayColor];
        _searchBar.borderStyle=UITextBorderStyleRoundedRect;
        _searchBar.placeholder = @"淘淘淘宝贝";
        _searchBar.font = [UIFont systemFontOfSize:14];
        //左侧图片
        UIImageView *searchImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 18, 18)];
        searchImage.image = [UIImage imageNamed:@"iconfont-sousuo"];
        _searchBar.leftView = searchImage;
        _searchBar.leftViewMode = UITextFieldViewModeAlways;
        
    }
    return _searchBar;
}

- (JKTextField *)nameTF
{
    if(!_nameTF)
    {
        _nameTF = [[JKTextField alloc]init];
        _nameTF.backgroundColor = [UIColor whiteColor];
        _nameTF.placeholder = @"输入名称";
        _nameTF.font = [UIFont systemFontOfSize:14];
        //左侧文字
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 85, TEXT_HEIGHT)];
        label.text = @"  用户名称:";
        label.font = [UIFont systemFontOfSize:14];
        _nameTF.leftViewMode = UITextFieldViewModeAlways;
        _nameTF.leftView = label;
        
    }
    return _nameTF;
}

#pragma mark - 系统方法
- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self layoutSubviews];
}




- (void)nextStepButtonClick
{
    if(![RegExpValidate validateMobile:self.phoneTF.text])
    {
        [SVProgressHUD showErrorWithStatus:@"手机格式不正确"];
        return;
    }
}

#pragma mark - 控件布局
- (void)layoutSubviews {
    
    [self.view addSubview:self.scroll];

    [self.scroll addSubview:self.searchBar];
    [self.scroll addSubview:self.phoneTF];
    [self.scroll addSubview:self.nameTF];
    [self.scroll addSubview:self.authCodeTF];

    [self.scroll addSubview:self.credentialText];
    [self.scroll addSubview:self.nextStepButton];
    
    [self.scroll addSubview:self.centerText];

    
//
    [_searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(-20);
        make.top.equalTo(self.scroll).offset(20);
        make.height.equalTo(@(TEXT_HEIGHT));
        
    }];
//
    [_phoneTF mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.equalTo(self.view);
        make.top.equalTo(_searchBar.bottom).offset(10);
         make.height.equalTo(_searchBar);
    }];
    
    [_nameTF mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.equalTo(self.view);
        make.top.equalTo(_phoneTF.bottom).offset(-0.5);
        make.height.equalTo(_searchBar);
    }];
    
    [_authCodeTF mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.equalTo(self.view);
        make.top.equalTo(_nameTF.bottom).offset(-0.5);
        make.height.equalTo(_searchBar);
    }];
    
    [_credentialText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_authCodeTF.bottom).offset(10);
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.height.equalTo(@(100));
        
    }];
    
    [_nextStepButton makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_credentialText.bottom).offset(25);
        make.left.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(-20);
        make.height.equalTo(@40);
    }];
    
    [_centerText makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_nextStepButton.bottom).offset(25);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.height.equalTo(@60);
    }];
    
    
    [self.scroll addSubview:self.mjTextField];
    _mjTextField.frame = CGRectMake(20, 500, SCREEN_WIDTH - 40, 50);
    
    [self.scroll addSubview:self.passTextField];
    _passTextField.frame = CGRectMake(20, 570, SCREEN_WIDTH - 40, 50);
    
   
    
}
//移除kvo
- (void)dealloc{
    
    [_centerText removeObserver:self forKeyPath:@"contentSize" context:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

///////// 键盘 return 点击事件
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    if(textField == _passTextField.mTextField)
    {
        NSLog(@"点击了密码 return");
        [_passTextField.mTextField resignFirstResponder];
        
        if(![RegExpValidate validateMobile:_mjTextField.mTextField.text])
        {
            [SVProgressHUD showErrorWithStatus:@"手机格式不正确"];
        }
        
    }
    else
    {
        NSLog(@"点击了其他 return");//换行
        [_passTextField.mTextField becomeFirstResponder];
    }
    
    return YES;
}
@end
