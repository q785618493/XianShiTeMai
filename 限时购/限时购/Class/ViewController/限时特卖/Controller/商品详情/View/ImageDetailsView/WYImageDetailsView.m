//
//  WYImageDetailsView.m
//  限时购
//
//  Created by ma c on 16/5/30.
//  Copyright © 2016年 WY. All rights reserved.
//

#import "WYImageDetailsView.h"
#import "UIImageView+SDWedImage.h"

@implementation WYImageDetailsView

- (instancetype)initWithFrame:(CGRect)frame photoArray:(NSArray *)photoArray {
    
    if (self = [super initWithFrame:frame]) {
        
        CGFloat countArr = photoArray.count;
        
        CGFloat width = frame.size.width;
        
        CGFloat height = frame.size.height / countArr;
        
        for (NSInteger i = 0; i < countArr; i ++) {
            
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:(CGRectMake(0, i * height, width, height))];
            [imageView downloadImage:photoArray[i]];
            [self addSubview:imageView];
        }
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
