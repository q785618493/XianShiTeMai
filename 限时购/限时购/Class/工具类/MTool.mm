//
//  MTool.m
//  Marry
//
//  Created by Apple on 14-10-9.`
//  Copyright (c) 2014年 Apple. All rights reserved.
//
/*
 
 工具类
 
 */


#import "MTool.h"
#import "sys/utsname.h"
//#import "Reachability.h"

// 判断设备
#define iphone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define iphone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
#define iphone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define iphone6plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)

// 默认文字颜色
#define DEFAULT_VOID_COLOR [UIColor redColor]

@implementation MTool
/**
 *邮编格式
 */
+(BOOL)isPost:(NSString *)text{
    //    NSString* regex = @"^[0-9]*$";
    NSString* regex = @"^\\d{6}$";
    NSPredicate* pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL x = [pred evaluateWithObject:text];
    return x;
}
//邮箱验证
+(BOOL)isValidateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

// 获取系统时间
+(NSString *)getSystemtime
{
    NSDate *  senddate=[NSDate date];
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"HH:mm"];
//    NSString * locationString=[dateformatter stringFromDate:senddate];
    [dateformatter setDateFormat:@"YYYYMMddHH"];
    NSString * morelocationString=[dateformatter stringFromDate:senddate];
    
    return morelocationString;
}

//手机号码验证
+(BOOL) isValidateMobile:(NSString *)mobile
{
//    //手机号以13， 15，18、14、17开头，八个 \d 数字字符
//    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9])|170|(17[0-9]))|(14[0-9])\\d{8}$";
//    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
//    //    NSLog(@"phoneTest is %@",phoneTest);
//    return ![phoneTest evaluateWithObject:mobile];
//
//    
//    NSString * phoneRegex = @"^1((3//d|5[0-35-9]|8[025-9])//d|70[059])\\d{7}$";
//  
//    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
//    //    NSLog(@"phoneTest is %@",phoneTest);
//    return [phoneTest evaluateWithObject:mobile];
    
    
//    //手机号以13， 15，18开头，八个 \d 数字字符
//    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9])|(17[0,0-9]))\\d{8}$";
//    //    NSString *phoneRegex = @"";
//    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
//    return [phoneTest evaluateWithObject:mobile];
    
//    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9])|170)\\d{8}$";
//    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
//    return [phoneTest evaluateWithObject:mobile];
    
    if (mobile.length==11&&[mobile hasPrefix:@"1"]) {
        return YES;
    }else
    {
        return NO;
    }
    
}

// 检测 输入中是否含有特殊字符
+ (BOOL)isIncludeSpecialCharact: (NSString *)str {
    //***需要过滤的特殊字符：~￥#&*<>《》()[]{}【】^@/￡¤￥|§¨「」『』￠￢￣~@#￥&*（）——+|《》$_€。
    NSRange urgentRange = [str rangeOfCharacterFromSet: [NSCharacterSet characterSetWithCharactersInString: @"~￥#&*<>《》()[]{}【】^@/￡¤￥|§¨「」『』￠￢￣~@#￥&*（）——+|《》$_€"]];
    if (urgentRange.location == NSNotFound)
    {
        // 不含 特殊字符
        return NO;
    }
    // 含有 特殊字符
    return YES;
}

//身份证号
+ (BOOL) validateIdentityCard: (NSString *)identityCard
{
    BOOL flag;
    // 身份证号为15位或18位
    if (identityCard.length != 15 || identityCard.length != 18) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [identityCardPredicate evaluateWithObject:identityCard];
}

//车牌号验证
+(BOOL) validateCarNo:(NSString *)carNo
{
    NSString *carRegex = @"^[A-Za-z]{1}[A-Za-z_0-9]{5}$";
    NSPredicate *carTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",carRegex];
    NSLog(@"carTest is %@",carTest);
    return [carTest evaluateWithObject:carNo];
}


