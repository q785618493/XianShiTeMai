//
//  WYProductViewController.m
//  限时购
//
//  Created by ma c on 16/5/28.
//  Copyright © 2016年 WY. All rights reserved.
//

#import "WYProductViewController.h"
#import "WYTypeQueryViewController.h"
#import "TopRollView.h"
#import "WYCenterView.h"
#import "WYProductTableView.h"
#import "WYImageDetailsView.h"
#import "WYGoodsScoreView.h"

#import "WYAllGoodsModel.h"
#import "WYScoreModel.h"
#import "WYGoodsDetailsModel.h"
#import "WYAllDetailsModel.h"

@interface WYProductViewController ()

/** weak修饰 指向背景可滚动的UIScrollView 用来展示其它视图,用于全局访问 */
@property (weak, nonatomic) UIScrollView *centerScroll;

/** 上部的轮播视图 */
@property (weak, nonatomic) TopRollView *topRollView;

/** 中部第1块的 价格,品牌,国家等信息的 WYCenterView */
@property (weak, nonatomic) WYCenterView *wyCenter;

/** 中部第2块的 商品详情文字信息的 WYProductTableView */
@property (weak, nonatomic) WYProductTableView *twoTableView;

/** 中部第3块的 商品详情图片信息的 WYImageDetailsView */
@property (strong, nonatomic) WYImageDetailsView *imageDetailsView;

/** 底部商品评分的视图*/
@property (weak, nonatomic) WYGoodsScoreView *goodsScoreView;

@end

@implementation WYProductViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /**
     添加导航条上的三个按钮
     */
    [self navigationAddThreeBarBtnItem];
    
    /**
     添加中部承载展示视图的 滚动视图
     */
    [self centerAddScrollView];
    
    /** 添加顶部轮播视图*/
    [self addUpScrollView];
    
    /** 添加底部购物车和立即购买按钮的 view */
    [self bottomAddView];
    
    
    //判断数据是否执行网络请求
    if (!_start) {
        return;
    }
    
    /** 商品所有图片列表网络请求 */
    [self httpPostAllGoods];
    
    /** 商品详情列表网络请求 */
    [self httpPostGoodsDetails];
    
    /** 商品详情部分（包含价格，评分等）网络请求 */
    [self httpPostAllGoodsDetails];
    
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self goodsScoreBottomView];
        
        /** 商品评分部分网络请求 */
        [self httpPostGoodsScore];
    });
    
    
    /** 商品评论部分网络请求(这是空的) */
//    [self httpPostComment];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 添加中部承载展示视图的 滚动视图
 */
- (void)centerAddScrollView {
    
    /**
     背景可滚动的UIScrollView 用来展示其它视图
     */
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:(CGRectMake(0, 64, VIEW_WIDTH, VIEW_HEIGHT - 64 - 44))];
    [scrollView setBackgroundColor:RGB(245, 245, 245)];
    [scrollView setContentOffset:(CGPointZero)];
    [scrollView setShowsHorizontalScrollIndicator:NO];
    [scrollView setShowsVerticalScrollIndicator:NO];
    [self.view addSubview:scrollView];
    self.centerScroll = scrollView;
    
    [scrollView setContentSize:(CGSizeMake(VIEW_WIDTH, 2000))];
    
}

