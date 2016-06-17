//
//	WYGoodsDetailsModel.m
//
//	Create by c ma on 30/5/2016
//	Copyright © 2016. All rights reserved.
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "WYGoodsDetailsModel.h"

@interface WYGoodsDetailsModel ()
@end
@implementation WYGoodsDetailsModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"Title"] isKindOfClass:[NSNull class]]){
		self.title = dictionary[@"Title"];
	}	
	if(![dictionary[@"Value"] isKindOfClass:[NSNull class]]){
		self.value = dictionary[@"Value"];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.title != nil){
		dictionary[@"Title"] = self.title;
	}
	if(self.value != nil){
		dictionary[@"Value"] = self.value;
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
	if(self.title != nil){
		[aCoder encodeObject:self.title forKey:@"Title"];
	}
	if(self.value != nil){
		[aCoder encodeObject:self.value forKey:@"Value"];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.title = [aDecoder decodeObjectForKey:@"Title"];
	self.value = [aDecoder decodeObjectForKey:@"Value"];
	return self;

}
@end