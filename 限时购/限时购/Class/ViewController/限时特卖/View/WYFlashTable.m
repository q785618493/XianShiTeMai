//
//  WYFlashTable.m
//  限时购
//
//  Created by ma c on 16/5/26.
//  Copyright © 2016年 WY. All rights reserved.
//

#import "WYFlashTable.h"
#import "WYSaleCell.h"
#import "WYNewsCell.h"

@interface WYFlashTable () <UITableViewDataSource,UITableViewDelegate>


@end

@implementation WYFlashTable

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    if (self = [super initWithFrame:frame style:style]) {
        
        [self setDelegate:self];
        [self setDataSource:self];
        [self setBackgroundColor:[UIColor whiteColor]];
        [self setShowsVerticalScrollIndicator:NO];
        [self setShowsHorizontalScrollIndicator:NO];
        [self setSeparatorStyle:(UITableViewCellSeparatorStyleNone)];
        [self setShowsHorizontalScrollIndicator:NO];
        
        [self baseCellAddMJRefresh];
    }
    return self;
}

#pragma make- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.flashAray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (_judge) {
        
        static NSString *IDCell = @"cellID";
        
        WYSaleCell *cell = [tableView dequeueReusableCellWithIdentifier:IDCell];
        
        if (!cell) {
            cell = [[WYSaleCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:IDCell];
        }
        
        cell.dataModel = self.flashAray[indexPath.row];
        
        return cell;
    }
    
    static NSString *ID = @"cell";
    
    WYNewsCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (!cell) {
        cell = [[WYNewsCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:ID];
        
    }
    
    cell.cellTag = indexPath.row;
    
    cell.cellBtnTag = ^(NSInteger btnTag) {
        if (_cellBtnAction) {
            _cellBtnAction(btnTag);
        }
    };
    
    cell.dataModel = self.flashAray[indexPath.row];
    return cell;
}

#pragma make- UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (_cellRow) {
        _cellRow(indexPath.row);
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 175;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] initWithFrame:(CGRectMake(0, 0, 0, 0))];
    
    NSArray *imageArray = @[@"限时特卖界面新品团购图标",@"限时特卖界面品牌团购图标"];
    NSArray *titleArray = @[@"新品团购",@"品牌团购"];
    NSArray *colorArray = @[RGB(255, 82, 48),RGB(0, 166, 236)];
    
    CGFloat width = VIEW_WIDTH * 0.5;
    
    for (NSInteger i = 0; i < imageArray.count; i ++) {
        UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        btn.tag = 100 + i;
        [btn setFrame:(CGRectMake(i * width, 0, width, 50))];
        [btn setImage:[UIImage imageNamed:imageArray[i]] forState:(UIControlStateNormal)];
        [btn setTitle:titleArray[i] forState:(UIControlStateNormal)];
        [btn setTitleColor:colorArray[i] forState:(UIControlStateNormal)];
        [btn addTarget:self action:@selector(btnTouchAction:) forControlEvents:(UIControlEventTouchUpInside)];
        [view addSubview:btn];
        
    }
    
    return view;
}

/**
 分区头视 2个图按钮的点击事件
 */
- (void)btnTouchAction:(UIButton *)btn {
    
    if (_btnTag) {
        _btnTag(btn.tag - 100);
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
