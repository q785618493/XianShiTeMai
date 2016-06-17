//
//	WYAllDetailsModel.m
//
//	Create by c ma on 30/5/2016
//	Copyright © 2016. All rights reserved.
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "WYAllDetailsModel.h"

@interface WYAllDetailsModel ()
@end
@implementation WYAllDetailsModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"Abbreviation"] isKindOfClass:[NSNull class]]){
		self.abbreviation = dictionary[@"Abbreviation"];
	}	
	if(![dictionary[@"ActivityName"] isKindOfClass:[NSNull class]]){
		self.activityName = dictionary[@"ActivityName"];
	}	
	if(![dictionary[@"ActivityTime"] isKindOfClass:[NSNull class]]){
		self.activityTime = dictionary[@"ActivityTime"];
	}	
	if(![dictionary[@"BrandCNName"] isKindOfClass:[NSNull class]]){
		self.brandCNName = dictionary[@"BrandCNName"];
	}	
	if(![dictionary[@"BuyCount"] isKindOfClass:[NSNull class]]){
		self.buyCount = dictionary[@"BuyCount"];
	}	
	if(![dictionary[@"CountryName"] isKindOfClass:[NSNull class]]){
		self.countryName = dictionary[@"CountryName"];
	}	
	if(![dictionary[@"Discount"] isKindOfClass:[NSNull class]]){
		self.discount = dictionary[@"Discount"];
	}	
	if(![dictionary[@"DomesticPrice"] isKindOfClass:[NSNull class]]){
		self.domesticPrice = dictionary[@"DomesticPrice"];
	}	
	if(![dictionary[@"FavorableRate"] isKindOfClass:[NSNull class]]){
		self.favorableRate = dictionary[@"FavorableRate"];
	}	
	if(![dictionary[@"GoodsId"] isKindOfClass:[NSNull class]]){
		self.goodsId = dictionary[@"GoodsId"];
	}	
	if(![dictionary[@"GoodsIntro"] isKindOfClass:[NSNull class]]){
		self.goodsIntro = dictionary[@"GoodsIntro"];
	}	
	if(![dictionary[@"GoodsTitle"] isKindOfClass:[NSNull class]]){
		self.goodsTitle = dictionary[@"GoodsTitle"];
	}	
	if(![dictionary[@"HtmUrl"] isKindOfClass:[NSNull class]]){
		self.htmUrl = dictionary[@"HtmUrl"];
	}	
	if(![dictionary[@"Notice"] isKindOfClass:[NSNull class]]){
		self.notice = dictionary[@"Notice"];
	}	
	if(![dictionary[@"OriginalPrice"] isKindOfClass:[NSNull class]]){
		self.originalPrice = dictionary[@"OriginalPrice"];
	}	
	if(![dictionary[@"OverseasPrice"] isKindOfClass:[NSNull class]]){
		self.overseasPrice = dictionary[@"OverseasPrice"];
	}	
	if(![dictionary[@"Price"] isKindOfClass:[NSNull class]]){
		self.price = dictionary[@"Price"];
	}	
	if(![dictionary[@"Reputation"] isKindOfClass:[NSNull class]]){
		self.reputation = dictionary[@"Reputation"];
	}	
	if(![dictionary[@"Score"] isKindOfClass:[NSNull class]]){
		self.score = dictionary[@"Score"];
	}	
	if(![dictionary[@"ShareContent"] isKindOfClass:[NSNull class]]){
		self.shareContent = dictionary[@"ShareContent"];
	}	
	if(![dictionary[@"ShareImage"] isKindOfClass:[NSNull class]]){
		self.shareImage = dictionary[@"ShareImage"];
	}	
	if(![dictionary[@"ShareTitle"] isKindOfClass:[NSNull class]]){
		self.shareTitle = dictionary[@"ShareTitle"];
	}	
	if(![dictionary[@"ShopId"] isKindOfClass:[NSNull class]]){
		self.shopId = dictionary[@"ShopId"];
	}	
	if(![dictionary[@"ShopImage"] isKindOfClass:[NSNull class]]){
		self.shopImage = dictionary[@"ShopImage"];
	}	
	if(![dictionary[@"Stock"] isKindOfClass:[NSNull class]]){
		self.stock = dictionary[@"Stock"];
	}	
	if(![dictionary[@"isCollected"] isKindOfClass:[NSNull class]]){
		self.isCollected = dictionary[@"isCollected"];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.abbreviation != nil){
		dictionary[@"Abbreviation"] = self.abbreviation;
	}
	if(self.activityName != nil){
		dictionary[@"ActivityName"] = self.activityName;
	}
	if(self.activityTime != nil){
		dictionary[@"ActivityTime"] = self.activityTime;
	}
	if(self.brandCNName != nil){
		dictionary[@"BrandCNName"] = self.brandCNName;
	}
	if(self.buyCount != nil){
		dictionary[@"BuyCount"] = self.buyCount;
	}
	if(self.countryName != nil){
		dictionary[@"CountryName"] = self.countryName;
	}
	if(self.discount != nil){
		dictionary[@"Discount"] = self.discount;
	}
	if(self.domesticPrice != nil){
		dictionary[@"DomesticPrice"] = self.domesticPrice;
	}
	if(self.favorableRate != nil){
		dictionary[@"FavorableRate"] = self.favorableRate;
	}
	if(self.goodsId != nil){
		dictionary[@"GoodsId"] = self.goodsId;
	}
	if(self.goodsIntro != nil){
		dictionary[@"GoodsIntro"] = self.goodsIntro;
	}
	if(self.goodsTitle != nil){
		dictionary[@"GoodsTitle"] = self.goodsTitle;
	}
	if(self.htmUrl != nil){
		dictionary[@"HtmUrl"] = self.htmUrl;
	}
	if(self.notice != nil){
		dictionary[@"Notice"] = self.notice;
	}
	if(self.originalPrice != nil){
		dictionary[@"OriginalPrice"] = self.originalPrice;
	}
	if(self.overseasPrice != nil){
		dictionary[@"OverseasPrice"] = self.overseasPrice;
	}
	if(self.price != nil){
		dictionary[@"Price"] = self.price;
	}
	if(self.reputation != nil){
		dictionary[@"Reputation"] = self.reputation;
	}
	if(self.score != nil){
		dictionary[@"Score"] = self.score;
	}
	if(self.shareContent != nil){
		dictionary[@"ShareContent"] = self.shareContent;
	}
	if(self.shareImage != nil){
		dictionary[@"ShareImage"] = self.shareImage;
	}
	if(self.shareTitle != nil){
		dictionary[@"ShareTitle"] = self.shareTitle;
	}
	if(self.shopId != nil){
		dictionary[@"ShopId"] = self.shopId;
	}
	if(self.shopImage != nil){
		dictionary[@"ShopImage"] = self.shopImage;
	}
	if(self.stock != nil){
		dictionary[@"Stock"] = self.stock;
	}
	if(self.isCollected != nil){
		dictionary[@"isCollected"] = self.isCollected;
	}
	return dictionary;

}

