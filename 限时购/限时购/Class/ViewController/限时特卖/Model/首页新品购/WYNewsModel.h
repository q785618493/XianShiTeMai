//
//	WYNewsModel.h
//
//	Create by c ma on 27/5/2016
//	Copyright © 2016. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface WYNewsModel : NSObject

@property (nonatomic, strong) NSString * abbreviation;
@property (nonatomic, strong) NSString * alert;
@property (nonatomic, strong) NSString * buyCount;
@property (nonatomic, strong) NSString * countryImg;
@property (nonatomic, strong) NSString * countryName;
@property (nonatomic, strong) NSString * discount;
@property (nonatomic, strong) NSString * domesticPrice;
@property (nonatomic, strong) NSString * foreignPrice;
@property (nonatomic, strong) NSString * formetDate;
@property (nonatomic, strong) NSString * goodsId;
@property (nonatomic, strong) NSString * goodsIntro;
@property (nonatomic, strong) NSString * imgView;
@property (nonatomic, strong) NSString * otherPrice;
@property (nonatomic, strong) NSString * price;
@property (nonatomic, strong) NSString * restTime;
@property (nonatomic, strong) NSString * stock;
@property (nonatomic, strong) NSString * title;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end