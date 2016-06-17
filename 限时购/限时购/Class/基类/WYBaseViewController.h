//
//  WYBaseViewController.h
//  限时购
//
//  Created by ma c on 16/5/26.
//  Copyright © 2016年 WY. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Masonry.h"

#import "AFNetworking.h"

#import "UIImage+ImageSetting.h"
#import "UIImageView+SDWedImage.h"
#import "UIButton+WebCache.h"

#import "UIView+Toast.h"
#import "JPRefreshView.h"
#import "UIBarButtonItem+Helper.h"
#import "ZJPBaseHttpTool.h"

#import "MJRefresh.h"
#import "MJChiBaoZiHeader.h"
#import "MJChiBaoZiFooter2.h"

#import "MBProgressHUD+XMG.h"

#import "WYCustomButton.h"
#import "MTool.h"

/**
 网络请求成功接收数据的 block
 */
typedef void(^HttpSuccessBlock)(id JSON);

/**
 网络请求失败,返回失败原因的 block
 */
typedef void(^HttpErrorBlock)(NSError *error);

@interface WYBaseViewController : UIViewController

/**
 网络请求成功接收数据的 block
 */
@property (copy, nonatomic) HttpSuccessBlock successBlock;

/**
 网络请求失败,返回失败原因的 block
 */
@property (copy, nonatomic) HttpErrorBlock errorBlock;

/**
 GET 网络请求
 */
- (void)GETHttpRequestUrl:(NSString *)url
                      dic:(NSDictionary *)dic
             successBlock:(HttpSuccessBlock)requestSuccess
               errorBlock:(HttpErrorBlock)requestError;


/**
 POST 网络请求
 */
- (void)POSTHttpRequestUrl:(NSString *)url
                       dic:(NSDictionary *)dic
              successBlock:(HttpSuccessBlock)requestSuccess
                errorBlock:(HttpErrorBlock)requestError;

@end
