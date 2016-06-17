//
//  WYMeModel.m
//  限时购
//
//  Created by ma c on 16/6/2.
//  Copyright © 2016年 WY. All rights reserved.
//

#import "WYMeModel.h"

static NSString *keyTitle = @"title";

static NSString *keyImage = @"image";

static NSString *keyDetailText = @"detailText";

static NSString *keyStatus = @"isStatus";

@implementation WYMeModel

- (instancetype)initWithDic:(NSDictionary *)dic {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

+ (instancetype)meModelDic:(NSDictionary *)dic {
    return [[self alloc] initWithDic:dic];
}

#pragma make- 
#pragma make- NSCoding 归档
- (void)encodeWithCoder:(NSCoder *)aCoder {
    
    [aCoder encodeBool:_isStatus forKey:keyStatus];
    [aCoder encodeObject:_title forKey:keyTitle];
    [aCoder encodeObject:_image forKey:keyImage];
    [aCoder encodeObject:_detailText forKey:keyDetailText];
}

#pragma make- NSCoding 解档
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    _isStatus = [aDecoder decodeBoolForKey:keyStatus];
    _title = [aDecoder decodeObjectForKey:keyTitle];
    _image = [aDecoder decodeObjectForKey:keyImage];
    _detailText = [aDecoder decodeObjectForKey:keyDetailText];
    
    return self;
}

@end
