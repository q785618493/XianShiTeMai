//
//  WYNewsCell.h
//  限时购
//
//  Created by ma c on 16/5/27.
//  Copyright © 2016年 WY. All rights reserved.
//

#import "WYBaseTableCell.h"
@class WYNewsModel;

@interface WYNewsCell : WYBaseTableCell

/** 提供数据的接口 */
@property (strong, nonatomic) WYNewsModel *dataModel;

/** cell 上按钮点击事件的回调 block */
@property (copy, nonatomic) CellBtnBlock cellBtnTag;

/** 保存cell行数 */
@property (assign, nonatomic) NSInteger cellTag;

@end
