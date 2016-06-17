//
//	WYAllGoodsModel.h
//
//	Create by c ma on 30/5/2016
//	Copyright © 2016. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface WYAllGoodsModel : NSObject

@property (nonatomic, strong) NSString * imgType;
@property (nonatomic, strong) NSString * imgView;
@property (nonatomic, assign) NSInteger resolution;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end