//
//	WYAllGoodsModel.m
//
//	Create by c ma on 30/5/2016
//	Copyright © 2016. All rights reserved.
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "WYAllGoodsModel.h"

@interface WYAllGoodsModel ()
@end
@implementation WYAllGoodsModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"ImgType"] isKindOfClass:[NSNull class]]){
		self.imgType = dictionary[@"ImgType"];
	}	
	if(![dictionary[@"ImgView"] isKindOfClass:[NSNull class]]){
		self.imgView = dictionary[@"ImgView"];
	}	
	if(![dictionary[@"Resolution"] isKindOfClass:[NSNull class]]){
		self.resolution = [dictionary[@"Resolution"] integerValue];
	}

	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.imgType != nil){
		dictionary[@"ImgType"] = self.imgType;
	}
	if(self.imgView != nil){
		dictionary[@"ImgView"] = self.imgView;
	}
	dictionary[@"Resolution"] = @(self.resolution);
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
	if(self.imgType != nil){
		[aCoder encodeObject:self.imgType forKey:@"ImgType"];
	}
	if(self.imgView != nil){
		[aCoder encodeObject:self.imgView forKey:@"ImgView"];
	}
	[aCoder encodeObject:@(self.resolution) forKey:@"Resolution"];
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.imgType = [aDecoder decodeObjectForKey:@"ImgType"];
	self.imgView = [aDecoder decodeObjectForKey:@"ImgView"];
	self.resolution = [[aDecoder decodeObjectForKey:@"Resolution"] integerValue];
	return self;

}
@end