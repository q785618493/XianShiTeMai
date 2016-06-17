//
//	WYScoreModel.m
//
//	Create by c ma on 30/5/2016
//	Copyright © 2016. All rights reserved.
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "WYScoreModel.h"

@interface WYScoreModel ()
@end
@implementation WYScoreModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"Score"] isKindOfClass:[NSNull class]]){
		self.score = dictionary[@"Score"];
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
	if(self.score != nil){
		dictionary[@"Score"] = self.score;
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
	if(self.score != nil){
		[aCoder encodeObject:self.score forKey:@"Score"];
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
	self.score = [aDecoder decodeObjectForKey:@"Score"];
	self.title = [aDecoder decodeObjectForKey:@"Title"];
	return self;

}
@end