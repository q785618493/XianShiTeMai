//
//  GCDCountdownTime.m
//  HaveFace
//
//  Created by 赵金鹏 on 15/11/24.
//  Copyright © 2015年 赵金鹏. All rights reserved.
//

#import "GCDCountdownTime.h"
#import "WYCustomButton.h"

@implementation GCDCountdownTime


/**
 注册的验证码倒计时
 */
+ (void)GCDTimeMethod:(WYCustomButton *)countdownBtn{
    
    __block int timeout= 60;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                countdownBtn.userInteractionEnabled = YES;
                NSString * str = [NSString stringWithFormat:@"请重新获取"];
//                [countdownBtn setTitle:str forState:(UIControlStateNormal)];
                
                NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:13],NSFontAttributeName,RGB(0, 187, 239),NSForegroundColorAttributeName, nil];
                
                NSAttributedString *attrStr = [[NSAttributedString alloc] initWithString:str attributes:dic];
                
                [countdownBtn setAttributedTitle:attrStr forState:(UIControlStateNormal)];
                
                [countdownBtn setBtnTitleType:(TestBtnTitleTypeSpecial)];
            });
        }else
        {
            //            NSString *strTime = [NSString stringWithFormat:@"%d分%.2d秒后重新获取验证码",minutes, seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                countdownBtn.userInteractionEnabled = NO;
                
//                NSString * str = [NSString stringWithFormat:@"%ds后重试",timeout];
//                [countdownBtn setTitle:str forState:(UIControlStateNormal)];
                /**
                 富文本修饰 countdownBtn title的字符串
                 */
                NSDictionary *dic1 = [[NSDictionary alloc] initWithObjectsAndKeys:[UIFont systemFontOfSize:13],NSFontAttributeName,RGB(0, 187, 239),NSForegroundColorAttributeName, nil];
                
                NSAttributedString *attrStr = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%ds",timeout] attributes:dic1];
                
                NSDictionary *dic2 = [[NSDictionary alloc] initWithObjectsAndKeys:[UIFont systemFontOfSize:13],NSFontAttributeName,RGB(159, 159, 159),NSForegroundColorAttributeName, nil];
                NSAttributedString *attrStr2 = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"后重试"] attributes:dic2];
                
                NSMutableAttributedString *muAttrStr = [[NSMutableAttributedString alloc] init];
                
                [muAttrStr insertAttributedString:attrStr atIndex:0];
                [muAttrStr insertAttributedString:attrStr2 atIndex:attrStr.length];
                
                [countdownBtn setAttributedTitle:muAttrStr forState:(UIControlStateNormal)];
                [countdownBtn setBtnTitleType:(TestBtnTitleTypeHave)];
            });
            timeout--;
        }
    });
    dispatch_resume(_timer);
}

@end
