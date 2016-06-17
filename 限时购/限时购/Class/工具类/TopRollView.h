//
//  TopRollView.h
//  自动轮播视图
//
//  Created by ma c on 16/3/29.
//  Copyright © 2016年 WY. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^BtnActionBlock)(NSInteger);

@interface TopRollView : UIView

@property (copy, nonatomic) BtnActionBlock btnTag;


/** 保存图片的数组*/
@property (strong, nonatomic) NSArray *arrayImages;

@end
