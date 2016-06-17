//
//	WYSaleModel.m
//
//	Create by c ma on 27/5/2016
//	Copyright © 2016. All rights reserved.
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "WYSaleModel.h"

@interface WYSaleModel ()
@end
@implementation WYSaleModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"ActivityDate"] isKindOfClass:[NSNull class]]){
		self.activityDate = dictionary[@"ActivityDate"];
	}	
	if(![dictionary[@"ActivityId"] isKindOfClass:[NSNull class]]){
		self.activityId = dictionary[@"ActivityId"];
	}	
	if(![dictionary[@"CommodityText"] isKindOfClass:[NSNull class]]){
		self.commodityText = dictionary[@"CommodityText"];
	}	
	if(![dictionary[@"Content"] isKindOfClass:[NSNull class]]){
		self.content = dictionary[@"Content"];
	}	
	if(![dictionary[@"FormetDate"] isKindOfClass:[NSNull class]]){
		self.formetDate = dictionary[@"FormetDate"];
	}	
	if(![dictionary[@"IfMiddlePage"] isKindOfClass:[NSNull class]]){
		self.ifMiddlePage = dictionary[@"IfMiddlePage"];
	}	
	if(![dictionary[@"ImgView"] isKindOfClass:[NSNull class]]){
		self.imgView = dictionary[@"ImgView"];
	}	
	if(![dictionary[@"LogoImg"] isKindOfClass:[NSNull class]]){
		self.logoImg = dictionary[@"LogoImg"];
	}	
	if(![dictionary[@"ShopTitle"] isKindOfClass:[NSNull class]]){
		self.shopTitle = dictionary[@"ShopTitle"];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.activityDate != nil){
		dictionary[@"ActivityDate"] = self.activityDate;
	}
	if(self.activityId != nil){
		dictionary[@"ActivityId"] = self.activityId;
	}
	if(self.commodityText != nil){
		dictionary[@"CommodityText"] = self.commodityText;
	}
	if(self.content != nil){
		dictionary[@"Content"] = self.content;
	}
	if(self.formetDate != nil){
		dictionary[@"FormetDate"] = self.formetDate;
	}
	if(self.ifMiddlePage != nil){
		dictionary[@"IfMiddlePage"] = self.ifMiddlePage;
	}
	if(self.imgView != nil){
		dictionary[@"ImgView"] = self.imgView;
	}
	if(self.logoImg != nil){
		dictionary[@"LogoImg"] = self.logoImg;
	}
	if(self.shopTitle != nil){
		dictionary[@"ShopTitle"] = self.shopTitle;
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
	if(self.activityDate != nil){
		[aCoder encodeObject:self.activityDate forKey:@"ActivityDate"];
	}
	if(self.activityId != nil){
		[aCoder encodeObject:self.activityId forKey:@"ActivityId"];
	}
	if(self.commodityText != nil){
		[aCoder encodeObject:self.commodityText forKey:@"CommodityText"];
	}
	if(self.content != nil){
		[aCoder encodeObject:self.content forKey:@"Content"];
	}
	if(self.formetDate != nil){
		[aCoder encodeObject:self.formetDate forKey:@"FormetDate"];
	}
	if(self.ifMiddlePage != nil){
		[aCoder encodeObject:self.ifMiddlePage forKey:@"IfMiddlePage"];
	}
	if(self.imgView != nil){
		[aCoder encodeObject:self.imgView forKey:@"ImgView"];
	}
	if(self.logoImg != nil){
		[aCoder encodeObject:self.logoImg forKey:@"LogoImg"];
	}
	if(self.shopTitle != nil){
		[aCoder encodeObject:self.shopTitle forKey:@"ShopTitle"];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.activityDate = [aDecoder decodeObjectForKey:@"ActivityDate"];
	self.activityId = [aDecoder decodeObjectForKey:@"ActivityId"];
	self.commodityText = [aDecoder decodeObjectForKey:@"CommodityText"];
	self.content = [aDecoder decodeObjectForKey:@"Content"];
	self.formetDate = [aDecoder decodeObjectForKey:@"FormetDate"];
	self.ifMiddlePage = [aDecoder decodeObjectForKey:@"IfMiddlePage"];
	self.imgView = [aDecoder decodeObjectForKey:@"ImgView"];
	self.logoImg = [aDecoder decodeObjectForKey:@"LogoImg"];
	self.shopTitle = [aDecoder decodeObjectForKey:@"ShopTitle"];
	return self;

}
@end