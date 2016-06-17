//
//	WYBodyModel.m
//
//	Create by c ma on 27/5/2016
//	Copyright © 2016. All rights reserved.
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "WYBodyModel.h"

@interface WYBodyModel ()
@end
@implementation WYBodyModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"CommodityText"] isKindOfClass:[NSNull class]]){
		self.commodityText = dictionary[@"CommodityText"];
	}	
	if(![dictionary[@"ImgView"] isKindOfClass:[NSNull class]]){
		self.imgView = dictionary[@"ImgView"];
	}	
	if(![dictionary[@"ShopId"] isKindOfClass:[NSNull class]]){
		self.shopId = dictionary[@"ShopId"];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.commodityText != nil){
		dictionary[@"CommodityText"] = self.commodityText;
	}
	if(self.imgView != nil){
		dictionary[@"ImgView"] = self.imgView;
	}
	if(self.shopId != nil){
		dictionary[@"ShopId"] = self.shopId;
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
	if(self.commodityText != nil){
		[aCoder encodeObject:self.commodityText forKey:@"CommodityText"];
	}
	if(self.imgView != nil){
		[aCoder encodeObject:self.imgView forKey:@"ImgView"];
	}
	if(self.shopId != nil){
		[aCoder encodeObject:self.shopId forKey:@"ShopId"];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.commodityText = [aDecoder decodeObjectForKey:@"CommodityText"];
	self.imgView = [aDecoder decodeObjectForKey:@"ImgView"];
	self.shopId = [aDecoder decodeObjectForKey:@"ShopId"];
	return self;

}
@end