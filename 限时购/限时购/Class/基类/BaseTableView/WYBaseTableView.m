//
//  WYBaseTableView.m
//  限时购
//
//  Created by ma c on 16/5/26.
//  Copyright © 2016年 WY. All rights reserved.
//

#import "WYBaseTableView.h"

@implementation WYBaseTableView


- (void)baseCellAddMJRefresh {
    
    MJChiBaoZiHeader *header = [MJChiBaoZiHeader headerWithRefreshingTarget:self refreshingAction:@selector(newDataAction)];
    
    header.lastUpdatedTimeLabel.hidden = YES;
    
    header.stateLabel.hidden = YES;
    
//    header.mj_h = 50;
    
    self.mj_header = header;
    
    MJChiBaoZiFooter2 *footer = [MJChiBaoZiFooter2 footerWithRefreshingTarget:self refreshingAction:@selector(moreDataAction)];
    
    footer.stateLabel.hidden = YES;
    
    self.mj_footer.automaticallyChangeAlpha = YES;
    
    self.mj_footer = footer;
    
}

- (void)newDataAction {
    if (_newBlock) {
        _newBlock();
    }
}

- (void)moreDataAction {
    if (_moreBlock) {
        _moreBlock();
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
