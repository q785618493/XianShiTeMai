//
//  WYGoodsScoreView.m
//  限时购
//
//  Created by ma c on 16/5/31.
//  Copyright © 2016年 WY. All rights reserved.
//

#import "WYGoodsScoreView.h"
#import "WYScoreModel.h"

@implementation WYGoodsScoreView

- (instancetype)initWithFrame:(CGRect)frame dataArray:(NSArray *)dataArray {
    
    if (self = [super initWithFrame:frame]) {
        
        [self setBackgroundColor:[UIColor whiteColor]];
        
        for (NSInteger i = 0; i < dataArray.count; i ++) {
            
            WYScoreModel *model = dataArray[i];
            
            NSMutableString *muString = [NSMutableString stringWithCapacity:[model.score integerValue]];
            
            for (NSInteger j = 0; j < [model.score integerValue]; j ++) {
                [muString appendFormat:@"⭐️"];
            }
            
            UILabel *titleLabel = [[UILabel alloc] initWithFrame:(CGRectMake(10, i * 30 + 10, frame.size.width - 20, 20))];
            [titleLabel setFont:[UIFont systemFontOfSize:15]];
            [titleLabel setText:[NSString stringWithFormat:@"%@ : %@    %@",model.title,model.score,muString]];
            [self addSubview:titleLabel];
        }
        
    }
    return self;
}

/** 重写数组的 set方法*/
- (void)setDataArray:(NSArray *)dataArray {
    _dataArray = dataArray;
    
    for (NSInteger i = 0; i < dataArray.count; i ++) {
        
        WYScoreModel *model = dataArray[i];
        
        NSMutableString *muString = [NSMutableString stringWithCapacity:[model.score integerValue]];
        
        for (NSInteger j = 0; j < [model.score integerValue]; j ++) {
            [muString appendFormat:@"⭐️"];
        }
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:(CGRectMake(10, i * 30 + 10, self.frame.size.width - 20, 20))];
        [titleLabel setFont:[UIFont systemFontOfSize:15]];
        [titleLabel setText:[NSString stringWithFormat:@"%@ : %@    %@",model.title,model.score,muString]];
        [self addSubview:titleLabel];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
