//
//  WYSortCollection.m
//  限时购
//
//  Created by ma c on 16/5/27.
//  Copyright © 2016年 WY. All rights reserved.
//

#import "WYSortCollection.h"
#import "WYSortCell.h"

static NSString *IDColl = @"coll";

static NSString *headerID = @"header";

@interface WYSortCollection () <UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>



@end

@implementation WYSortCollection

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        
        [self setDelegate:self];
        [self setDataSource:self];
        [self registerClass:[WYSortCell class] forCellWithReuseIdentifier:IDColl];
        [self registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerID];
        [self setBackgroundColor:RGB(245, 245, 245)];
    }
    return self;
}

#pragma make- UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.sortArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    WYSortCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:IDColl forIndexPath:indexPath];
    [cell sizeToFit];
    if (!cell) {
        cell = [[WYSortCell alloc] init];
    }
    
    cell.model = self.sortArray[indexPath.row];
    
    return cell;
}

#pragma make- UICollectionViewDelegate
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat width = VIEW_WIDTH * 0.25 - 2;
    return CGSizeMake(width, width);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(VIEW_WIDTH, 40);
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    NSString *nameID;
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        nameID = headerID;
    }
    
    UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:nameID forIndexPath:indexPath];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:(CGRectMake(0, 0, VIEW_WIDTH, 40))];
    [titleLabel setBackgroundColor:RGB(238, 248, 250)];
    [titleLabel setText:@"    功效专区"];
    [titleLabel setTextColor:RGB(99, 99, 99)];
    [headerView addSubview:titleLabel];
    
    return headerView;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 2;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (_cellRow) {
        _cellRow(indexPath.section, indexPath.row);
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
