//
//  WYProductViewController.h
//  限时购
//
//  Created by ma c on 16/5/28.
//  Copyright © 2016年 WY. All rights reserved.
//

#import "WYBaseViewController.h"

@interface WYProductViewController : WYBaseViewController

/** 接收商品的 ID,做网络请求参数,得到该商品的信息 */
@property (copy, nonatomic) NSString *goodsID;

/** 国旗图片的网络路径 */
@property (copy, nonatomic) NSString *countryImageUrl;

/** 判断是执行否网络请求 */
@property (assign, nonatomic, getter = isStart) BOOL start;

@end
