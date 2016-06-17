//
//  WYVerifyPhoneViewController.m
//  限时购
//
//  Created by ma c on 16/6/2.
//  Copyright © 2016年 WY. All rights reserved.
//

#import "WYVerifyPhoneViewController.h"
#import "GCDCountdownTime.h"

@interface WYVerifyPhoneViewController () <UITextFieldDelegate>

/** 输入验证码的文本框 */
@property (strong, nonatomic) UITextField *verifyTextField;

/** 注册按钮 */
@property (weak, nonatomic) UIButton *logonBtn;

/** 倒计时按钮 */
@property (weak, nonatomic) WYCustomButton *testBtn;

/** 重获验证码按钮 */
@property (weak, nonatomic) UIButton *againBtn;

@end

@implementation WYVerifyPhoneViewController

/**
 懒加载输入验证码的文本框
 */
- (UITextField *)verifyTextField {
    if (!_verifyTextField) {
        _verifyTextField = [[UITextField alloc] initWithFrame:(CGRectMake(0, 104, VIEW_WIDTH, 31))];
        [_verifyTextField setBackgroundColor:[UIColor whiteColor]];
        [_verifyTextField setBorderStyle:(UITextBorderStyleNone)];
        [_verifyTextField setDelegate:self];
        [_verifyTextField setKeyboardType:(UIKeyboardTypeNumbersAndPunctuation)];
        [_verifyTextField setRightViewMode:(UITextFieldViewModeAlways)];
//        [_verifyTextField addTarget:self action:@selector(fieldEditingChangedVerify:) forControlEvents:(UIControlEventEditingChanged)];
        
    }
    return _verifyTextField;
}

/** 监听文本框输入内容改变的方法 */
- (void)fieldEditingChangedVerify:(UITextField *)verifyField {
    
    if (verifyField.text.length == 6) {
        
        [self.logonBtn setEnabled:YES];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = [NSString stringWithFormat:@"验证手机号"];
    [self.view setBackgroundColor:RGB(245, 245, 245)];
    
    /** 添加展示视图 */
    [self addShowView];
    
    /** 获取验证码的网络请求 */
    [self httpPostSecuritycode];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self.verifyTextField becomeFirstResponder];
    
    /**
     KVO 监听倒计时按钮title的变化
     */
    [self.testBtn addObserver:self forKeyPath:[NSString stringWithFormat:@"btnTitleType"] options:NSKeyValueObservingOptionNew context:nil];
    
}

/**
 监听的方法
 */
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    
    if (self.testBtn.btnTitleType == TestBtnTitleTypeSpecial) {
        
        [self.againBtn setEnabled:YES];
        self.againBtn.selected = !self.againBtn.selected;
    }
}


- (void)dealloc {
    [self.testBtn removeObserver:self forKeyPath:[NSString stringWithFormat:@"btnTitleType"]];
}

/**
 添加展示视图的所有控件
 */
