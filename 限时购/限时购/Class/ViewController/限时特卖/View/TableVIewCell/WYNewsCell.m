//
//  WYNewsCell.m
//  限时购
//
//  Created by ma c on 16/5/27.
//  Copyright © 2016年 WY. All rights reserved.
//

#import "WYNewsCell.h"
#import "WYNewsModel.h"

@interface WYNewsCell ()

/** 商品图片 */
@property (strong, nonatomic) UIImageView *commodityImage;

/** cell 底部分割线 */
@property (strong, nonatomic) UILabel *wireLabel;

/** 商品标题 */
@property (strong, nonatomic) UILabel *titleLabel;

/** 商品简介 */
@property (strong, nonatomic) UILabel *infoLabel;

/** 商品打折价格 */
@property (strong, nonatomic) UILabel *ciscountLabel;

/** 商品原价格 */
@property (strong, nonatomic) UILabel *priceLabel;

/** 商品原价格的划线 */
@property (strong, nonatomic) UILabel *lineLabel;

/** 添加到购物车按钮 */
@property (strong, nonatomic) UIButton *shoppingBtn;

@end

@implementation WYNewsCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setBackgroundColor:RGB(245, 245, 245)];
        [self setSelectionStyle:(UITableViewCellSelectionStyleNone)];
        [self addSubview:self.wireLabel];
        [self addSubview:self.commodityImage];
        [self addSubview:self.titleLabel];
        [self addSubview:self.infoLabel];
        [self addSubview:self.ciscountLabel];
        [self addSubview:self.priceLabel];
        [self addSubview:self.lineLabel];
        [self addSubview:self.shoppingBtn];
        
        
        [self newsCellMasonry];
    }
    return self;
}

/** 重写 dataModel的 set 方法 */
- (void)setDataModel:(WYNewsModel *)dataModel {
    _dataModel = dataModel;
    
    [_commodityImage downloadImage:dataModel.imgView];
    [_titleLabel setText:dataModel.abbreviation];
    [_infoLabel setText:dataModel.goodsIntro];
    [_ciscountLabel setText:dataModel.price];
    [_priceLabel setText:[NSString stringWithFormat:@"￥%@",dataModel.domesticPrice]];
}

- (void)setCellTag:(NSInteger)cellTag {
    _cellTag = cellTag;
    [_shoppingBtn setTag:cellTag + 1];
}

/** 控件的约束方法 */
- (void)newsCellMasonry {
    WS(weakSelf);
    [_wireLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(weakSelf.mas_bottom);
        make.left.mas_equalTo(weakSelf.mas_left);
        make.right.mas_equalTo(weakSelf.mas_right);
        make.height.mas_equalTo(1);
    }];
    
    [_commodityImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.mas_top).offset(15);
        make.left.mas_equalTo(weakSelf.mas_left).offset(5);
        make.size.mas_equalTo(CGSizeMake(145, 145));
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.mas_top).offset(25);
        make.left.mas_equalTo(weakSelf.commodityImage.mas_right).offset(5);
        make.right.mas_equalTo(weakSelf.mas_right).offset(-5);
        make.height.mas_equalTo(20);
    }];
    
    [_infoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.titleLabel.mas_bottom);
        make.left.mas_equalTo(weakSelf.commodityImage.mas_right).offset(5);
        make.right.mas_equalTo(weakSelf.mas_right).offset(-5);
        make.height.mas_equalTo(60);
    }];
    
    [_ciscountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.infoLabel.mas_bottom).offset(18);
        make.left.mas_equalTo(weakSelf.commodityImage.mas_right).offset(5);
        make.size.mas_equalTo(CGSizeMake(68, 19));
    }];
    
    [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.infoLabel.mas_bottom).offset(21);
        make.left.mas_equalTo(weakSelf.ciscountLabel.mas_right);
        make.size.mas_equalTo(CGSizeMake(52, 13));
    }];
    
    [_lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(weakSelf.priceLabel.mas_centerY);
        make.left.mas_equalTo(weakSelf.ciscountLabel.mas_right);
        make.size.mas_equalTo(CGSizeMake(52, 1));
    }];
    
    [_shoppingBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.infoLabel.mas_bottom).offset(17);
        make.left.mas_equalTo(weakSelf.priceLabel.mas_right).offset(5);
        make.size.mas_equalTo(CGSizeMake(36, 36));
    }];
}

- (UIButton *)shoppingBtn {
    if (!_shoppingBtn) {
        _shoppingBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_shoppingBtn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"限时特卖界面购物车图标"]] forState:(UIControlStateNormal)];
        [_shoppingBtn addTarget:self action:@selector(btnTouchActionShopping:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _shoppingBtn;
}

/** 购物车按钮 shoppingBtn点击事件 */
- (void)btnTouchActionShopping:(UIButton *)shopping {
    
    if (_cellBtnTag) {
        _cellBtnTag(self.cellTag);
    }
}

- (UILabel *)lineLabel {
    if (!_lineLabel) {
        _lineLabel = [[UILabel alloc] init];
        [_lineLabel setBackgroundColor:RGB(163, 163, 163)];
    }
    return _lineLabel;
}

- (UILabel *)priceLabel {
    if (!_priceLabel) {
        _priceLabel = [[UILabel alloc] init];
        [_priceLabel setFont:[UIFont systemFontOfSize:12]];
        [_priceLabel setTextColor:RGB(163, 163, 163)];
        [_priceLabel setTextAlignment:(NSTextAlignmentCenter)];
    }
    return _priceLabel;
}

- (UILabel *)ciscountLabel {
    if (!_ciscountLabel) {
        _ciscountLabel = [[UILabel alloc] init];
        [_ciscountLabel setTextColor:RGB(255, 76, 0)];
        [_ciscountLabel setTextAlignment:(NSTextAlignmentCenter)];
        [_ciscountLabel setFont:[UIFont systemFontOfSize:16]];
    }
    return _ciscountLabel;
}

- (UILabel *)infoLabel {
    if (!_infoLabel) {
        _infoLabel = [[UILabel alloc] init];
        [_infoLabel setFont:[UIFont systemFontOfSize:14]];
        [_infoLabel setNumberOfLines:0];
        [_infoLabel setLineBreakMode:(NSLineBreakByWordWrapping)];
    }
    return _infoLabel;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        [_titleLabel setFont:[UIFont systemFontOfSize:14]];
        [_titleLabel setTextColor:RGB(119, 119, 119)];
//        [_titleLabel setNumberOfLines:0];
//        [_titleLabel setLineBreakMode:(NSLineBreakByWordWrapping)];
    }
    return _titleLabel;
}

- (UIImageView *)commodityImage {
    if (!_commodityImage) {
        _commodityImage = [[UIImageView alloc] init];
    }
    return _commodityImage;
}

- (UILabel *)wireLabel {
    if (!_wireLabel) {
        _wireLabel = [[UILabel alloc] init];
        [_wireLabel setBackgroundColor:[UIColor grayColor]];
    }
    return _wireLabel;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