/** 添加底部购物车和立即购买按钮的 view */
- (void)bottomAddView {
    
    UIView *bottomView = [[UIView alloc] initWithFrame:(CGRectMake(0, VIEW_HEIGHT - 44, VIEW_WIDTH, 44))];
    [bottomView setBackgroundColor:RGB(245, 245, 245)];
    [self.view addSubview:bottomView];
    
    UILabel *lineLabel = [[UILabel alloc] initWithFrame:(CGRectMake(0, 0, VIEW_WIDTH, 1))];
    [lineLabel setBackgroundColor:RGB(213, 213, 213)];
    [bottomView addSubview:lineLabel];
    
    /**     购物车按钮     */
    UIButton *shoppingBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [shoppingBtn setFrame:(CGRectMake(15, 9, 26, 26))];
    [shoppingBtn setImage:[UIImage imageNamed:@"详情界面购物车按钮"] forState:(UIControlStateNormal)];
    [shoppingBtn addTarget:self action:@selector(btnTouchActionShopping) forControlEvents:(UIControlEventTouchUpInside)];
    [bottomView addSubview:shoppingBtn];
    
    /**     加入购物车按钮     */
    CGFloat width = (VIEW_WIDTH - 105) * 0.5;
    
    UIButton *addCartBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [addCartBtn setFrame:(CGRectMake(75, 5, width, 35))];
    [addCartBtn setImage:[UIImage imageNamed:@"详情界面加入购物车按钮"] forState:(UIControlStateNormal)];
    [addCartBtn addTarget:self action:@selector(btnTouchActionAddCart) forControlEvents:(UIControlEventTouchUpInside)];
    [bottomView addSubview:addCartBtn];

    /**     立即购买按钮     */
    UIButton *buyNowBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [buyNowBtn setFrame:(CGRectMake(VIEW_WIDTH - width - 15, 5, width, 35))];
    [buyNowBtn setImage:[UIImage imageNamed:@"详情界面立即购买按钮"] forState:(UIControlStateNormal)];
    [buyNowBtn addTarget:self action:@selector(btnTouchActionBuyNow) forControlEvents:(UIControlEventTouchUpInside)];
    [bottomView addSubview:buyNowBtn];
}

/** 购物车按钮点击事件 */
- (void)btnTouchActionShopping {
    
}

/** 加入购物车按钮点击事件 */
- (void)btnTouchActionAddCart {
    
}

/** 立即购买按钮点击事件 */
- (void)btnTouchActionBuyNow {
    
}

/** 添加导航条上的三个按钮 */
- (void)navigationAddThreeBarBtnItem {
    
    /**     左边返回按钮     */
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageWithModeImageName:@"详情界面返回按钮"] style:(UIBarButtonItemStylePlain) target:self action:@selector(barItemLeft)];
    [self.navigationItem setLeftBarButtonItem:leftItem];
    
    
    /**     右边两个按钮     */
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageWithModeImageName:@"详情界面收藏按钮"] style:(UIBarButtonItemStylePlain) target:self action:@selector(barItemCollect)];
    
    UIBarButtonItem *_rightItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageWithModeImageName:@"详情界面转发按钮"] style:(UIBarButtonItemStylePlain) target:self action:@selector(barItemRelay)];
    
    NSArray *itemsArray = [NSArray arrayWithObjects:rightItem,_rightItem, nil];
    
    [self.navigationItem setRightBarButtonItems:itemsArray];
}

/** 左边返回按钮点击事件 */
- (void)barItemLeft {
    [self.navigationController popViewControllerAnimated:YES];
}

/** 右边收藏按钮点击事件 */
- (void)barItemCollect {
    
}

/** 右边转发按钮点击事件 */
- (void)barItemRelay {
    
}

/** 商品所有图片列表网络请求 */
- (void)httpPostAllGoods {
    
    WS(weakSelf);
    
    [self GETHttpRequestUrl:@"http://123.57.141.249:8080/beautalk/appGoods/findGoodsImgList.do" dic:@{@"GoodsId":self.goodsID} successBlock:^(id JSON) {
        
        NSArray *dataArray = JSON;
        
        if (dataArray.count > 0) {
            /**
             保存全部 商品所有图片列表数据的数组
             */
            NSMutableArray *muArray = [NSMutableArray arrayWithCapacity:dataArray.count];
            
            /**
             保存 imgType 1.轮播位图片 的数组
             */
            NSMutableArray *imageArray = [NSMutableArray arrayWithCapacity:dataArray.count];
            
            /**
             保存 imgType 2.详情图片 的数组
             */
            NSMutableArray *detailsImageArray = [NSMutableArray arrayWithCapacity:dataArray.count];
            /**
             保存 imgType 2.详情图片的高度数据
             */
            NSMutableArray *detailsHeightArray = [NSMutableArray arrayWithCapacity:dataArray.count];
            
            /**
             保存 imgType 3.实拍图片 的数组
             */
            NSMutableArray *topsImageArray = [NSMutableArray arrayWithCapacity:dataArray.count];
            
            for (NSDictionary *dic in dataArray) {
                WYAllGoodsModel *model = [[WYAllGoodsModel alloc] initWithDictionary:dic];
                [muArray addObject:model];
                
                switch ([model.imgType integerValue]) {
                    case 1: {
                        [imageArray addObject:model.imgView];
                    }
                        
                        break;
                    case 2: {
                        [detailsImageArray addObject:model.imgView];
                        [detailsHeightArray addObject:[NSNumber numberWithInteger:model.resolution]];
                    }
                        
                        break;
                    case 3: {
                        [topsImageArray addObject:model.imgView];
                    }
                        
                    default:
                        break;
                }
                
            }
            /** scrollView 顶部图片轮播视图的数据*/
            weakSelf.topRollView.arrayImages = imageArray;
            
            /**            中部第3块的 商品详情图片信息的 WYImageDetailsView            */
            [weakSelf imageAddViewPhotoArray:detailsImageArray height:[detailsHeightArray[0] floatValue]];
            
        }
        
    } errorBlock:^(NSError *error) {
        ZDYLOG(@"+%s +%@",__func__,error);
    }];
}

