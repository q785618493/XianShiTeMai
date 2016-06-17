//
//  WYCenterView.h
//  限时购
//
//  Created by ma c on 16/5/30.
//  Copyright © 2016年 WY. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WYAllDetailsModel;

typedef void(^BtnPushBlock)();

@interface WYCenterView : UIView

/**
 按钮点击事件回调的 block
 */
@property (copy, nonatomic) BtnPushBlock btnAction;

/**
 国旗图片的网络路径
 */
@property (copy, nonatomic) NSString *countryUrl;

- (instancetype)initWithFrame:(CGRect)frame model:(WYAllDetailsModel *)model;

@end
