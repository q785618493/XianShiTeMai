//
//  WYRegisterViewController.m
//  限时购
//
//  Created by ma c on 16/6/2.
//  Copyright © 2016年 WY. All rights reserved.
//

#import "WYRegisterViewController.h"

#import "WYVerifyPhoneViewController.h"

#define BTN_TAG 4200

#define TEXT_LENGTH 22

@interface WYRegisterViewController () <UITextFieldDelegate>

/**
 输入手机号的文本框
 */
@property (strong, nonatomic) UITextField *userTextField;

/**
 输入密码的文本框
 */
@property (strong, nonatomic) UITextField *codeTextField;

/**
 下一步按钮
 */
@property (weak, nonatomic) UIButton *loginBtn;

@end

@implementation WYRegisterViewController

/**
 懒加载输入手机号的文本框
 */
- (UITextField *)userTextField {
    if (!_userTextField) {
        _userTextField = [[UITextField alloc] initWithFrame:(CGRectMake(66, 104, VIEW_WIDTH - 81, 31))];
        [_userTextField setPlaceholder:[NSString stringWithFormat:@"请输入手机号"]];
        [_userTextField setBorderStyle:(UITextBorderStyleRoundedRect)];
        [_userTextField setDelegate:self];
        [_userTextField setKeyboardType:(UIKeyboardTypeNumbersAndPunctuation)];
        [_userTextField setClearButtonMode:(UITextFieldViewModeWhileEditing)];
//        [_userTextField addTarget:self action:@selector(editingChangedTextField) forControlEvents:(UIControlEventEditingChanged)];
    }
    return _userTextField;
}

/**
 懒加载输入密码的文本框
 */
- (UITextField *)codeTextField {
    if (!_codeTextField) {
        _codeTextField = [[UITextField alloc] initWithFrame:(CGRectMake(66, 145, VIEW_WIDTH - 81, 31))];
        [_codeTextField setBorderStyle:(UITextBorderStyleRoundedRect)];
        [_codeTextField setDelegate:self];
        [_codeTextField setSecureTextEntry:YES];
        [_codeTextField setPlaceholder:[NSString stringWithFormat:@"请输入密码"]];
        [_codeTextField setClearButtonMode:(UITextFieldViewModeAlways)];
//        [_codeTextField addTarget:self action:@selector(editingChangedTextField) forControlEvents:(UIControlEventEditingChanged)];
    }
    return _codeTextField;
}

/**
 监听文本框内容 改变的事件
 */
//- (void)editingChangedTextField {
//
//    if (self.userTextField.text.length > 6 && self.codeTextField.text.length > 6) {
//        [self.loginBtn setEnabled:YES];
//    } else {
//        [self.loginBtn setEnabled:NO];
//    }
//}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = [NSString stringWithFormat:@"注册"];
    [self.view setBackgroundColor:RGB(245, 245, 245)];
    
    /**
     添加展示视图
     */
    [self addShowView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.userTextField becomeFirstResponder];
}

/**
 添加展示视图
 */
- (void)addShowView {
    
    UILabel *hintLabel = [[UILabel alloc] initWithFrame:(CGRectMake(15, 74, VIEW_WIDTH - 30, 20))];
    [hintLabel setFont:[UIFont systemFontOfSize:15]];
    [hintLabel setText:[NSString stringWithFormat:@"请输入手机号码注册新用户"]];
    [hintLabel setTextColor:RGB(85, 85, 85)];
    [self.view addSubview:hintLabel];
    
    UILabel *accountLabel = [[UILabel alloc] initWithFrame:(CGRectMake(15, CGRectGetMaxY(hintLabel.frame) + 10, 51, 31))];
    [accountLabel setText:[NSString stringWithFormat:@"账号:"]];
    [self.view addSubview:accountLabel];
    
    [self.view addSubview:self.userTextField];
    
    UILabel *codeLabel = [[UILabel alloc] initWithFrame:(CGRectMake(15, CGRectGetMaxY(accountLabel.frame) + 15, 51, 31))];
    [codeLabel setText:[NSString stringWithFormat:@"密码:"]];
    [self.view addSubview:codeLabel];
    
    [self.view addSubview:self.codeTextField];
    
    UIButton *loginBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [loginBtn setFrame:(CGRectMake(20, CGRectGetMaxY(codeLabel.frame) + 15, VIEW_WIDTH - 40, 40))];
    [loginBtn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"注册界面下一步按钮"]] forState:(UIControlStateNormal)];