/** 商品详情列表网络请求 */
- (void)httpPostGoodsDetails {
    WS(weakSelf);
    
    [self GETHttpRequestUrl:@"http://123.57.141.249:8080/beautalk/appGoods/findGoodsDetailList.do" dic:@{@"GoodsId":self.goodsID} successBlock:^(id JSON) {
        NSArray *dataArray = JSON;
        
        if (dataArray.count > 0) {
            
            NSMutableArray *muArray = [NSMutableArray arrayWithCapacity:dataArray.count];
            for (NSDictionary *dic in dataArray) {
                WYGoodsDetailsModel *model = [[WYGoodsDetailsModel alloc] initWithDictionary:dic];
                [muArray addObject:model];
            }
            
            /** 添加中部第2块 WYProductTableView*/
            [weakSelf twoCenterAddTableViewDataArray:muArray];
        }
        
    } errorBlock:^(NSError *error) {
        ZDYLOG(@"++%s ++%@",__func__,error);
    }];
}

/** 商品详情部分（包含价格，评分等）网络请求*/
- (void)httpPostAllGoodsDetails {
    WS(weakSelf);
    
    [self GETHttpRequestUrl:@"http://123.57.141.249:8080/beautalk/appGoods/findGoodsDetail.do" dic:@{@"GoodsId":self.goodsID} successBlock:^(id JSON) {
        NSDictionary *dataDic = JSON;
        
        if (dataDic != nil) {
            
            WYAllDetailsModel *model = [[WYAllDetailsModel alloc] initWithDictionary:dataDic];
            
            /**             添加轮播视图上的购买人数按钮             */
            [weakSelf addRollViewUpBuyCount:model.buyCount];
            
            /**             添加轮播视图下面的 centerView             */
            [weakSelf rollViewBottomAddCenterViewModel:model];
            
        }
        
    } errorBlock:^(NSError *error) {
        ZDYLOG(@"+++%s +++%@",__func__,error);
    }];
}

/** 商品评分部分网络请求 */
- (void)httpPostGoodsScore {
    WS(weakSelf);
    
    [self GETHttpRequestUrl:@"http://123.57.141.249:8080/beautalk/appGoods/findGoodsScore.do" dic:@{@"GoodsId":self.goodsID} successBlock:^(id JSON) {
        NSArray *dataArray = JSON;
        
        if (dataArray.count > 0) {
            
            NSMutableArray *muArray = [NSMutableArray arrayWithCapacity:dataArray.count];
            for (NSDictionary *dic in dataArray) {
                WYScoreModel *model = [[WYScoreModel alloc] initWithDictionary:dic];
                [muArray addObject:model];
            }
            
            weakSelf.goodsScoreView.dataArray = muArray;
            
            /** 底部商品评分部分的视图 */
//            [weakSelf goodsScoreBottomViewDataArray:muArray];
        }
        
    } errorBlock:^(NSError *error) {
        ZDYLOG(@"+++%s +++%@",__func__,error);
    }];
}

/** 商品评论部分网络请求(空的) */
- (void)httpPostComment {
//    WS(weakSelf);
    
    [self GETHttpRequestUrl:@"http://123.57.141.249:8080/beautalk/appGoods/findGoodsComment.do" dic:@{@"GoodsId":self.goodsID} successBlock:^(id JSON) {
        NSArray *dataArray = JSON;
        
        NSLog(@"=====json==%@",JSON);
        
//        NSData *data = [NSJSONSerialization dataWithJSONObject:JSON options:(NSJSONWritingPrettyPrinted) error:nil];
//        NSString *json = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//        NSLog(@"------%@",json);
        
        if (dataArray.count > 0) {
            
        }
        
    } errorBlock:^(NSError *error) {
        ZDYLOG(@"+++%s +++%@",__func__,error);
    }];
    
}

