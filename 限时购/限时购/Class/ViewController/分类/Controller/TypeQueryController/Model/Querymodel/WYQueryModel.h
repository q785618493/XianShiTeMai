//
//  WYQueryModel.h
//  限时购
//
//  Created by ma c on 16/6/1.
//  Copyright © 2016年 WY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WYQueryModel : NSObject

@property (copy, nonatomic) NSString *Abbreviation;

@property (copy, nonatomic) NSString *Alert;

@property (copy, nonatomic) NSString *BuyCount;

@property (copy, nonatomic) NSString *CountryImg;

@property (copy, nonatomic) NSString *CountryName;

@property (copy, nonatomic) NSString *Discount;

@property (copy, nonatomic) NSString *DomesticPrice;

@property (copy, nonatomic) NSString *ForeignPrice;

@property (copy, nonatomic) NSString *FormetDate;

@property (copy, nonatomic) NSString *GoodsId;

@property (copy, nonatomic) NSString *GoodsIntro;

@property (copy, nonatomic) NSString *ImgView;

@property (copy, nonatomic) NSString *OtherPrice;

@property (copy, nonatomic) NSString *Price;

@property (copy, nonatomic) NSString *RestTime;

@property (copy, nonatomic) NSString *Stock;

@property (copy, nonatomic) NSString *Title;


- (instancetype)initWithDic:(NSDictionary *)dic;

+ (instancetype)queryModelDic:(NSDictionary *)dic;

@end
