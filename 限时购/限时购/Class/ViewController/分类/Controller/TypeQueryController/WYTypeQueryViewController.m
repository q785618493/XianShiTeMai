//
//  WYTypeQueryViewController.m
//  限时购
//
//  Created by ma c on 16/5/30.
//  Copyright © 2016年 WY. All rights reserved.
//

#import "WYTypeQueryViewController.h"
#import "WYQueryCollectionView.h"

#import "WYQueryModel.h"

#define BTN_TAG 11000

@interface WYTypeQueryViewController ()<UIScrollViewDelegate>

/**
 背景的滚动视图
 */
@property (weak, nonatomic) UIScrollView *contextScroll;

/**
 加载展示"热门"商品视图 WYQueryCollectionView
 */
@property (weak, nonatomic) WYQueryCollectionView *collectionHostView;

/**
 加载展示"价格"商品视图 WYQueryCollectionView
 */
@property (weak, nonatomic) WYQueryCollectionView *collectionPriceView;

/**
 加载展示"好评"商品视图 WYQueryCollectionView
 */
@property (weak, nonatomic) WYQueryCollectionView *collectionScoreView;

/**
 加载展示"新品"商品视图 WYQueryCollectionView
 */
@property (weak, nonatomic) WYQueryCollectionView *collectionTimeView;

/**
 4个排序按钮的父视图
 */
@property (weak, nonatomic) UIView *fourBtnView;

/**
 按钮选中状态底部的展示线
 */
@property (weak, nonatomic) UILabel *wireLabel;

@property (assign, nonatomic) CGFloat btn_Width;

/**
 热门排序按钮商品信息存储的数组
 */
@property (strong, nonatomic) NSMutableArray *hostArray;

/**
 价格排序按钮商品信息存储的数组
 */
@property (strong, nonatomic) NSMutableArray *priceArray;

/**
 好评排序按钮商品信息存储的数组
 */
@property (strong, nonatomic) NSMutableArray *scoreArray;

/**
 新品排序按钮商品信息存储的数组
 */
@property (strong, nonatomic) NSMutableArray *timeArray;

@end

@implementation WYTypeQueryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = _name;
    
    _btn_Width = self.view.frame.size.width * 0.25;
    
    self.hostArray = [NSMutableArray array];
    self.priceArray = [NSMutableArray array];
    self.scoreArray = [NSMutableArray array];
    self.timeArray = [NSMutableArray array];
    
    /**
     背景的滚动视图
     */
    [self backgroundAddScrollView];
    
    /**
     加载展示商品视图 WYQueryCollectionView
     */
    [self infoCollectionViewAdd];
    
    /**
     添加排序的4个按钮
     */
    [self topAddFourBtnView];
    
    if (_start) {
        
        /**
         根据品牌跳转至商品列表的 网络请求
         */
        [self httpPostBrandListOrderName:[NSString stringWithFormat:@"host"] OrderType:[NSString stringWithFormat:@"DESC"] isBag:1];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 背景的滚动视图
 */
- (void)backgroundAddScrollView {
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:(CGRectMake(0, 104, VIEW_WIDTH, VIEW_HEIGHT - 104))];
    [scrollView setDelegate:self];
    [scrollView setShowsHorizontalScrollIndicator:NO];
    [scrollView setShowsVerticalScrollIndicator:NO];
    [scrollView setBounces:NO];
    [scrollView setPagingEnabled:YES];
    [scrollView setContentOffset:(CGPointZero)];
    [scrollView setContentSize:(CGSizeMake(VIEW_WIDTH * 4, VIEW_HEIGHT - 104))];
    [self.view addSubview:scrollView];
    self.contextScroll = scrollView;
}

/**
 添加排序的4个按钮
 */
