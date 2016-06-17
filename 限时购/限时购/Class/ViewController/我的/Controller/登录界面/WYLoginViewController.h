//
//  WYLoginViewController.h
//  限时购
//
//  Created by ma c on 16/6/2.
//  Copyright © 2016年 WY. All rights reserved.
//

#import "WYBaseViewController.h"

@class WYLoginViewController, WYMeModel;

@protocol WYLoginViewControllerDelegate <NSObject>

@optional
- (void)loginView:(WYLoginViewController *)loginview
      judgeStatus:(BOOL)status
      couponModel:(WYMeModel *)couponModel
       moneyModel:(WYMeModel *)moneyModel
          userDic:(NSDictionary *)userDic;

@end

@interface WYLoginViewController : WYBaseViewController

/** WYLoginViewControllerDelegate协议的代理对象*/
@property (weak, nonatomic) id <WYLoginViewControllerDelegate> delegate;

@end
