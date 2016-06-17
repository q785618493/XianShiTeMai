//
//  WYCustomButton.h
//  限时购
//
//  Created by ma c on 16/5/30.
//  Copyright © 2016年 WY. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    ///有值
    TestBtnTitleTypeHave = 0,
    
    ///没值
    TestBtnTitleTypeNothing,
    
    ///特殊情况
    TestBtnTitleTypeSpecial
    
    
} TestBtnTitleType;

@interface WYCustomButton : UIButton

/**
 保存按钮的 title 状态
 */
@property (assign, nonatomic) TestBtnTitleType btnTitleType;

@end
