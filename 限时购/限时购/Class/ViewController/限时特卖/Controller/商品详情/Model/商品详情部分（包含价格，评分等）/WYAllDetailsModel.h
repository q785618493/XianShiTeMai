//
//	WYAllDetailsModel.h
//
//	Create by c ma on 30/5/2016
//	Copyright © 2016. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface WYAllDetailsModel : NSObject

@property (nonatomic, strong) NSString * abbreviation;
@property (nonatomic, strong) NSObject * activityName;
@property (nonatomic, strong) NSString * activityTime;
@property (nonatomic, strong) NSString * brandCNName;
@property (nonatomic, strong) NSString * buyCount;
@property (nonatomic, strong) NSString * countryName;
@property (nonatomic, strong) NSString * discount;
@property (nonatomic, strong) NSString * domesticPrice;
@property (nonatomic, strong) NSString * favorableRate;
@property (nonatomic, strong) NSString * goodsId;
@property (nonatomic, strong) NSString * goodsIntro;
@property (nonatomic, strong) NSString * goodsTitle;
@property (nonatomic, strong) NSString * htmUrl;
@property (nonatomic, strong) NSString * notice;
@property (nonatomic, strong) NSString * originalPrice;
@property (nonatomic, strong) NSString * overseasPrice;
@property (nonatomic, strong) NSString * price;
@property (nonatomic, strong) NSString * reputation;
@property (nonatomic, strong) NSString * score;
@property (nonatomic, strong) NSString * shareContent;
@property (nonatomic, strong) NSString * shareImage;
@property (nonatomic, strong) NSString * shareTitle;
@property (nonatomic, strong) NSString * shopId;
@property (nonatomic, strong) NSString * shopImage;
@property (nonatomic, strong) NSString * stock;
@property (nonatomic, strong) NSString * isCollected;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end