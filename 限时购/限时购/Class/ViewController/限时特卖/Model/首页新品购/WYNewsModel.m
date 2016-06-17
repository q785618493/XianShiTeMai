//
//	WYNewsModel.m
//
//	Create by c ma on 27/5/2016
//	Copyright © 2016. All rights reserved.
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "WYNewsModel.h"

@interface WYNewsModel ()
@end
@implementation WYNewsModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"Abbreviation"] isKindOfClass:[NSNull class]]){
		self.abbreviation = dictionary[@"Abbreviation"];
	}	
	if(![dictionary[@"Alert"] isKindOfClass:[NSNull class]]){
		self.alert = dictionary[@"Alert"];
	}	
	if(![dictionary[@"BuyCount"] isKindOfClass:[NSNull class]]){
		self.buyCount = dictionary[@"BuyCount"];
	}	
	if(![dictionary[@"CountryImg"] isKindOfClass:[NSNull class]]){
		self.countryImg = dictionary[@"CountryImg"];
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
	if(![dictionary[@"ForeignPrice"] isKindOfClass:[NSNull class]]){
		self.foreignPrice = dictionary[@"ForeignPrice"];
	}	
	if(![dictionary[@"FormetDate"] isKindOfClass:[NSNull class]]){
		self.formetDate = dictionary[@"FormetDate"];
	}	
	if(![dictionary[@"GoodsId"] isKindOfClass:[NSNull class]]){
		self.goodsId = dictionary[@"GoodsId"];
	}	
	if(![dictionary[@"GoodsIntro"] isKindOfClass:[NSNull class]]){
		self.goodsIntro = dictionary[@"GoodsIntro"];
	}	
	if(![dictionary[@"ImgView"] isKindOfClass:[NSNull class]]){
		self.imgView = dictionary[@"ImgView"];
	}	
	if(![dictionary[@"OtherPrice"] isKindOfClass:[NSNull class]]){
		self.otherPrice = dictionary[@"OtherPrice"];
	}	
	if(![dictionary[@"Price"] isKindOfClass:[NSNull class]]){
		self.price = dictionary[@"Price"];
	}	
	if(![dictionary[@"RestTime"] isKindOfClass:[NSNull class]]){
		self.restTime = dictionary[@"RestTime"];
	}	
	if(![dictionary[@"Stock"] isKindOfClass:[NSNull class]]){
		self.stock = dictionary[@"Stock"];
	}	
	if(![dictionary[@"Title"] isKindOfClass:[NSNull class]]){
		self.title = dictionary[@"Title"];
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
	if(self.alert != nil){
		dictionary[@"Alert"] = self.alert;
	}
	if(self.buyCount != nil){
		dictionary[@"BuyCount"] = self.buyCount;
	}
	if(self.countryImg != nil){
		dictionary[@"CountryImg"] = self.countryImg;
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
	if(self.foreignPrice != nil){
		dictionary[@"ForeignPrice"] = self.foreignPrice;
	}
	if(self.formetDate != nil){
		dictionary[@"FormetDate"] = self.formetDate;
	}
	if(self.goodsId != nil){
		dictionary[@"GoodsId"] = self.goodsId;
	}
	if(self.goodsIntro != nil){
		dictionary[@"GoodsIntro"] = self.goodsIntro;
	}
	if(self.imgView != nil){
		dictionary[@"ImgView"] = self.imgView;
	}
	if(self.otherPrice != nil){
		dictionary[@"OtherPrice"] = self.otherPrice;
	}
	if(self.price != nil){
		dictionary[@"Price"] = self.price;
	}
	if(self.restTime != nil){
		dictionary[@"RestTime"] = self.restTime;
	}
	if(self.stock != nil){
		dictionary[@"Stock"] = self.stock;
	}
	if(self.title != nil){
		dictionary[@"Title"] = self.title;
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
	if(self.alert != nil){
		[aCoder encodeObject:self.alert forKey:@"Alert"];
	}
	if(self.buyCount != nil){
		[aCoder encodeObject:self.buyCount forKey:@"BuyCount"];
	}
	if(self.countryImg != nil){
		[aCoder encodeObject:self.countryImg forKey:@"CountryImg"];
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
	if(self.foreignPrice != nil){
		[aCoder encodeObject:self.foreignPrice forKey:@"ForeignPrice"];
	}
	if(self.formetDate != nil){
		[aCoder encodeObject:self.formetDate forKey:@"FormetDate"];
	}
	if(self.goodsId != nil){
		[aCoder encodeObject:self.goodsId forKey:@"GoodsId"];
	}
	if(self.goodsIntro != nil){
		[aCoder encodeObject:self.goodsIntro forKey:@"GoodsIntro"];
	}
	if(self.imgView != nil){
		[aCoder encodeObject:self.imgView forKey:@"ImgView"];
	}
	if(self.otherPrice != nil){
		[aCoder encodeObject:self.otherPrice forKey:@"OtherPrice"];
	}
	if(self.price != nil){
		[aCoder encodeObject:self.price forKey:@"Price"];
	}
	if(self.restTime != nil){
		[aCoder encodeObject:self.restTime forKey:@"RestTime"];
	}
	if(self.stock != nil){
		[aCoder encodeObject:self.stock forKey:@"Stock"];
	}
	if(self.title != nil){
		[aCoder encodeObject:self.title forKey:@"Title"];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.abbreviation = [aDecoder decodeObjectForKey:@"Abbreviation"];
	self.alert = [aDecoder decodeObjectForKey:@"Alert"];
	self.buyCount = [aDecoder decodeObjectForKey:@"BuyCount"];
	self.countryImg = [aDecoder decodeObjectForKey:@"CountryImg"];
	self.countryName = [aDecoder decodeObjectForKey:@"CountryName"];
	self.discount = [aDecoder decodeObjectForKey:@"Discount"];
	self.domesticPrice = [aDecoder decodeObjectForKey:@"DomesticPrice"];
	self.foreignPrice = [aDecoder decodeObjectForKey:@"ForeignPrice"];
	self.formetDate = [aDecoder decodeObjectForKey:@"FormetDate"];
	self.goodsId = [aDecoder decodeObjectForKey:@"GoodsId"];
	self.goodsIntro = [aDecoder decodeObjectForKey:@"GoodsIntro"];
	self.imgView = [aDecoder decodeObjectForKey:@"ImgView"];
	self.otherPrice = [aDecoder decodeObjectForKey:@"OtherPrice"];
	self.price = [aDecoder decodeObjectForKey:@"Price"];
	self.restTime = [aDecoder decodeObjectForKey:@"RestTime"];
	self.stock = [aDecoder decodeObjectForKey:@"Stock"];
	self.title = [aDecoder decodeObjectForKey:@"Title"];
	return self;

}
@end