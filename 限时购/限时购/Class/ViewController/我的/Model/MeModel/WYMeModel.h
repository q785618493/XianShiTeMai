//
//  WYMeModel.h
//  限时购
//
//  Created by ma c on 16/6/2.
//  Copyright © 2016年 WY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WYMeModel : NSObject <NSCoding>

@property (copy, nonatomic) NSString *title;

@property (copy, nonatomic) NSString *image;

@property (copy, nonatomic) NSString *detailText;

@property (assign, nonatomic, getter = isStatus) BOOL isStatus;

- (instancetype)initWithDic:(NSDictionary *)dic;

+ (instancetype)meModelDic:(NSDictionary *)dic;

@end