/**
 * Implementation of NSCoding encoding method
 */
/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
- (void)encodeWithCoder:(NSCoder *)aCoder
{
	if(self.abbreviation != nil){
		[aCoder encodeObject:self.abbreviation forKey:@"Abbreviation"];
	}
	if(self.activityName != nil){
		[aCoder encodeObject:self.activityName forKey:@"ActivityName"];
	}
	if(self.activityTime != nil){
		[aCoder encodeObject:self.activityTime forKey:@"ActivityTime"];
	}
	if(self.brandCNName != nil){
		[aCoder encodeObject:self.brandCNName forKey:@"BrandCNName"];
	}
	if(self.buyCount != nil){
		[aCoder encodeObject:self.buyCount forKey:@"BuyCount"];
	}
	if(self.countryName != nil){
		[aCoder encodeObject:self.countryName forKey:@"CountryName"];
	}
	if(self.discount != nil){
		[aCoder encodeObject:self.discount forKey:@"Discount"];
	}
	if(self.domesticPrice != nil){
		[aCoder encodeObject:self.domesticPrice forKey:@"DomesticPrice"];
	}
	if(self.favorableRate != nil){
		[aCoder encodeObject:self.favorableRate forKey:@"FavorableRate"];
	}
	if(self.goodsId != nil){
		[aCoder encodeObject:self.goodsId forKey:@"GoodsId"];
	}
	if(self.goodsIntro != nil){
		[aCoder encodeObject:self.goodsIntro forKey:@"GoodsIntro"];
	}
	if(self.goodsTitle != nil){
		[aCoder encodeObject:self.goodsTitle forKey:@"GoodsTitle"];
	}
	if(self.htmUrl != nil){
		[aCoder encodeObject:self.htmUrl forKey:@"HtmUrl"];
	}
	if(self.notice != nil){
		[aCoder encodeObject:self.notice forKey:@"Notice"];
	}
	if(self.originalPrice != nil){
		[aCoder encodeObject:self.originalPrice forKey:@"OriginalPrice"];
	}
	if(self.overseasPrice != nil){
		[aCoder encodeObject:self.overseasPrice forKey:@"OverseasPrice"];
	}
	if(self.price != nil){
		[aCoder encodeObject:self.price forKey:@"Price"];
	}
	if(self.reputation != nil){
		[aCoder encodeObject:self.reputation forKey:@"Reputation"];
	}
	if(self.score != nil){
		[aCoder encodeObject:self.score forKey:@"Score"];
	}
	if(self.shareContent != nil){
		[aCoder encodeObject:self.shareContent forKey:@"ShareContent"];
	}
	if(self.shareImage != nil){
		[aCoder encodeObject:self.shareImage forKey:@"ShareImage"];
	}
	if(self.shareTitle != nil){
		[aCoder encodeObject:self.shareTitle forKey:@"ShareTitle"];
	}
	if(self.shopId != nil){
		[aCoder encodeObject:self.shopId forKey:@"ShopId"];
	}
	if(self.shopImage != nil){
		[aCoder encodeObject:self.shopImage forKey:@"ShopImage"];
	}
	if(self.stock != nil){
		[aCoder encodeObject:self.stock forKey:@"Stock"];
	}
	if(self.isCollected != nil){
		[aCoder encodeObject:self.isCollected forKey:@"isCollected"];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.abbreviation = [aDecoder decodeObjectForKey:@"Abbreviation"];
	self.activityName = [aDecoder decodeObjectForKey:@"ActivityName"];
	self.activityTime = [aDecoder decodeObjectForKey:@"ActivityTime"];
	self.brandCNName = [aDecoder decodeObjectForKey:@"BrandCNName"];
	self.buyCount = [aDecoder decodeObjectForKey:@"BuyCount"];
	self.countryName = [aDecoder decodeObjectForKey:@"CountryName"];
	self.discount = [aDecoder decodeObjectForKey:@"Discount"];
	self.domesticPrice = [aDecoder decodeObjectForKey:@"DomesticPrice"];
	self.favorableRate = [aDecoder decodeObjectForKey:@"FavorableRate"];
	self.goodsId = [aDecoder decodeObjectForKey:@"GoodsId"];
	self.goodsIntro = [aDecoder decodeObjectForKey:@"GoodsIntro"];
	self.goodsTitle = [aDecoder decodeObjectForKey:@"GoodsTitle"];
	self.htmUrl = [aDecoder decodeObjectForKey:@"HtmUrl"];
	self.notice = [aDecoder decodeObjectForKey:@"Notice"];
	self.originalPrice = [aDecoder decodeObjectForKey:@"OriginalPrice"];
	self.overseasPrice = [aDecoder decodeObjectForKey:@"OverseasPrice"];
	self.price = [aDecoder decodeObjectForKey:@"Price"];
	self.reputation = [aDecoder decodeObjectForKey:@"Reputation"];
	self.score = [aDecoder decodeObjectForKey:@"Score"];
	self.shareContent = [aDecoder decodeObjectForKey:@"ShareContent"];
	self.shareImage = [aDecoder decodeObjectForKey:@"ShareImage"];
	self.shareTitle = [aDecoder decodeObjectForKey:@"ShareTitle"];
	self.shopId = [aDecoder decodeObjectForKey:@"ShopId"];
	self.shopImage = [aDecoder decodeObjectForKey:@"ShopImage"];
	self.stock = [aDecoder decodeObjectForKey:@"Stock"];
	self.isCollected = [aDecoder decodeObjectForKey:@"isCollected"];
	return self;

}
@end