- (void)addShowView {
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:(CGRectMake(15, 74, VIEW_WIDTH - 30, 20))];
    
    NSAttributedString *infoAttrStr = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"验证码已发送到"] attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15],NSForegroundColorAttributeName:RGB(165, 165, 165)}];
    
    NSAttributedString *phoneAttrStr = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"+86 %@",self.phoneNumber] attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15],NSForegroundColorAttributeName:RGB(0, 187, 239)}];
    
    NSMutableAttributedString *muAttrString = [[NSMutableAttributedString alloc] init];
    
    [muAttrString insertAttributedString:infoAttrStr atIndex:0];
    [muAttrString insertAttributedString:phoneAttrStr atIndex:infoAttrStr.length];
    [titleLabel setAttributedText:muAttrString];
    [self.view addSubview:titleLabel];
    
    [self.view addSubview:self.verifyTextField];
    
    WYCustomButton *testBtn = [WYCustomButton buttonWithType:(UIButtonTypeCustom)];
    [testBtn setFrame:(CGRectMake(0, 0, 100, 31))];
    [testBtn.titleLabel setFont:[UIFont systemFontOfSize:13]];
    [testBtn setBtnTitleType:(TestBtnTitleTypeNothing)];
    [self.verifyTextField setRightView:testBtn];
    self.testBtn = testBtn;
    
    UILabel *lineLabel = [[UILabel alloc] initWithFrame:(CGRectMake(0, 0, 5, 1))];
    [self.verifyTextField setLeftView:lineLabel];
    [self.verifyTextField setLeftViewMode:(UITextFieldViewModeAlways)];
    
    UIButton *logonBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [logonBtn setFrame:(CGRectMake(20, CGRectGetMaxY(self.verifyTextField.frame) + 20, VIEW_WIDTH - 40, 40))];
    [logonBtn setBackgroundColor:RGB(230, 230, 230)];
    [logonBtn setTitle:[NSString stringWithFormat:@"注册"] forState:(UIControlStateNormal)];
    [logonBtn setTitleColor:RGB(151, 151, 151) forState:(UIControlStateDisabled)];
    [logonBtn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [logonBtn setTitleColor:RGB(0, 187, 239) forState:(UIControlStateHighlighted)];
    [logonBtn addTarget:self action:@selector(btnTouchActionLogon:) forControlEvents:(UIControlEventTouchUpInside)];
//    [logonBtn setEnabled:NO];
    [self.view addSubview:logonBtn];
    self.logonBtn = logonBtn;
    
    UIButton *againBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [againBtn setFrame:(CGRectMake(20, CGRectGetMaxY(logonBtn.frame) + 20, VIEW_WIDTH - 40, 40))];
    [againBtn setBackgroundColor:RGB(230, 230, 230)];
    [againBtn setTitle:[NSString stringWithFormat:@"重新发送验证码"] forState:(UIControlStateNormal)];
    [againBtn setTitleColor:RGB(199, 199, 199) forState:(UIControlStateNormal)];
    [againBtn setTitleColor:RGB(0, 187, 239) forState:(UIControlStateHighlighted)];
    [againBtn setSelected:YES];
    [againBtn setEnabled:NO];
    [againBtn addTarget:self action:@selector(btnTouchActionAgain:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:againBtn];
    self.againBtn = againBtn;
}

/**
 获取验证码的网络请求
 */
- (void)httpPostSecuritycode {
    
//    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:_phoneNumber,@"MemberId", nil];
    
    NSLog(@"---------%@---",self.phoneNumber);
    
    NSDictionary *dic = @{@"MemberId":self.phoneNumber};
    
    WS(weakSelf);
    [self POSTHttpRequestUrl:[NSString stringWithFormat:@"http://123.57.141.249:8080/beautalk/appMember/createCode.do"] dic:dic successBlock:^(id JSON) {
        
        NSDictionary *dataDic = JSON;
        
        NSLog(@"=====Dic==%@",dataDic);
        
        if ([dataDic[@"result"] isEqual:@"success"]) {
            
            [GCDCountdownTime GCDTimeMethod:weakSelf.testBtn];
            
        }
        
    } errorBlock:^(NSError *error) {
        
        [weakSelf.view makeToast:[NSString stringWithFormat:@"获取失败"] duration:1.5 position:[NSString stringWithFormat:@"center"]];
        NSLog(@"=%s \n=%@",__func__,error);
        
    }];
}

/**
 注册按钮点击事件
 */
- (void)btnTouchActionLogon:(UIButton *)logonBtn {
    
//    if ([self.verifyTextField.text isEmptyString]) {
//        
//        [self.view makeToast:[NSString stringWithFormat:@"验证码不能为空"] duration:1.5 position:[NSString stringWithFormat:@"center"]];
//        
//    } else if ([self.verifyTextField.text isEqualToString:[NSString stringWithFormat:@"123456"]]) {
//        
//        [self.view makeToast:[NSString stringWithFormat:@"注册成功"] duration:1.5 position:[NSString stringWithFormat:@"center"]];
//        [self.navigationController popViewControllerAnimated:YES];
//        
//    } else {
//        
//        [self.view makeToast:[NSString stringWithFormat:@"验证码错误"] duration:1.5 position:[NSString stringWithFormat:@"center"]];
//    }
    
    if ([self.verifyTextField.text isEmptyString]) {
        
        [self.view makeToast:[NSString stringWithFormat:@"验证码不能为空"] duration:1.5 position:[NSString stringWithFormat:@"center"]];
        
    } else {
        
        [self httpGetLandingMethod];
    }
}

/**
 注册的网络请求
 */
- (void)httpGetLandingMethod {
    
    WS(weakSelf);
    
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:self.phoneNumber,@"LoginName",self.codeText,@"Lpassword",self.verifyTextField.text,@"Code",self.phoneNumber,@"Telephone", nil];
    
    [self GETHttpRequestUrl:[NSString stringWithFormat:@"http://123.57.141.249:8080/beautalk/appMember/appRegistration.do"] dic:dic successBlock:^(id JSON) {
        
        NSDictionary *dataDic = JSON;
        
        NSLog(@"=====Dic==%@",dataDic);
        
        if ([dataDic[@"result"] isEqual:@"success"]) {
            
            [weakSelf.view makeToast:[NSString stringWithFormat:@"注册成功"] duration:1.5 position:[NSString stringWithFormat:@"center"]];
            
        }
        
    } errorBlock:^(NSError *error) {
        
        [weakSelf.view makeToast:[NSString stringWithFormat:@"注册失败"] duration:1.5 position:[NSString stringWithFormat:@"center"]];
        NSLog(@"==%s \n==%@",__func__,error);
    }];
}

/**
 重新发送验证码按钮点击事件
 */
- (void)btnTouchActionAgain:(UIButton *)againBtn {
    
    againBtn.selected = !againBtn.selected;
    againBtn.enabled = !againBtn.enabled;
    
    [GCDCountdownTime GCDTimeMethod:self.testBtn];
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

#pragma make- UITextFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    if (textField.text.length >= 7 ) {
        textField.text = [textField.text substringToIndex:6];
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
