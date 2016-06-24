//
//  WYQueryCell.h
//  限时购
//
//  Created by ma c on 16/6/1.
//  Copyright © 2016年 WY. All rights reserved.
//

#import "WYBaseCollectionCell.h"
@class WYQueryModel;

@interface WYQueryCell : WYBaseCollectionCell

/** 接收数据的 model */
@property (strong, nonatomic) WYQueryModel *model;

@end
