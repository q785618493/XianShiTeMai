//
//	WYGoodsDetailsModel.h
//
//	Create by c ma on 30/5/2016
//	Copyright © 2016. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface WYGoodsDetailsModel : NSObject

@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) NSString * value;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end