//
//  WYQueryModel.m
//  限时购
//
//  Created by ma c on 16/6/1.
//  Copyright © 2016年 WY. All rights reserved.
//

#import "WYQueryModel.h"

@implementation WYQueryModel

- (instancetype)initWithDic:(NSDictionary *)dic {
    
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

+ (instancetype)queryModelDic:(NSDictionary *)dic {
    return [[self alloc] initWithDic:dic];
}

@end
