//
//  WYSaleCell.m
//  限时购
//
//  Created by ma c on 16/5/27.
//  Copyright © 2016年 WY. All rights reserved.
//

#import "WYSaleCell.h"
#import "WYSaleModel.h"

@interface WYSaleCell ()

/** 商品图片 */
@property (strong, nonatomic) UIImageView *commodityImage;

/** 中心位置图片 */
@property (strong, nonatomic) UIImageView *centerImage;


@end

@implementation WYSaleCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setSelectionStyle:(UITableViewCellSelectionStyleNone)];
        
        [self addSubview:self.commodityImage];
        [_commodityImage addSubview:self.centerImage];
        
        [self saleCellAddMasonry];
    }
    return self;
}


/**
 重写数据模型的 set 方法
 */
- (void)setDataModel:(WYSaleModel *)dataModel {
    _dataModel = dataModel;
    
    [_commodityImage downloadImage:dataModel.imgView];
    [_centerImage downloadImage:dataModel.logoImg];
}

/**
 加载控件的位置约束
 */
- (void)saleCellAddMasonry {
    
    WS(weakSelf);
    
    [_commodityImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    [_centerImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(weakSelf.commodityImage).insets(UIEdgeInsetsMake(30, 60, 30, 60));
    }];
}

- (UIImageView *)commodityImage {
    if (!_commodityImage) {
        _commodityImage = [[UIImageView alloc] init];
    }
    return _commodityImage;
}

- (UIImageView *)centerImage {
    if (!_centerImage) {
        _centerImage = [[UIImageView alloc] init];
        [_centerImage setAlpha:0.8];
    }
    return _centerImage;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