- (void)topAddFourBtnView {
    
    UIView *topView = [[UIView alloc] initWithFrame:(CGRectMake(0, 64, VIEW_WIDTH, 40))];
    [self.view addSubview:topView];
    self.fourBtnView = topView;
    
    NSArray *titleArray = [[NSArray alloc] initWithObjects:@"热门",@"价格",@"好评",@"新品", nil];
    
    CGFloat width = self.view.frame.size.width * 0.25;
    
    for (NSInteger i = 0; i < titleArray.count; i ++) {
        
        UIButton *rankBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [rankBtn setTag:i + BTN_TAG];
        [rankBtn setFrame:(CGRectMake(i * width, 0, width, 36))];
        [rankBtn setTitle:titleArray[i] forState:(UIControlStateNormal)];
        [rankBtn setTitleColor:RGB(168, 168, 168) forState:(UIControlStateNormal)];
        [rankBtn setTitleColor:RGB(0, 180, 239) forState:(UIControlStateSelected)];
        [rankBtn addTarget:self action:@selector(btnTouchActionRank:) forControlEvents:(UIControlEventTouchUpInside)];
        
        if (0 == i) {
            [rankBtn setSelected:YES];
        }
        [topView addSubview:rankBtn];
    }
    
    UILabel *lineLabel = [[UILabel alloc] initWithFrame:(CGRectMake(0, 101, width, 1))];
    [lineLabel setBackgroundColor:RGB(0, 180, 239)];
    [self.view insertSubview:lineLabel aboveSubview:topView];
    self.wireLabel = lineLabel;
    
}

/**
 4个排序按钮的点击事件
 */
- (void)btnTouchActionRank:(UIButton *)rankBtn {
    
    rankBtn.selected = YES;
    
    [UIView animateWithDuration:0.3 animations:^{
        
        [self.wireLabel setFrame:(CGRectMake((rankBtn.tag - BTN_TAG) * _btn_Width, 101, _btn_Width, 1))];
    }];
    
    for (UIButton *fourBtn in self.fourBtnView.subviews) {
        if (rankBtn.tag != fourBtn.tag) {
            fourBtn.selected = NO;
        }
    }
    
    switch (rankBtn.tag - BTN_TAG) {
        case 0: {
            
            if (self.hostArray.count < 1) {
                [self httpPostBrandListOrderName:@"host" OrderType:@"DESC" isBag:1];
            }
            [self.contextScroll setContentOffset:(CGPointMake(0, 0)) animated:YES];
        }
            
            break;
        case 1: {
            
            if (self.priceArray.count < 2) {
                [self httpPostBrandListOrderName:@"price" OrderType:@"DESC" isBag:2];
            }
            [self.contextScroll setContentOffset:(CGPointMake(VIEW_WIDTH , 0)) animated:YES];
            
        }
            
            break;
        case 2: {
//            if (self.scoreArray.count < 1) {
//                [self httpPostBrandListOrderName:@"score" OrderType:@"DESC" isBag:3];
//            }
            [self httpPostBrandListOrderName:@"score" OrderType:@"DESC" isBag:3];
            [self.contextScroll setContentOffset:(CGPointMake(VIEW_WIDTH * 2, 0)) animated:YES];
        }
            
            break;
        case 3: {
//            if (self.timeArray.count < 2) {
//                [self httpPostBrandListOrderName:@"time" OrderType:@"ASC" isBag:4];
//            }
            [self httpPostBrandListOrderName:@"time" OrderType:@"ASC" isBag:4];
            [self.contextScroll setContentOffset:(CGPointMake(VIEW_WIDTH * 3, 0)) animated:YES];
            
        }
            
        default:
            break;
    }
}

/**
 根据品牌跳转至商品列表的 网络请求
 */
