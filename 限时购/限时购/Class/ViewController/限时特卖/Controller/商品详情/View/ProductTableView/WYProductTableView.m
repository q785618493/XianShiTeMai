//
//  WYProductTableView.m
//  限时购
//
//  Created by ma c on 16/5/30.
//  Copyright © 2016年 WY. All rights reserved.
//

#import "WYProductTableView.h"
#import "WYGoodsDetailsModel.h"

@interface WYProductTableView ()<UITableViewDataSource,UITableViewDelegate>
@end

@implementation WYProductTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    
    if (self = [super initWithFrame:frame style:style]) {
        
        [self setDelegate:self];
        [self setDataSource:self];
        [self setBounces:NO];
        [self setUserInteractionEnabled:NO];
        [self setBackgroundColor:[UIColor whiteColor]];
        [self setShowsVerticalScrollIndicator:NO];
        [self setSeparatorStyle:(UITableViewCellSeparatorStyleNone)];
    }
    return self;
}

#pragma make- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *IDCell = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:IDCell];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:IDCell];
    }
    [cell setSelectionStyle:(UITableViewCellSelectionStyleNone)];
    [cell.textLabel setFont:[UIFont systemFontOfSize:15]];
    
    WYGoodsDetailsModel *model = _dataArray[indexPath.row];
    
    [cell.textLabel setText:[NSString stringWithFormat:@"%@：%@",model.title,model.value]];
    
    return cell;
}

#pragma make- UITableViewDelegate
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return 36;
//}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 50;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UIView *headerView = [[UIView alloc] initWithFrame:(CGRectMake(0, 0, VIEW_WIDTH, 50))];
    [headerView setBackgroundColor:[UIColor whiteColor]];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:(CGRectMake(16, 15, VIEW_WIDTH - 30, 20))];
    [titleLabel setText:@"图文详情"];
    [titleLabel setFont:[UIFont systemFontOfSize:18]];
    [headerView addSubview:titleLabel];
    
    UILabel *lineLabel = [[UILabel alloc] initWithFrame:(CGRectMake(15, 50 - 2, VIEW_WIDTH - 30, 1))];
    [lineLabel setBackgroundColor:RGB(230, 230, 230)];
    [headerView addSubview:lineLabel];
    
    return headerView;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
