//
//  WYFlashTable.h
//  限时购
//
//  Created by ma c on 16/5/26.
//  Copyright © 2016年 WY. All rights reserved.
//

#import "WYBaseTableView.h"



@interface WYFlashTable : WYBaseTableView

/**
 选中cell用于回调的block
 */
@property (copy, nonatomic) TableCellBlock cellRow;

/**
 点击表格头部视图按钮回调的block
 */
@property (copy, nonatomic) BtnActionBlock btnTag;

/**
 接收数据的
 */
@property (strong, nonatomic) NSArray *flashAray;

/**
 判断数据类型的
 */
@property (assign, nonatomic, getter = isJudge) BOOL judge;

/**
 选中 cell 上按钮的回调 block
 */
@property (copy, nonatomic) TableCellTagBlock cellBtnAction;

@end