- (void)httpPostBrandListOrderName:(NSString *)OrderName OrderType:(NSString *)OrderType isBag:(NSInteger)isBag {
    
    NSDictionary *requestDic = @{@"ShopId":self.typeID,
                                 @"OrderName":OrderName,
                                 @"OrderType":OrderType
                                 };
    
    WS(weakSelf);
    
    [self POSTHttpRequestUrl:[NSString stringWithFormat:@"http://123.57.141.249:8080/beautalk/appShop/appShopGoodsList.do"] dic:requestDic successBlock:^(id JSON) {
        
        NSArray *dataArray = JSON;
        
        if (dataArray.count > 0) {
            
            for (NSDictionary *dic in dataArray) {
                WYQueryModel *model = [WYQueryModel queryModelDic:dic];
                
                switch (isBag) {
                    case 1: {
                        [weakSelf.hostArray addObject:model];
                    }
                        
                        break;
                    case 2: {
                        [weakSelf.priceArray addObject:model];
                    }
                        
                        break;
                    case 3: {
                        [weakSelf.scoreArray addObject:model];
                    }
                        
                        break;
                    case 4: {
                        [weakSelf.timeArray addObject:model];
                    }
                        
                        break;
                        
                    default:
                        break;
                }
            }
 
            switch (isBag) {
                case 1: {
                    weakSelf.collectionHostView.dataArray = weakSelf.hostArray;
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [weakSelf.collectionHostView reloadData];
                    });
                }
                    break;
                case 2: {
                    weakSelf.collectionPriceView.dataArray = weakSelf.priceArray;
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [weakSelf.collectionPriceView reloadData];
                    });
                }
                    break;
                case 3: {
                    weakSelf.collectionScoreView.dataArray = weakSelf.priceArray;
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [weakSelf.collectionScoreView reloadData];
                    });
                }
                    break;
                case 4: {
                    weakSelf.collectionTimeView.dataArray = weakSelf.priceArray;
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [weakSelf.collectionTimeView reloadData];
                    });
                }
                default:
                    break;
            }
        }
    } errorBlock:^(NSError *error) {
        NSLog(@"-%s \n-%@",__func__,error);
    }];
}

/**
 加载展示商品视图 WYQueryCollectionView
 */
- (void)infoCollectionViewAdd {
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:(UICollectionViewScrollDirectionVertical)];
    
    WYQueryCollectionView *queryCollView = [[WYQueryCollectionView alloc] initWithFrame:(CGRectMake(0, 0, VIEW_WIDTH, VIEW_HEIGHT - 104)) collectionViewLayout:flowLayout];
    [self.contextScroll addSubview:queryCollView];
    self.collectionHostView = queryCollView;
    
    UICollectionViewFlowLayout *flowLayout2 = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout2 setScrollDirection:(UICollectionViewScrollDirectionVertical)];
    WYQueryCollectionView *priceCollView = [[WYQueryCollectionView alloc] initWithFrame:(CGRectMake(VIEW_WIDTH, 0, VIEW_WIDTH, VIEW_HEIGHT - 104)) collectionViewLayout:flowLayout2];
    [self.contextScroll addSubview:priceCollView];
    self.collectionPriceView = priceCollView;
    
    UICollectionViewFlowLayout *flowLayout3 = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout3 setScrollDirection:(UICollectionViewScrollDirectionVertical)];
    WYQueryCollectionView *scoreCollView = [[WYQueryCollectionView alloc] initWithFrame:(CGRectMake(VIEW_WIDTH * 2, 0, VIEW_WIDTH, VIEW_HEIGHT - 104)) collectionViewLayout:flowLayout3];
    [self.contextScroll addSubview:scoreCollView];
    self.collectionScoreView = scoreCollView;
    
    UICollectionViewFlowLayout *flowLayout4 = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout4 setScrollDirection:(UICollectionViewScrollDirectionVertical)];
    WYQueryCollectionView *timeCollView = [[WYQueryCollectionView alloc] initWithFrame:(CGRectMake(VIEW_WIDTH * 3, 0, VIEW_WIDTH, VIEW_HEIGHT - 104)) collectionViewLayout:flowLayout4];
    [self.contextScroll addSubview:timeCollView];
    self.collectionTimeView = timeCollView;
    
}

#pragma make- UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    NSInteger index = scrollView.contentOffset.x / VIEW_WIDTH;
    
    switch (index) {
        case 0: {
            [self btnTouchActionRank:self.fourBtnView.subviews[index]];
        }
            
            break;
        case 1: {
            [self btnTouchActionRank:self.fourBtnView.subviews[index]];
        }
            
            break;
        case 2: {
            [self btnTouchActionRank:self.fourBtnView.subviews[index]];
        }
            
            break;
        case 3: {
            [self btnTouchActionRank:self.fourBtnView.subviews[index]];
        }
            
            break;
            
        default:
            break;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
