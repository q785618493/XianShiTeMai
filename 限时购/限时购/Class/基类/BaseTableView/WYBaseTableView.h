//
//  WYBaseTableView.h
//  限时购
//
//  Created by ma c on 16/5/26.
//  Copyright © 2016年 WY. All rights reserved.
//

#import <UIKit/UIKit.h>
/**   * MJRefresh 刷新的 头文件 */
#import "MJRefresh.h"

#import "MJChiBaoZiHeader.h"

#import "MJChiBaoZiFooter2.h"

/**
 点击 tableView 或者 cell 上按钮事件回调的 block
 */
typedef void(^BtnActionBlock)(NSInteger);

/**
 选中cell用于回调的block
 */
typedef void(^TableCellBlock)(NSInteger);

/**
 下拉刷新数据的 block
 */
typedef void(^LoadNewBlock)();

/**
 上拉加载更多的 block
 */
typedef void(^LoadMoreBlock)();

/**
 cell 上按钮的回调 block
 */
typedef void(^TableCellTagBlock)(NSInteger);

/**
 点击 tableView 上按钮的回调 block
 */
typedef void(^TableBtnTouchBlock)();

@interface WYBaseTableView : UITableView

/**
 选中cell用于回调的block
 */
//@property (copy, nonatomic) TableCellBlock cellRow;

/**
 下拉刷新数据的 block
 */
@property (copy, nonatomic) LoadNewBlock newBlock;

/**
 上拉加载更多的 block
 */
@property (copy, nonatomic) LoadMoreBlock moreBlock;

/**
 头部和底部的刷新动画方法
 */
- (void)baseCellAddMJRefresh;

@end
