//
//	WYSortModel.m
//
//	Create by c ma on 27/5/2016
//	Copyright © 2016. All rights reserved.
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "WYSortModel.h"

@interface WYSortModel ()
@end
@implementation WYSortModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"GoodsType"] isKindOfClass:[NSNull class]]){
		self.goodsType = dictionary[@"GoodsType"];
	}	
	if(![dictionary[@"GoodsTypeName"] isKindOfClass:[NSNull class]]){
		self.goodsTypeName = dictionary[@"GoodsTypeName"];
	}	
	if(![dictionary[@"ImgView"] isKindOfClass:[NSNull class]]){
		self.imgView = dictionary[@"ImgView"];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.goodsType != nil){
		dictionary[@"GoodsType"] = self.goodsType;
	}
	if(self.goodsTypeName != nil){
		dictionary[@"GoodsTypeName"] = self.goodsTypeName;
	}
	if(self.imgView != nil){
		dictionary[@"ImgView"] = self.imgView;
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
	if(self.goodsType != nil){
		[aCoder encodeObject:self.goodsType forKey:@"GoodsType"];
	}
	if(self.goodsTypeName != nil){
		[aCoder encodeObject:self.goodsTypeName forKey:@"GoodsTypeName"];
	}
	if(self.imgView != nil){
		[aCoder encodeObject:self.imgView forKey:@"ImgView"];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.goodsType = [aDecoder decodeObjectForKey:@"GoodsType"];
	self.goodsTypeName = [aDecoder decodeObjectForKey:@"GoodsTypeName"];
	self.imgView = [aDecoder decodeObjectForKey:@"ImgView"];
	return self;

}
@end