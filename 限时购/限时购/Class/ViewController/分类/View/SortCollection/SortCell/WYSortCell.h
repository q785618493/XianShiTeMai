//
//  WYSortCell.h
//  限时购
//
//  Created by ma c on 16/5/27.
//  Copyright © 2016年 WY. All rights reserved.
//

#import "WYBaseCollectionCell.h"

@class WYSortModel;

@interface WYSortCell : WYBaseCollectionCell

/**
 model 数据接口
 */
@property (strong, nonatomic) WYSortModel *model;

@end
