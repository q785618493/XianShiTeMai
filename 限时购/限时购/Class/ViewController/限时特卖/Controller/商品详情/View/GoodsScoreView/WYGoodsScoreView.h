//
//  WYGoodsScoreView.h
//  限时购
//
//  Created by ma c on 16/5/31.
//  Copyright © 2016年 WY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WYGoodsScoreView : UIView

- (instancetype)initWithFrame:(CGRect)frame dataArray:(NSArray *)dataArray;

@property (strong, nonatomic) NSArray *dataArray;


@end