//    [loginBtn setEnabled:NO];
    [loginBtn addTarget:self action:@selector(btnTouchActionLogin) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:loginBtn];
    self.loginBtn = loginBtn;
    
    UIButton *registerBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [registerBtn setFrame:(CGRectMake(VIEW_WIDTH - 80, CGRectGetMaxY(loginBtn.frame) + 15, 60, 20))];
    [registerBtn setTitle:[NSString stringWithFormat:@"去登录"] forState:(UIControlStateNormal)];
    [registerBtn setTitleColor:RGB(0, 147, 190) forState:(UIControlStateNormal)];
    [registerBtn addTarget:self action:@selector(btnTouchActionRegister) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:registerBtn];
    
    UILabel *lineLabel = [[UILabel alloc] initWithFrame:(CGRectMake(20, 23 + CGRectGetMaxY(registerBtn.frame), VIEW_WIDTH - 40, 1))];
    [lineLabel setBackgroundColor:RGB(208, 208, 208)];
    [self.view addSubview:lineLabel];
    
    UILabel *oneLoginLabel = [[UILabel alloc] initWithFrame:(CGRectMake((VIEW_WIDTH - 90) * 0.5, CGRectGetMaxY(registerBtn.frame) + 15, 90, 17))];
    [oneLoginLabel setBackgroundColor:RGB(245, 245, 245)];
    [oneLoginLabel setTextAlignment:(NSTextAlignmentCenter)];
    [oneLoginLabel setFont:[UIFont systemFontOfSize:16]];
    [oneLoginLabel setTextColor:RGB(208, 208, 208)];
    [oneLoginLabel setText:[NSString stringWithFormat:@"一键登录"]];
    [self.view addSubview:oneLoginLabel];
    
    NSArray *threeArray = [[NSArray alloc] initWithObjects:[NSString stringWithFormat:@"登录界面qq登陆"],[NSString stringWithFormat:@"登录界面微信登录"],[NSString stringWithFormat:@"登陆界面微博登录"], nil];
    
    NSInteger margin = 45;
    
    CGFloat width = (VIEW_WIDTH - threeArray.count * margin) * 0.25;
    
    for (NSInteger i = 0; i < threeArray.count; i ++) {
        
        UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [btn setTag:i + BTN_TAG];
        [btn setImage:[UIImage imageNamed:threeArray[i]] forState:(UIControlStateNormal)];
        [btn setFrame:(CGRectMake(i * (width + margin) + width, CGRectGetMaxY(oneLoginLabel.frame) + 20, margin, margin))];
        [btn addTarget:self action:@selector(btnTouchActionThree:) forControlEvents:(UIControlEventTouchUpInside)];
        [self.view addSubview:btn];
    }
}

/**
 下一步按钮的点击事件
 */
- (void)btnTouchActionLogin {
    
    [self.view endEditing:YES];
    
    if ([self.userTextField.text isEmptyString]) {
        
        [self.view makeToast:[NSString stringWithFormat:@"账号不能为空"] duration:1.5 position:[NSString stringWithFormat:@"center"]];
        
    } else if ([self.codeTextField.text isEmptyString]) {
        
        [self.view makeToast:[NSString stringWithFormat:@"密码不能为空"] duration:1.5 position:[NSString stringWithFormat:@"center"]];
        
    } else if ([self.userTextField.text checkTel] && self.codeTextField.text.length >= 6) {
        
        WYVerifyPhoneViewController *verifyVC = [[WYVerifyPhoneViewController alloc] init];
        verifyVC.phoneNumber = self.userTextField.text;
        verifyVC.codeText = [self.codeTextField.text trimString];
        [self.navigationController pushViewController:verifyVC animated:YES];
        
//        WS(weakSelf);
//        NSDictionary *requestDic = @{@"LoginName":self.userTextField.text,
//                                     @"Lpassword":self.codeTextField.text};
//        
//        [self GETHttpRequestUrl:[NSString stringWithFormat:@"http://123.57.141.249:8080/beautalk/appMember/appRegistration.do"] dic:requestDic successBlock:^(id JSON) {
//            
//            NSDictionary *dic = JSON;
//            
//            NSLog(@"====%@",dic);
//            
//            
//        } errorBlock:^(NSError *error) {
//            
//            NSLog(@"=%s =%@",__func__,error);
//        }];
    } else {
        
        [self.view makeToast:[NSString stringWithFormat:@"手机号或者密码有误"] duration:1.5 position:[NSString stringWithFormat:@"center"]];
    }
}

/**
 去登录按钮的点击事件
 */
- (void)btnTouchActionRegister {
    
    
}

/**
 第三方登录按钮的点击事件
 */
- (void)btnTouchActionThree:(UIButton *)threeBtn {
    
    NSInteger isTag = threeBtn.tag - BTN_TAG;
    
    switch (isTag) {
        case 0: {
            
            [MBProgressHUD showMessage:[NSString stringWithFormat:@"QQ已经挂掉,请充值腾讯会员"]];
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [MBProgressHUD hideHUD];
            });
        }
            
            break;
        case 1: {
            
            [MBProgressHUD showMessage:[NSString stringWithFormat:@"微信去开小差,请选择免费注册"]];
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [MBProgressHUD hideHUD];
            });
        }
            
            break;
        case 2: {
            
            [MBProgressHUD showMessage:[NSString stringWithFormat:@"微博实在太紧了,不让人用呀"]];
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [MBProgressHUD hideHUD];
            });
        }
            
            
            
        default:
            break;
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
    
}

#pragma make- UITextFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
//    if (textField.text.length > TEXT_LENGTH) {
//        
//        textField.text = [textField.text substringToIndex:TEXT_LENGTH - 1];
//        
//        return NO;
//    }
    
    if (self.userTextField.text.length >= 12) {
        self.userTextField.text = [self.userTextField.text substringToIndex:11];
        return NO;
    }
    
    if (self.codeTextField.text.length >= TEXT_LENGTH) {
        self.codeTextField.text = [self.codeTextField.text substringToIndex:TEXT_LENGTH -1];
        return NO;
    }
    
    return YES;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
