//
//  GCDCountdownTime.h
//  HaveFace
//
//  Created by 赵金鹏 on 15/11/24.
//  Copyright © 2015年 赵金鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
@class WYCustomButton;

@interface GCDCountdownTime : NSObject

/**
 注册的验证码倒计时
 */
+ (void)GCDTimeMethod:(WYCustomButton *)countdownBtn;

@end
