//
//  WYSortCollection.h
//  限时购
//
//  Created by ma c on 16/5/27.
//  Copyright © 2016年 WY. All rights reserved.
//

#import "WYBaseCollecrion.h"

@interface WYSortCollection : WYBaseCollecrion

/**
 给外部的接口,接收数据的数组
 */
@property (strong, nonatomic) NSArray *sortArray;

/**
 选中cell触发回调的 block
 */
@property (copy, nonatomic) CellSeleBlock cellRow;

@end
