//
//  WYSortCell.m
//  限时购
//
//  Created by ma c on 16/5/27.
//  Copyright © 2016年 WY. All rights reserved.
//

#import "WYSortCell.h"
#import "WYSortModel.h"

@interface WYSortCell ()


/**
 功能分类的展示图
 */
@property (strong, nonatomic) UIImageView *showImage;

/**
 功能分类名称
 */
@property (strong, nonatomic) UILabel *titleLabel;

@end

@implementation WYSortCell

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        [self.contentView setBackgroundColor:[UIColor whiteColor]];
        
        [self.contentView addSubview:self.showImage];
        [self.contentView addSubview:self.titleLabel];
        
//        [self sortCellAddMasonry];
    }
    return self;
}

/**
 重写 model 的 set 方法给控件赋值
 */
- (void)setModel:(WYSortModel *)model {
    _model = model;
    
    [_showImage downloadImage:model.imgView];
    [_titleLabel setText:model.goodsTypeName];
}

/**
 添加控件的控件的约束
 */
- (void)sortCellAddMasonry {
    
    WS(weakSelf);
    [_showImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.contentView.mas_top);
        make.left.mas_equalTo(weakSelf.contentView.mas_left).offset(7);
        make.left.mas_equalTo(weakSelf.contentView.mas_right).offset(7);
        make.bottom.mas_equalTo(weakSelf.contentView.mas_bottom).offset(-14);
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.showImage.mas_bottom);
        make.left.mas_equalTo(weakSelf.contentView.mas_left);
        make.left.mas_equalTo(weakSelf.contentView.mas_right);
        make.bottom.mas_equalTo(weakSelf.contentView.mas_bottom);
    }];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat width = self.frame.size.width;
    [_showImage setFrame:(CGRectMake(20, 10, width - 20 * 2, width - 20 * 2))];
    [_titleLabel setFrame:(CGRectMake(0, width - 20, width, 20))];
}

- (UIImageView *)showImage {
    if (!_showImage) {
        _showImage = [[UIImageView alloc] init];
//        [_showImage setContentMode:(UIViewContentModeCenter)];
    }
    return _showImage;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        [_titleLabel setTextAlignment:(NSTextAlignmentCenter)];
        [_titleLabel setFont:[UIFont systemFontOfSize:13]];
    }
    return _titleLabel;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
