//
//  WYMeTableView.h
//  限时购
//
//  Created by ma c on 16/6/2.
//  Copyright © 2016年 WY. All rights reserved.
//

#import "WYBaseTableView.h"



@interface WYMeTableView : WYBaseTableView

/**
 接收数据的 数组
 */
@property (strong, nonatomic) NSArray *dataArray;


/**
 用于选中 cell 回调的 block
 */
@property (copy, nonatomic) TableCellBlock cellRow;

/**
 登录按钮 点击 回调的 block
 */
@property (copy, nonatomic) TableBtnTouchBlock loginBtnAction;

/**
 注册按钮 点击 回调的 block
 */
@property (copy, nonatomic) TableBtnTouchBlock registerBtnAction;

@end
