//
//  WYBaseTableCell.h
//  限时购
//
//  Created by ma c on 16/5/26.
//  Copyright © 2016年 WY. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 约束的头文件
 */
#import "Masonry.h"

/**   * SDWebImage 给 按钮后台加载图片的头文件   */
#import "UIButton+WebCache.h"

/**   * SDWebImage  给cell 后台加载图片的头文件  */
#import "UIImageView+SDWedImage.h"


/**
 cell 上按钮点击事件的回调 block
 */
typedef void(^CellBtnBlock)(NSInteger);

@interface WYBaseTableCell : UITableViewCell



@end
