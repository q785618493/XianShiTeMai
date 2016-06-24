//
//  WYQueryCollectionView.m
//  限时购
//
//  Created by ma c on 16/6/1.
//  Copyright © 2016年 WY. All rights reserved.
//

#import "WYQueryCollectionView.h"
#import "WYQueryCell.h"

static NSString *IDColl = @"collID";

@interface WYQueryCollectionView () <UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@end

@implementation WYQueryCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        
        [self setDelegate:self];
        [self setDataSource:self];
        [self setShowsVerticalScrollIndicator:NO];
        [self setBackgroundColor:RGB(240, 240, 240)];
        [self registerClass:[WYQueryCell class] forCellWithReuseIdentifier:IDColl];
        
        
    }
    return self;
}

#pragma make- UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    WYQueryCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:IDColl forIndexPath:indexPath];
    [cell sizeToFit];
    if (!cell) {
        cell = [[WYQueryCell alloc] init];
    }
    
    cell.model = self.dataArray[indexPath.row];
    
    return cell;
}


#pragma make- UICollectionViewDelegate
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 6;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(157, 256);
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
