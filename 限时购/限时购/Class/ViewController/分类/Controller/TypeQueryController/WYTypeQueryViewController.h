//
//  WYTypeQueryViewController.h
//  限时购
//
//  Created by ma c on 16/5/30.
//  Copyright © 2016年 WY. All rights reserved.
//

#import "WYBaseViewController.h"

@interface WYTypeQueryViewController : WYBaseViewController

/**
 用于接收商品分类的 ID用作网络请求的参数
 */
@property (copy, nonatomic) NSString *typeID;

/**
 接收商品分类的名称
 */
@property (copy, nonatomic) NSString *name;

/**
 用来判断是否开始网络请求
 */
@property (assign, nonatomic, getter = isStart) BOOL start;

@end
