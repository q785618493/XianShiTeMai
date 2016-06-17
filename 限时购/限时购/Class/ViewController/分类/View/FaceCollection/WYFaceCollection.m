//
//  WYFaceCollection.m
//  限时购
//
//  Created by ma c on 16/5/27.
//  Copyright © 2016年 WY. All rights reserved.
//

#import "WYFaceCollection.h"
#import "WYFaceCell.h"

static NSString *IDColl = @"coll";

static NSString *headerID = @"header";

@interface WYFaceCollection () <UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

/**
 分区头标题
 */
@property (strong, nonatomic) NSArray *nameArray;


/**
 分区头背景颜色
 */
@property (strong, nonatomic) NSArray *colorArray;

@end

@implementation WYFaceCollection

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        
        _nameArray = @[@"    功效专区 EFFECT",@"    面部专区 FACE",@"    身体专区 BODY",@"    品牌专区 BRAND"];
        _colorArray = @[RGB(238, 248, 250),RGB(251, 243, 244),RGB(251, 243, 244),RGB(238, 248, 250)];
        
        [self setBackgroundColor:RGB(245, 245, 245)];
        [self setDelegate:self];
        [self setDataSource:self];
        [self setShowsVerticalScrollIndicator:NO];
        [self setShowsHorizontalScrollIndicator:NO];
        [self registerClass:[WYFaceCell class] forCellWithReuseIdentifier:IDColl];
        [self registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerID];
    }
    return self;
}

#pragma make- UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.faceArray.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.faceArray[section] count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    WYFaceCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:IDColl forIndexPath:indexPath];
    [cell sizeToFit];
    if (!cell) {
        cell = [[WYFaceCell alloc] init];
    }
    
//    cell.model = self.faceArray[indexPath.section][indexPath.row];
    
    cell.dataModel = self.faceArray[indexPath.section][indexPath.row];
    
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
    [titleLabel setBackgroundColor:_colorArray[indexPath.section]];
    [titleLabel setText:_nameArray[indexPath.section]];
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
        _cellRow(indexPath.section,indexPath.row);
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
