//
//  WYMeHeaderView.m
//  限时购
//
//  Created by ma c on 16/6/6.
//  Copyright © 2016年 WY. All rights reserved.
//

#import "WYMeHeaderView.h"
#import "WYMeTableView.h"

@interface WYMeHeaderView ()

/** 注册 和 登录 视图 */
@property (strong, nonatomic) UIImageView *topImageView;

/** 登录按钮 */
@property (strong, nonatomic) UIButton *loginBtn;

/** 注册按钮*/
@property (strong, nonatomic) UIButton *registerBtn;

/** 用户名称*/
@property (weak, nonatomic) UILabel *nameLabel;

/** 会员状态*/
@property (weak, nonatomic) UILabel *memberLabel;

/** 用户按钮*/
@property (strong, nonatomic) UIButton *userBtn;

@end

@implementation WYMeHeaderView

/**
 懒加载 注册 和 登录 视图
 */
- (UIImageView *)topImageView {
    if (!_topImageView) {
        _topImageView = [[UIImageView alloc] initWithFrame:(CGRectMake(0, 0, VIEW_WIDTH, 125))];
        [_topImageView setUserInteractionEnabled:YES];
        [_topImageView setBackgroundColor:RGB(103, 207, 234)];
        
    }
    return _topImageView;
}

/**
 懒加载登录按钮
 */
- (UIButton *)loginBtn {
    if (!_loginBtn) {
        _loginBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_loginBtn setFrame:(CGRectMake(0, 0, VIEW_WIDTH * 0.5, 125))];
        [_loginBtn setTitle:[NSString stringWithFormat:@"登 录"] forState:(UIControlStateNormal)];
        [_loginBtn.titleLabel setFont:[UIFont boldSystemFontOfSize:19]];
        [_loginBtn addTarget:self action:@selector(btnTouchActionLogin:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _loginBtn;
}

/**
 登录按钮点击事件
 */
- (void)btnTouchActionLogin:(UIButton *)loginBtn {
    if (_loginBlock) {
        _loginBlock();
    }
}

/**
 懒加载注册按钮
 */
- (UIButton *)registerBtn {
    if (!_registerBtn) {
        _registerBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_registerBtn setFrame:(CGRectMake(VIEW_WIDTH * 0.5, 0, VIEW_WIDTH * 0.5, 125))];
        [_registerBtn setTitle:[NSString stringWithFormat:@"注 册"] forState:(UIControlStateNormal)];
        [_registerBtn.titleLabel setFont:[UIFont boldSystemFontOfSize:19]];
        [_registerBtn addTarget:self action:@selector(btnTouchActionRegister:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _registerBtn;
}

/**
 注册按钮点击事件
 */
- (void)btnTouchActionRegister:(UIButton *)registerBtn {
    if (_registerBlock) {
        _registerBlock();
    }
}

/** 懒加载 用户按钮*/
- (UIButton *)userBtn {
    if (!_userBtn) {
        _userBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_userBtn setFrame:(CGRectMake(25, 12, 100, 100))];
        [_userBtn.layer setMasksToBounds:YES];
        [_userBtn.layer setCornerRadius:50];
        [_userBtn setImage:[UIImage imageNamed:@"图标"] forState:(UIControlStateNormal)];
        [_userBtn addTarget:self action:@selector(btnTouchActionUser:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _userBtn;
}

/** 登录 和 注册 的视图方法*/
+ (instancetype)showMeHeaderViewAddWidth:(CGFloat)width height:(CGFloat)height {
    
    WYMeHeaderView *headerView = [[WYMeHeaderView alloc] initWithFrame:(CGRectMake(0, 0, width, height))];
    [headerView addSubview:headerView.topImageView];
    [headerView.topImageView addSubview:headerView.loginBtn];
    [headerView.topImageView addSubview:headerView.registerBtn];
    
    return headerView;
}

/** 隐藏移除 登录 和 注册 的视图方法*/
- (void)hiddenDeleteView {
    [self removeFromSuperview];
}

/** 用户登录完成后的顶部视图*/
+ (instancetype)meHeaderViewAddWidth:(CGFloat)width height:(CGFloat)height {
    
    WYMeHeaderView *headerView = [[WYMeHeaderView alloc] initWithFrame:(CGRectMake(0, 0, width, height))];
    
    UIImageView *topImageView = [[UIImageView alloc] initWithFrame:(CGRectMake(0, 0, width, height))];
    [topImageView setUserInteractionEnabled:YES];
    [topImageView setBackgroundColor:RGB(103, 207, 234)];
    [headerView addSubview:topImageView];
    
    /** 用户按钮*/
//    UIButton *userBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
//    [userBtn setFrame:(CGRectMake(25, 12, 100, 100))];
//    [userBtn.layer setMasksToBounds:YES];
//    [userBtn.layer setCornerRadius:50];
//    [userBtn setImage:[UIImage imageNamed:@"图标"] forState:(UIControlStateNormal)];
//    [userBtn addTarget:self action:@selector(btnTouchActionUser:) forControlEvents:(UIControlEventTouchUpInside)];
    [topImageView addSubview:headerView.userBtn];
    
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:(CGRectMake(150, 33, width - 175, 20))];
    [nameLabel setFont:[UIFont systemFontOfSize:15]];
    [nameLabel setTextColor:[UIColor whiteColor]];
    [topImageView addSubview:nameLabel];
    headerView.nameLabel = nameLabel;
    
    UILabel *memberLabel = [[UILabel alloc] initWithFrame:(CGRectMake(150, 72, width - 175, 20))];
    [memberLabel setFont:[UIFont systemFontOfSize:15]];
    [memberLabel setTextColor:[UIColor whiteColor]];
    [topImageView addSubview:memberLabel];
    headerView.memberLabel = memberLabel;
    
    return headerView;
}

/** 用户按钮点击事件*/
- (void)btnTouchActionUser:(UIButton *)userBtn {
    
    if (_userBlock) {
        _userBlock();
    }
}

/** 重写set 方法赋值*/
- (void)setMeberDic:(NSDictionary *)meberDic {
    
    _meberDic = meberDic;
    self.nameLabel.text = meberDic[@"name"];
    self.memberLabel.text = meberDic[@"member"];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