/** scrollView 顶部图片轮播视图 */
- (void)addUpScrollView {
    
    TopRollView *rollView = [[TopRollView alloc] initWithFrame:(CGRectMake(0, 0, VIEW_WIDTH, VIEW_WIDTH))];
    [self.centerScroll addSubview:rollView];
    self.topRollView = rollView;
}

/** 添加轮播视图上的购买人数按钮 */
- (void)addRollViewUpBuyCount:(NSString *)buyCount {
    
    UIButton *buyBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [buyBtn setFrame:(CGRectMake(VIEW_WIDTH - 85, VIEW_WIDTH - 50, 92, 22))];
    [buyBtn setBackgroundColor:RGB(255, 75, 34)];
    [buyBtn setTitle:buyCount forState:(UIControlStateNormal)];
    [buyBtn.layer setMasksToBounds:YES];
    [buyBtn.layer setCornerRadius:11];
    [buyBtn.titleLabel setFont:[UIFont systemFontOfSize:12]];
    [self.topRollView addSubview:buyBtn];
}

/** 中部第1块的 价格,品牌,国家等信息的 WYCenterView */
- (void)rollViewBottomAddCenterViewModel:(WYAllDetailsModel *)mode {
    
    WYCenterView *centerView = [[WYCenterView alloc] initWithFrame:(CGRectMake(0, VIEW_WIDTH, VIEW_WIDTH, 251)) model:mode];
    centerView.countryUrl = _countryImageUrl;
    [self.centerScroll addSubview:centerView];
    self.wyCenter = centerView;
    
    centerView.btnAction = ^() {
      
        WYTypeQueryViewController *queryVC = [[WYTypeQueryViewController alloc] init];
        
        queryVC.start = YES;
        
        queryVC.name = mode.shareTitle;
        
        queryVC.typeID = mode.shopId;
        
        [self.navigationController pushViewController:queryVC animated:YES];
    };
}

/** 中部第2块的 商品详情文字信息的 WYProductTableView */
- (void)twoCenterAddTableViewDataArray:(NSArray *)dataArray {
    
    WYProductTableView *tableView = [[WYProductTableView alloc] initWithFrame:(CGRectMake(0, VIEW_WIDTH + 251, VIEW_WIDTH, 358)) style:(UITableViewStyleGrouped)];
    tableView.dataArray = dataArray;
    [self.centerScroll addSubview:tableView];
    self.twoTableView = tableView;
    
}

/** 中部第3块的 商品详情图片信息的 WYImageDetailsView */
- (void)imageAddViewPhotoArray:(NSArray *)photoArray height:(CGFloat)height {
    
    CGFloat scale = height / 667.0 < 667 / height ? height / 667.0 : 667 / height;
    
    WYImageDetailsView *imageView = [[WYImageDetailsView alloc] initWithFrame:(CGRectMake(0, 358 + 251 +VIEW_WIDTH, VIEW_WIDTH, VIEW_HEIGHT * scale * photoArray.count)) photoArray:photoArray];
    [self.centerScroll addSubview:imageView];
    self.imageDetailsView = imageView;
}

/** 底部商品评分部分的视图 */
- (void)goodsScoreBottomViewDataArray:(NSArray *)dataArray {
    
    WYGoodsScoreView *scoreView = [[WYGoodsScoreView alloc] initWithFrame:(CGRectMake(0, CGRectGetMaxY(self.imageDetailsView.frame), VIEW_WIDTH, 130)) dataArray:dataArray];
    [self.centerScroll addSubview:scoreView];
    
    [self.centerScroll setContentSize:(CGSizeMake(VIEW_WIDTH, CGRectGetMaxY(scoreView.frame) + 10))];
}

- (void)goodsScoreBottomView {
    
    WYGoodsScoreView *scoreView = [[WYGoodsScoreView alloc] initWithFrame:(CGRectMake(0, CGRectGetMaxY(self.imageDetailsView.frame), self.view.frame.size.width, 130))];
    [self.centerScroll addSubview:scoreView];
    self.goodsScoreView = scoreView;
    
    [self.centerScroll setContentSize:(CGSizeMake(VIEW_WIDTH, CGRectGetMaxY(scoreView.frame) + 10))];
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
