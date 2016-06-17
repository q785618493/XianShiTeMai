//
//  WYVerifyPhoneViewController.h
//  限时购
//
//  Created by ma c on 16/6/2.
//  Copyright © 2016年 WY. All rights reserved.
//

#import "WYBaseViewController.h"



@interface WYVerifyPhoneViewController : WYBaseViewController

/**
 接收到电话号码
 */
@property (copy, nonatomic) NSString *phoneNumber;

/**
 
 */
@property (copy, nonatomic) NSString *codeText;

@end