// 获取设备型号
+ (NSString*)deviceString
{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    NSLog(@"***************  %@",deviceString);
    if ([deviceString isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
    if ([deviceString isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([deviceString isEqualToString:@"iPhone5,2"])    return @"iPhone 5";
    if ([deviceString isEqualToString:@"iPhone5,3"])    return @"iPhone 5s";
    if ([deviceString isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
    if ([deviceString isEqualToString:@"iPhone8,1"])    return @"iPhone 6s";
    if ([deviceString isEqualToString:@"iPhone6 plus,3"])    return @"iPhone 6 plus";
    
    if ([deviceString isEqualToString:@"iPhone3,2"])    return @"Verizon iPhone 4";
    if ([deviceString isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G";
    if ([deviceString isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G";
    if ([deviceString isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G";
    if ([deviceString isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G";
    if ([deviceString isEqualToString:@"iPod5,1"])      return @"iPod Touch 5G";
    if ([deviceString isEqualToString:@"iPad1,1"])      return @"iPad";
    if ([deviceString isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
    if ([deviceString isEqualToString:@"iPad2,2"])      return @"iPad 2 (GSM)";
    if ([deviceString isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
    if ([deviceString isEqualToString:@"i386"])         return @"Simulator";
    if ([deviceString isEqualToString:@"x86_64"])       return @"Simulator";
    NSLog(@"NOTE: Unknown device type: %@", deviceString);
    return deviceString;
}

// 判断手机屏幕大小
+ (NSString*)iPhoneType
{
    int hight = [[UIScreen mainScreen]bounds].size.height;
    if (hight == 1334)        return @"iPhone 6";
    if (hight == 2208)        return @"iPhone 6 Plus";
    if (hight == 1136)        return @"iPhone 5";
    if (hight == 480)        return @"iPhone 4";
    return @"未知机型";
}

// 字符串拆分
+ (NSDictionary *)getStringWithDict:(NSDictionary *)dict
{
    NSDictionary *dict1 = [NSDictionary dictionary];
    NSArray *array = [NSArray arrayWithArray:[dict objectForKey:@"piclist"]];
    for (int i = 0; i < array.count; i ++) {
        NSDictionary *dict2 = [NSMutableDictionary dictionaryWithDictionary:[array objectAtIndex:i]];
        // 文字数组
        NSMutableArray *arr = [NSMutableArray array];
        NSArray *wordAnimation = [[dict2 objectForKey:@"word_animation"] componentsSeparatedByString:@"|"];
        NSArray *wordColor = [[dict2 objectForKey:@"word_color"] componentsSeparatedByString:@"|"];
        NSArray *word_font = [[dict2 objectForKey:@"word_font"] componentsSeparatedByString:@"|"];
        NSArray *word_size = [[dict2 objectForKey:@"word_size"] componentsSeparatedByString:@"|"];
        NSArray *words = [[dict2 objectForKey:@"words"] componentsSeparatedByString:@"|"];
        NSArray *pos1 = [[dict2 objectForKey:@"pos1"] componentsSeparatedByString:@"|"];
        NSArray *pos2 = [[dict2 objectForKey:@"pos2"] componentsSeparatedByString:@"|"];
        
        
        for (int i = 0; i < pos1.count; i ++) {
            [arr addObject:[pos1 objectAtIndex:i]];
            [arr addObject:[pos2 objectAtIndex:i]];
            [arr addObject:[words objectAtIndex:i]];
            [arr addObject:[word_size objectAtIndex:i]];
            [arr addObject:[word_font objectAtIndex:i]];
            [arr addObject:[wordColor objectAtIndex:i]];
            [arr addObject:[wordAnimation objectAtIndex:i]];
        }
        [dict1 setValue:arr forKey:@"words_arr"];
    }
    
    return dict1;
}

// 获取屏幕分辨率
+ (NSString *)getScreenScrale
{
    CGRect rect_screen = [[UIScreen mainScreen]bounds];

    // 分辨率
    NSString *scral = [NSString stringWithFormat:@"%.fx%.f",rect_screen.size.height * 2,rect_screen.size.width * 2];
    
    return scral;
}

// 判断 输入长度
+ (BOOL) stringlength:(NSString *)inputStr typeStr:(NSString *)typeStr
{
    if (inputStr.length > 16) {
        //        UIAlertView *alter = [[UIAlertView alloc]initWithTitle:@"" message:[NSString stringWithFormat:@"%@最多16个字符",typeStr] delegate:nil cancelButtonTitle:@"重新输入" otherButtonTitles:nil, nil];
//        [alter show];
        UIAlertView *alter = [[UIAlertView alloc]initWithTitle:@"" message:typeStr delegate:nil cancelButtonTitle:@"重新输入" otherButtonTitles:nil, nil];
        [alter show];
        return NO;
    }else if(inputStr.length < 6){
        UIAlertView *alter = [[UIAlertView alloc]initWithTitle:@"" message:typeStr delegate:nil cancelButtonTitle:@"重新输入" otherButtonTitles:nil, nil];
        [alter show];
        return NO;
    }else{
        return YES;
    }
}


//动态改变图片的大小
+(UIImage *) OriginImage:(UIImage *)image scaleToSize:(CGSize)size
{
    UIGraphicsBeginImageContext(size);  //size 为CGSize类型，即你所需要的图片尺寸
    
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
//    UIImage *scaledImage = [UIImage RLLibraryImageNamed];
    
    UIGraphicsEndImageContext();
    //返回的就是已经改变的图片
    return scaledImage;
}

+(UIEdgeInsets)resizeDetail:(CGSize)size{
    
    CGFloat top = 100; // 顶端盖高度
    CGFloat bottom = size.height; // 底端盖高度
    CGFloat left = 0; // 左端盖宽度
    CGFloat right = 0; // 右端盖宽度
    UIEdgeInsets insets = UIEdgeInsetsMake(top, left, bottom, right);
    
//    self.detailBG.image = [[UIImage RLLibraryImageNamed:@"rl_warm_detail_bg.png"] resizableImageWithCapInsets:insets];
    return insets;
}

// 字符串转时间格式
+(NSString *)stringTransformToTime:(NSString *)timeStr
{
     NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];//实例化一个NSDateFormatter对象
     
     [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];//设定时间格式,这里可以设置成自己需要的格式
     
     NSDate *date =[dateFormat dateFromString:@"1980-01-01 00:00:01"];
    
    NSString *str = [NSString stringWithFormat:@"%@",date];
    
//    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
//    [inputFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
//    [inputFormatter setDateFormat:@"YYYYMMDD"];
//    NSDate* inputDate = [inputFormatter dateFromString:timeStr];
//    NSLog(@"date = %@", inputDate);
//    
//    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
//    [outputFormatter setLocale:[NSLocale currentLocale]];
//    [outputFormatter setDateFormat:@"YYYY年MM月DD日"];
//    NSString *str = [outputFormatter stringFromDate:inputDate];
//    NSLog(@"testDate:%@", str);
    
    
    return str;
}

// 时间转字符串
+(NSString *)timeTransformToString:(NSDate *)time
{
    //转换时间格式
    NSDateFormatter *df2 = [[NSDateFormatter alloc] init];//格式化
    
    
    [df2 setDateFormat:@"yyyy-MM-dd"];
    
    [df2 setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"]];
    [df2 setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    
    return [df2 stringFromDate:time];
}

// 图片旋转
+ (UIImageView *)rotate360DegreeWithImageView:(UIImageView *)imageView{
    CABasicAnimation *animation = [ CABasicAnimation
                                   animationWithKeyPath: @"transform" ];
    animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    
    //围绕Z轴旋转，垂直与屏幕
    animation.toValue = [ NSValue valueWithCATransform3D:
                         
                         CATransform3DMakeRotation(M_PI, 0.0, 0.0, 1.0) ];
    animation.duration = 1;
    //旋转效果累计，先转180度，接着再旋转180度，从而实现360旋转
    animation.cumulative = YES;
    animation.repeatCount = 100000000000000000;
    
    //在图片边缘添加一个像素的透明区域，去图片锯齿
//    CGRect imageRrect = CGRectMake(0, 0,imageView.frame.size.width, imageView.frame.size.height);
//    UIGraphicsBeginImageContext(imageRrect.size);
//    [imageView.image drawInRect:CGRectMake(1,1,imageView.frame.size.width-2,imageView.frame.size.height-2)];
//    imageView.image = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
    
    [imageView.layer addAnimation:animation forKey:nil];
    return imageView;
}

+ (void)stopRound:(UIView *)view
{
//    NSTimeInterval
    
    [view.layer removeAllAnimations];
}

// 获取 爱的邀约内容长度
+(CGSize)getSizeOfString:(NSString *)str font:(CGFloat)font size:(CGSize)size{
    CGSize size1;
    
//     size1 = [str sizeWithFont:font constrainedToSize:CGSizeMake(size.width, size.height) lineBreakMode:NSLineBreakByTruncatingTail];
    
    
    return size1;
}

//animation.repeatCount = 1000;
//这个你要想一直旋转，设置一个无穷大就得了
//
//停止的话直接这样就停止了
//[self.view.layer removeAllAnimates];

// 把OC对象转化成JSON字符串
+ (NSString *)objectToJson:(id)data
{
//    NSData *json = [NSJSONSerialization dataWithJSONObject:data options:NSJapaneseEUCStringEncoding error:nil];
//    
//    NSString *jsonString = [[NSString alloc] initWithData:json
//                                                 encoding:NSUTF8StringEncoding];
    
    NSString *jsonString;
    if (data != nil) {
        NSData *json = [NSJSONSerialization dataWithJSONObject:data options:NSJSONReadingMutableLeaves error:nil];
        
        jsonString = [[NSString alloc] initWithData:json
                                           encoding:NSUTF8StringEncoding];
    }else{
        jsonString = @"";
    }
    return jsonString;
}

// 字符串转 字典
+(NSDictionary *)stringToDict:(NSString *)str
{

    NSData *JSONData = [str dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *responseJSON = [NSJSONSerialization JSONObjectWithData:JSONData options:NSJSONReadingMutableLeaves error:nil];
    return responseJSON;
}


// 清楚缓存
+(void)clearCache
{
    NSLog(@"清除缓存");
    dispatch_async(
                   dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
                   , ^{
                       NSString *cachPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
                       
                       NSArray *files = [[NSFileManager defaultManager] subpathsAtPath:cachPath];
//                       NSLog(@"files :%lf",[files count]);
                       for (NSString *p in files) {
                           NSError *error;
                           NSString *path = [cachPath stringByAppendingPathComponent:p];
                           if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
                               [[NSFileManager defaultManager] removeItemAtPath:path error:&error];
                           }
                       }
                       [self performSelectorOnMainThread:@selector(clearCacheSuccess) withObject:nil waitUntilDone:YES];});
    
}

+(void)clearCacheSuccess
{
    UIAlertView *alterView = [[UIAlertView alloc]initWithTitle:nil message:@"清除成功" delegate:nil cancelButtonTitle:nil otherButtonTitles:nil, nil];
    [alterView show];
    [alterView dismissWithClickedButtonIndex:0 animated:YES];
}

+(void)removeGause:(UIView *)supperView
{
//       UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    for (UIView *view in supperView.subviews) {
        if (view.tag == 999999) {
            [view removeFromSuperview];
        }
    }
}

//  获取沙盒目录
+ (NSString *)applicationDocumentsDirectory
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docDir = [paths objectAtIndex:0];
    
    return docDir;
}

// 获得 文件的大小
+ (CGFloat) fileSizeAtPath:(NSString*) filePath{
    NSFileManager* manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath:filePath]){
        return [[manager attributesOfItemAtPath:filePath error:nil] fileSize] / 1024 / 1024;
    }
    return 0;
}


// 获取屏幕高比例
+(CGFloat)getScreenHightscale
{
    CGFloat scaleY = 1.0;
    if (iphone5) {
        scaleY = 1.0;
    }else if (iphone6) {
        scaleY = 1.17429577;
    }else  if (iphone6plus) {
        scaleY = 1.2957;
    }else if(iphone4){
        scaleY = 0.8450;
    }
    
    return scaleY;
}

// 获取屏幕宽比例
+(CGFloat)getScreenWidthscale
{
    CGFloat scaleX = 1.0;
    if (iphone5) {
        scaleX = 1.0;
    }else if (iphone6) {
        scaleX = 1.171875;
    }else  if (iphone6plus) {
        scaleX = 1.29375;
    }else if(iphone4){
        scaleX = 1.0 ;
    }
    return scaleX;
}

/**
 *   获得某个范围内的屏幕图像
 *
 *  @param view  截图的View
 *  @param frame 截图区域大小
 *
 *  @return 返回截取的图片
 */
+ (UIImage *)imageFromView:(UIView *)view frame:(CGRect)frame
{
    CGFloat scale = 2.0;
    
    if (iphone6plus) {
        scale = 3.0;
    }
    
    UIGraphicsBeginImageContext(view.frame.size);
    UIGraphicsBeginImageContextWithOptions(view.frame.size, YES, scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);

    [view.layer renderInContext:context];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIRectClip(view.frame);
    CGImageCreateWithImageInRect([image CGImage], view.frame);
    return [self imageFromImage:image inRect:frame scale:scale];
    
    
}

/**
 *从图片中按指定的位置大小截取图片的一部分
 * UIImage image 原始的图片
 * CGRect rect 要截取的区域
 */
+ (UIImage *)imageFromImage:(UIImage *)image inRect:(CGRect)rect scale:(CGFloat)scale  {
    CGImageRef sourceImageRef = [image CGImage];
    CGImageRef newImageRef = CGImageCreateWithImageInRect(sourceImageRef, CGRectMake(rect.origin.x*scale, rect.origin.y*scale, rect.size.width*scale, rect.size.height*scale));
    UIImage *newImage = [UIImage imageWithCGImage:newImageRef];
    

    
    return newImage;
}


+(UIImage *)newImageFromView:(UIView*)view frame:(CGRect)frame
{
//    UIGraphicsBeginImageContextWithOptions(frame.size, NO, 1);
//    [view drawViewHierarchyInRect:frame afterScreenUpdates:NO];
//    UIImage *snapshot = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    
//    return snapshot;
    //创建一个基于位图的图形上下文并指定大小为CGSizeMake(200,400)
    UIGraphicsBeginImageContext(frame.size);
    
    //renderInContext 呈现接受者及其子范围到指定的上下文
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    //返回一个基于当前图形上下文的图片
    UIImage *aImage =UIGraphicsGetImageFromCurrentImageContext();
    
    //移除栈顶的基于当前位图的图形上下文
    UIGraphicsEndImageContext();
    
    //以png格式返回指定图片的数据
    //    imageData = UIImagePNGRepresentation(aImage);
    return aImage;
}


/**
 *   高斯模糊
 *
 *  @param image 需要模糊的图片
 *
 *  @return 模糊后的图片
 */
+ (UIImage *)gauseImgWithImage:(UIImage *)image
{
    CIContext *context = [CIContext contextWithOptions:nil];
    CIImage *inputImage = [[CIImage alloc]initWithImage:image];
    CIFilter *filter = [CIFilter filterWithName:@"CIGaussianBlur"];
    [filter setValue:inputImage forKey:kCIInputImageKey];
    [filter setValue:[NSNumber numberWithFloat:5.0] forKey:@"inputRadius"];
    CIImage *result = [filter valueForKey:kCIOutputImageKey];
    CGImageRef CGImage = [context createCGImage:result fromRect:[result extent]];
    UIImage *retImage = [UIImage imageWithCGImage:CGImage];
    CGImageRelease(CGImage);
    return retImage;
}

////判断文件是否存在
//
//-(BOOL)judgeFileExist:(NSString * )fileName
//
//{
//    
//    //获取文件路径
//    
//    NSString *path = [[NSBundle mainBundle] pathForResource:fileName ofType:@""];
//    
//    
//    
//    if(path==NULL)
//        
//        return NO;
//    
//    return YES;
//    
//}

+ (UIColor *)colorWithHexString:(NSString *)stringToConvert

{
    if ([stringToConvert length] <6){//长度不合法
        return [UIColor blackColor];
    }
    NSString *tempString=[stringToConvert lowercaseString];
    if ([tempString hasPrefix:@"0x"]){//检查开头是0x
        tempString = [tempString substringFromIndex:2];
    }else if ([tempString hasPrefix:@"#"]){//检查开头是#
        tempString = [tempString substringFromIndex:1];
    }
    if ([tempString length] !=6){
        return [UIColor blackColor];
    }
    //分解三种颜色的值
    NSRange range;
    range.location =0;
    range.length =2;
    NSString *rString = [tempString substringWithRange:range];
    range.location =2;
    NSString *gString = [tempString substringWithRange:range];
    range.location =4;
    NSString *bString = [tempString substringWithRange:range];
    //取三种颜色值
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString]scanHexInt:&r];
    [[NSScanner scannerWithString:gString]scanHexInt:&g];
    [[NSScanner scannerWithString:bString]scanHexInt:&b];
    return [UIColor colorWithRed:((float) r /255.0f)
                           green:((float) g /255.0f)
                            blue:((float) b /255.0f)
                           alpha:1.0f];
}

//// 颜色转换
//+ (UIColor *)colorWithHexString:(NSString *)stringToConvert
//{
//    NSString *cString = [[stringToConvert stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
//    
//    
//    if ([cString length] < 6)
//        return DEFAULT_VOID_COLOR;
//    if ([cString hasPrefix:@"#"])
//        cString = [cString substringFromIndex:1];
//    if ([cString length] != 6)
//        return DEFAULT_VOID_COLOR;
//    
//    NSRange range;
//    range.location = 0;
//    range.length = 2;
//    NSString *rString = [cString substringWithRange:range];
//    
//    range.location = 2;
//    NSString *gString = [cString substringWithRange:range];
//    
//    range.location = 4;
//    NSString *bString = [cString substringWithRange:range];
//    
//    
//    unsigned int r, g, b;
//    [[NSScanner scannerWithString:rString] scanHexInt:&r];
//    [[NSScanner scannerWithString:gString] scanHexInt:&g];
//    [[NSScanner scannerWithString:bString] scanHexInt:&b];
//    
//    return [UIColor colorWithRed:((float) r / 255.0f)
//                           green:((float) g / 255.0f)
//                            blue:((float) b / 255.0f)
//                           alpha:1.0f];
//}


+ (CGSize)boundingRectWithSize:(CGSize)size str:(NSString *)str font:(UIFont *)font
{
    CGSize retSize = [str boundingRectWithSize:CGSizeMake(size.width, 300)
                                                         options:\
                   NSStringDrawingTruncatesLastVisibleLine |
                   NSStringDrawingUsesLineFragmentOrigin |
                   NSStringDrawingUsesFontLeading
                                    attributes:@{NSFontAttributeName:font}
                                                         context:nil].size;
    
    return retSize;
}

#pragma mark -修改dpi原来是329
+ (CGFloat)changePxToPt:(CGFloat)px
{
    CGFloat pt = 0.0;
    CGFloat dpi = 0.0;
    if (iphone4) {
        dpi = 329;
    }else if (iphone5){
        dpi = 329;
    }else if(iphone6){
        dpi = 329;
    }else if(iphone6plus){
        dpi = 329;
    }else{
        dpi = 329;
    }
    
    pt = px * 76 / dpi;
    return pt;
}

#pragma mark -PreView用这个方法
+ (CGFloat)PreViewchangePxToPt:(CGFloat)px
{
    CGFloat pt = 0.0;
    CGFloat dpi = 0.0;
    if (iphone4) {
        dpi = 200;
    }else if (iphone5){
        dpi = 200;
    }else if(iphone6){
        dpi = 200;
    }else if(iphone6plus){
        dpi = 200;
    }else{
        dpi = 200;
    }
    
    pt = px * 76 / dpi;
    return pt;
}
/*
 判断网络状态
 */
//+(BOOL)isNetWorkContect
//{
//    BOOL isNetWorkContect = YES;
//    Reachability *reach = [Reachability reachabilityWithHostName:@"http://www.mmarri.com.cn"];
//    //        BOOL isNetWorkContect = YES;
////    NSLog(@"%d",[reach currentReachabilityStatus]);
//    switch ([reach currentReachabilityStatus]) {
//        case NotReachable:
//            isNetWorkContect = NO;
//            NSLog(@"isNetWorkConect ------> notReachable");
//            break;
//        case ReachableViaWWAN:
//            isNetWorkContect = YES;
//            NSLog(@"isNetWorkConect ------> WIFI");
//            break;
//        case ReachableViaWiFi:
//            isNetWorkContect = YES;
//            NSLog(@"isNetWorkConect ------> 3G");
//            break;
//    }
//    if (!isNetWorkContect) {
////        [self showNetWorkUnUseableView];
////        [self performSelector:@selector(hideView) withObject:nil afterDelay:1.5];
//        
//        UIView *view = [[UIView alloc]init];
//        view.frame = CGRectMake(0, 0, 250, 40);
//        view.center = CGPointMake(160, 100);
//        view.backgroundColor = [UIColor blackColor];
//        view.alpha = 0.0;
//        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, view.frame.size.width, view.frame.size.height)];
//        label.text = @"当前网络不可用,请检查网络连接";
//        label.backgroundColor = [UIColor clearColor];
//        label.textAlignment = NSTextAlignmentCenter;
//        label.font = [UIFont systemFontOfSize:16.0];
//        label.textColor = [UIColor whiteColor];
//        view.layer.cornerRadius = 5.0;
//        [view addSubview:label];
//        
//        [UIView beginAnimations:nil context:NULL];
//        [UIView setAnimationDuration:0.5f];
//        view.alpha = 0.8;
//        [UIView commitAnimations];
//        [[AppDelegate shareDelegate].window addSubview:view];
//        
//        
//        view.alpha = 0.8;
//        [UIView beginAnimations:nil context:NULL];
//        [UIView setAnimationDuration:2.0f];
//        view.alpha = 0;
//        [UIView commitAnimations];
//
//        
//    }
//    return isNetWorkContect;
//}


+ (NSString*)getIOSVersion
{
    return [[UIDevice currentDevice] systemVersion] ;
}
//-(void)hideView
//{
//    view.alpha = 0.8;
//    [UIView beginAnimations:nil context:NULL];
//    [UIView setAnimationDuration:0.5f];
//    view.alpha = 0;
//    [UIView commitAnimations];
//}

@end
