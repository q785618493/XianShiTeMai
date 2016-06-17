//
//  WYMeTableView.m
//  限时购
//
//  Created by ma c on 16/6/2.
//  Copyright © 2016年 WY. All rights reserved.
//

#import "WYMeTableView.h"
#import "WYMeModel.h"

@interface WYMeTableView () <UITableViewDataSource,UITableViewDelegate>

/**
 注册 和 登录 视图
 */
@property (strong, nonatomic) UIImageView *topImageView;

/**
 登录按钮
 */
@property (strong, nonatomic) UIButton *loginBtn;

/**
 注册按钮
 */
@property (strong, nonatomic) UIButton *registerBtn;

@end

@implementation WYMeTableView

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
    if (_loginBtnAction) {
        _loginBtnAction();
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
    if (_registerBtnAction) {
        _registerBtnAction();
    }
    
}

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    
    if (self = [super initWithFrame:frame style:style]) {
        
        [self setDelegate:self];
        [self setDataSource:self];
        [self setShowsVerticalScrollIndicator:NO];
        [self setTableFooterView:[[UIView alloc] init]];
//        [self setTableHeaderView:self.topImageView];
//        [self.topImageView addSubview:self.loginBtn];
//        [self.topImageView addSubview:self.registerBtn];
        [self setBackgroundColor:RGB(245, 245, 245)];
        
    }
    return self;
}

#pragma make- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *IDCell = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:IDCell];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:IDCell];
    }
    
    WYMeModel *model = self.dataArray[indexPath.row];
    
    [cell.textLabel setText:model.title];
    [cell.imageView setImage:[UIImage imageNamed:model.image]];
    [cell.detailTextLabel setText:model.detailText];
    
    [cell setAccessoryType:(UITableViewCellAccessoryDisclosureIndicator)];
    
    return cell;
}

#pragma make- UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (_cellRow) {
        _cellRow(indexPath.row);
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
