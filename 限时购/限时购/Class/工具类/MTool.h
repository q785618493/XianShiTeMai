//
//  MTool.h
//  Marry
//
//  Created by Apple on 14-10-9.
//  Copyright (c) 2014年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"
#import "AppDelegate.h"



//// 宽比例
//extern CGFloat scaleX;
//// 高比例
//extern CGFloat scaleY;

@interface MTool : NSObject<UIGestureRecognizerDelegate>
/**
 *邮编格式
 */
+(BOOL)isPost:(NSString *)text;

//邮箱验证
+(BOOL)isValidateEmail:(NSString *)email;

// 获取系统时间
+(NSString *)getSystemtime;

//手机号码验证
+(BOOL) isValidateMobile:(NSString *)mobile;

//车牌号验证
+(BOOL) validateCarNo:(NSString *)carNo;

// 检测 输入中是否含有特殊字符
+ (BOOL)isIncludeSpecialCharact: (NSString *)str;

// 判断 输入长度
+ (BOOL) stringlength:(NSString *)inputStr typeStr:(NSString *)typeStr;

// 获取设备型号
+ (NSString*)deviceString;

+ (NSString*)iPhoneType;

// 获取屏幕分辨率
+ (NSString *)getScreenScrale;

// 动态改变图片大小
+(UIImage *) OriginImage:(UIImage *)image scaleToSize:(CGSize)size;
// 改变图片 只拉伸中间点
+(UIEdgeInsets)resizeDetail:(CGSize)size;

// 字符串转时间格式
+(NSString *)stringTransformToTime:(NSString *)timeStr;

// 时间转字符串
+(NSString *)timeTransformToString:(NSDate *)string;

// 图片旋转
+ (UIImageView *)rotate360DegreeWithImageView:(UIImageView *)imageView;
// 停止图片旋转
+ (void)stopRound:(UIView *)view;

// 把OC对象转化成JSON字符串
+ (NSString *)objectToJson:(id)data;

// 字符串转 字典
+(NSDictionary *)stringToDict:(NSString *)str;

// 获取沙盒目录
+ (NSString *)applicationDocumentsDirectory;

// 获得 文件的大小
+ (CGFloat) fileSizeAtPath:(NSString*) filePath;

// 取消 模糊背景
+(void)removeGause:(UIView *)supperView;

// 清楚缓存
+(void)clearCache;
// 缓存清除成功
+(void)clearCacheSuccess;

// 获取屏幕高比例
+(CGFloat)getScreenHightscale;

// 获取屏幕宽比例
+(CGFloat)getScreenWidthscale;

// 获得某个范围内的屏幕图像
+ (UIImage *)imageFromView:(UIView *)view frame:(CGRect)frame;
+(UIImage *)newImageFromView:(UIView*)view frame:(CGRect)frame;
// 高斯模糊
+ (UIImage *)gauseImgWithImage:(UIImage *)image;

+ (UIImage *)imageFromImage:(UIImage *)image inRect:(CGRect)rect scale:(CGFloat)scale;

/**
 *  颜色转化
 *
 *  @param stringToConvert 颜色
 *
 *  @return uicolor
 */
+ (UIColor *)colorWithHexString:(NSString *)stringToConvert;

/**
 *  字符串拆分
 *
 *  @param dict 字符串
 *
 *  @return 字典
 */
+ (NSDictionary *)getStringWithDict:(NSDictionary *)dict;
/**
 *  获取文字大小 高度
 *
 *  @param size 总 大小
 *  @param str 字符串
 *
 *  @return 大小
 */
+ (CGSize)boundingRectWithSize:(CGSize)size str:(NSString *)str font:(UIFont *)font;


/**
 *
 * 字体转化 像素 转化成 iOS 字号 鸡：px ==>> pt
 *
 */
+ (CGFloat)changePxToPt:(CGFloat)px;

+ (CGFloat)PreViewchangePxToPt:(CGFloat)px;

//+(BOOL)isNetWorkContect;
+ (NSString *)getIOSVersion;

@end
