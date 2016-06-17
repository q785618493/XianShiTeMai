//
//  WYMeHeaderView.h
//  限时购
//
//  Created by ma c on 16/6/6.
//  Copyright © 2016年 WY. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WYMeTableView;

typedef void(^HederBtnActionBlock)();

@interface WYMeHeaderView : UIView

/** 注册按钮的点击事件的 回block调*/
@property (copy, nonatomic) HederBtnActionBlock registerBlock;

/** 登录按钮的点击事件的 回block调*/
@property (copy, nonatomic) HederBtnActionBlock loginBlock;

/** 用户按钮的点击事件的 回block调*/
@property (copy, nonatomic) HederBtnActionBlock userBlock;

/** 登录 和 注册 的视图方法*/
+ (instancetype)showMeHeaderViewAddWidth:(CGFloat)width
                                   height:(CGFloat)height;

/** 隐藏移除 登录 和 注册 的视图方法*/
- (void)hiddenDeleteView;

/** 用户登录完成后的顶部视图*/
+ (instancetype)meHeaderViewAddWidth:(CGFloat)width
                              height:(CGFloat)height;


/** 用户名称 和 会员状态*/
@property (strong, nonatomic) NSDictionary *meberDic;

@end
