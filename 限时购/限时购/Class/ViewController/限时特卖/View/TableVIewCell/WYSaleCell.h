//
//  WYSaleCell.h
//  限时购
//
//  Created by ma c on 16/5/27.
//  Copyright © 2016年 WY. All rights reserved.
//

#import "WYBaseTableCell.h"
@class WYSaleModel;

@interface WYSaleCell : WYBaseTableCell

/**
 用于cell接收数据的模型
 */
@property (strong, nonatomic) WYSaleModel *dataModel;

@end
