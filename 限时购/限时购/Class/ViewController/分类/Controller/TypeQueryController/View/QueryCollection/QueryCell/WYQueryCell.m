//
//  WYQueryCell.m
//  限时购
//
//  Created by ma c on 16/6/1.
//  Copyright © 2016年 WY. All rights reserved.
//

#import "WYQueryCell.h"
#import "WYQueryModel.h"

@interface WYQueryCell ()

@property (strong, nonatomic) UIImageView *countryImage;

@property (strong, nonatomic) UIImageView *goodsImage;

@property (strong, nonatomic) UILabel *titleLabel;

@property (strong, nonatomic) UILabel *priceLabel;

@end

@implementation WYQueryCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        [self.contentView setBackgroundColor:RGB(250, 250, 250)];
        
        [self.contentView addSubview:self.goodsImage];
        [self.goodsImage addSubview:self.countryImage];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.priceLabel];
        
    }
    return self;
}

- (void)setModel:(WYQueryModel *)model {
    _model = model;
    
    [self.countryImage downloadImage:model.CountryImg];
    [self.goodsImage downloadImage:model.ImgView];
    [self.titleLabel setText:model.Title];
    
    NSAttributedString *priceAttribute = [[NSAttributedString alloc] initWithString:model.Price attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:17],NSForegroundColorAttributeName : RGB(255, 67, 0)}];
    
    NSAttributedString *domesticAttribute = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@" ￥%@",model.DomesticPrice] attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:13],NSForegroundColorAttributeName : RGB(169, 169, 169)}];
    
    NSMutableAttributedString *muAttString = [[NSMutableAttributedString alloc] init];
    [muAttString insertAttributedString:priceAttribute atIndex:0];
    [muAttString insertAttributedString:domesticAttribute atIndex:priceAttribute.length];
    
    [self.priceLabel setAttributedText:muAttString];

}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat width = self.frame.size.width;
    
    [self.goodsImage setFrame:(CGRectMake(0, 0, width, width))];
    [self.countryImage setFrame:(CGRectMake(10, 11, 23, 17))];
    [self.titleLabel setFrame:(CGRectMake(10, width + 10, width - 20, 36))];
    [self.priceLabel setFrame:(CGRectMake(0, CGRectGetMaxY(_titleLabel.frame) + 10, width, 13))];
    
}

- (UILabel *)priceLabel {
    if (!_priceLabel) {
        _priceLabel = [[UILabel alloc] init];
        [_priceLabel setTextAlignment:(NSTextAlignmentCenter)];
    }
    return _priceLabel;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        [_titleLabel setFont:[UIFont systemFontOfSize:15]];
        [_titleLabel setLineBreakMode:(NSLineBreakByWordWrapping)];
        [_titleLabel setNumberOfLines:0];
    }
    return _titleLabel;
}

- (UIImageView *)goodsImage {
    if (!_goodsImage) {
        _goodsImage= [[UIImageView alloc] init];
    }
    return _goodsImage;
}

- (UIImageView *)countryImage {
    if (!_countryImage) {
        _countryImage = [[UIImageView alloc] init];
    }
    return _countryImage;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
