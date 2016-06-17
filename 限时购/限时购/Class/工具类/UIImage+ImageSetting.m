//
//  UIImage+ImageSetting.m
//  彩票
//
//  Created by ma c on 16/5/25.
//  Copyright © 2016年 WY. All rights reserved.
//

#import "UIImage+ImageSetting.h"

@implementation UIImage (ImageSetting)

+ (instancetype)imageWithModeImageName:(NSString *)imageName {
    
    UIImage *image = [UIImage imageNamed:imageName];
    
    return [image imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
}

@end
