//
//  WYFlashSaleViewController.m
//  限时购
//
//  Created by ma c on 16/5/26.
//  Copyright © 2016年 WY. All rights reserved.
//

#import "WYFlashSaleViewController.h"
#import "TopRollView.h"
#import "WYFlashTable.h"
#import "WYSaleModel.h"
#import "WYNewsModel.h"
#import "UIImage+ImageSetting.h"
#import "WYProductViewController.h"
#import "WYSearchViewController.h"

static NSString *versionKey = @"CFBundleShortVersionString";

@interface WYFlashSaleViewController () <UIScrollViewDelegate>

/**
 首页广告轮播视图
 */
@property (weak, nonatomic) TopRollView *rollView;

/**
 首页广告轮播视图,图片数据的数组
 */
@property (weak, nonatomic) NSArray *adArray;

/**
 品牌团购数据的数组
 */
@property (weak, nonatomic) NSArray *grouponArray;

/**
 品牌团购的 tableView
 */
@property (weak, nonatomic) WYFlashTable *flashTable;

/**
 用来判断数据类型的
 */
@property (assign, nonatomic, getter = isJudge) BOOL judge;

/**
 引导页视图
 */
@property (weak, nonatomic) UIScrollView *guideScrollView;

/**
 引导视图的标记
 */
@property (weak, nonatomic) UIPageControl *pageControl;

@end

@implementation WYFlashSaleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /** 加载展示视图*/
    [self topAddRollView];
    
    /**
     判断用户是否第一次使用 app
     */
    [self userFirstMakeApp];
    
    /**
     添加导航右上角的搜索按钮
     */
    [self rightNavAddBtnItem];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    //从沙盒取出存储的上次软件版本号（上次使用的记录）
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *lastVersion = [defaults objectForKey:versionKey];
    
    //获取当前使用软件的版本号
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[versionKey];
    
    if ([lastVersion isEqualToString:currentVersion]) {
        
        /**
         显示导航
         */
        [self.navigationController.navigationBar setHidden:NO];
        /**
         显示标签栏
         */
        [self.tabBarController.tabBar setHidden:NO];
        
    } else {
       
        /**
         隐藏导航
         */
        [self.navigationController.navigationBar setHidden:YES];
        /**
         隐藏标签栏
         */
        [self.tabBarController.tabBar setHidden:YES];
    }
    
    
}

/**
 判断用户是否第一次使用 app
 */
- (void)userFirstMakeApp {

    //从沙盒取出存储的上次软件版本号（上次使用的记录）
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *lastVersion = [defaults objectForKey:versionKey];
    
    //获取当前使用软件的版本号
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[versionKey];
    
    if ([lastVersion isEqualToString:currentVersion]) {
        
        /**
         检查登录状态
         */
        [self checkLoginStatus];
        
    } else {
        /**
         添加引导页 视图
         */
        [self addGuideScrollView];
    }
    
}

/**
 添加引导页 视图
 */
- (void)addGuideScrollView {
    
    CGFloat width = self.view.frame.size.width;
    
    CGFloat height = self.view.frame.size.height;
    
    NSArray *imageArray = [NSArray arrayWithObjects:@"微商引导页1",@"微商引导页2",@"微商引导页3", nil];
    
    UIScrollView *guideView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    [guideView setShowsHorizontalScrollIndicator:NO];
    [guideView setShowsVerticalScrollIndicator:NO];
    [guideView setBounces:NO];
    [guideView setDelegate:self];
    [guideView setPagingEnabled:YES];
    [guideView setContentOffset:(CGPointZero)];
    [guideView setContentSize:(CGSizeMake(width * imageArray.count, height))];
    [self.view addSubview:guideView];
    self.guideScrollView = guideView;
    
    for (NSInteger i = 0; i < imageArray.count; i ++) {
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:(CGRectMake(i * width, 0, width, height))];
        [imageView setUserInteractionEnabled:YES];
        [imageView setImage:[UIImage imageNamed:imageArray[i]]];
        [guideView addSubview:imageView];
        
        if (i == imageArray.count - 1) {
            
            UIButton *useBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
            [useBtn setFrame:(CGRectMake(0, height - 35 * [MTool getScreenHightscale] * 2.8, 187 / 7.0 * 5.0 * [MTool getScreenWidthscale], 62 / 7.0 * 5 * [MTool getScreenHightscale]))];
            useBtn.center = CGPointMake(self.view.center.x, useBtn.center.y);
            [useBtn.layer setCornerRadius:10];
            [useBtn setImage:[UIImage imageNamed:@"立即体验"] forState:(UIControlStateNormal)];
            [useBtn addTarget:self action:@selector(btnTouchActionUse:) forControlEvents:(UIControlEventTouchUpInside)];
            [imageView addSubview:useBtn];
        }
    }
    
    UIPageControl *pageC = [[UIPageControl alloc] initWithFrame:(CGRectMake(0, height - 20, width, 10))];
    [pageC setNumberOfPages:imageArray.count];
    [pageC setCurrentPageIndicatorTintColor:[UIColor redColor]];
    [pageC setPageIndicatorTintColor:[UIColor whiteColor]];
    [pageC setCurrentPage:0];
    [pageC  setUserInteractionEnabled:NO];
    [self.view addSubview:pageC];
    self.pageControl = pageC;
}

/**
 立即体验按钮的点击事件
 */
- (void)btnTouchActionUse:(UIButton *)useBtn {
    
    /**
     移除引导视图
     */
    [self.guideScrollView removeFromSuperview];
    [self.pageControl removeFromSuperview];
    
    /**
     记录当前的版本号
     */
    //从沙盒取出存储的上次软件版本号（上次使用的记录）
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    //获取当前使用软件的版本号
    NSString *currKey = [NSBundle mainBundle].infoDictionary[versionKey];
    
    //存储本次使用软件的版本
    [defaults setObject:currKey forKey:versionKey];
    
    //马上进行存储，不写随机存储，可能无效
    [defaults synchronize];
    
    /**
     显示导航
     */
    [self.navigationController.navigationBar setHidden:NO];
    /**
     显示标签栏
     */
    [self.tabBarController.tabBar setHidden:NO];
    
    /**
     首页广告位轮播视图的网络请求
     */
    [self httpPostTopRoll];
    
    /**
     首页加载新品购的网络请求
     */
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self httpPostNews];
        
    });
}

/**
 检查登录状态
 */
- (void)checkLoginStatus {
    
    /**
     首页广告位轮播视图的网络请求
     */
    [self httpPostTopRoll];
    
    /**
     首页加载新品购的网络请求
     */
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self httpPostNews];
       
    });
}

/**
 首页广告位轮播视图的网络请求
 */
- (void)httpPostTopRoll {
    
    WS(weakSelf);
    [self GETHttpRequestUrl:[NSString stringWithFormat:@"http://123.57.141.249:8080/beautalk/appHome/appHome.do"] dic:nil successBlock:^(id JSON) {
        
        NSArray *dataArray = JSON;
        
        if (dataArray.count > 0) {
            
            NSMutableArray *muADArray = [[NSMutableArray alloc] initWithCapacity:dataArray.count];
            for (NSDictionary *dic in dataArray) {
                
                [muADArray addObject:dic[@"ImgView"]];
                
            }
            weakSelf.rollView.arrayImages = muADArray;
        }
        
    } errorBlock:^(NSError *error) {
        
        ZDYLOG(@"-%s-%@",__func__,error);
    }];
    
}

/**
 首页品牌团的网络请求
 */
- (void)httpPostBrandGroupon {
    
    WS(weakSelf);
    
    [self GETHttpRequestUrl:[NSString stringWithFormat:@"http://123.57.141.249:8080/beautalk/appActivity/appActivityList.do"] dic:nil successBlock:^(id JSON) {
        
        NSArray *brandArray = JSON;
        
        if (brandArray.count > 0) {
            
            NSMutableArray *modelMuArray = [[NSMutableArray alloc] initWithCapacity:brandArray.count];
            
            for (NSDictionary *dic in brandArray) {
                WYSaleModel *model = [[WYSaleModel alloc] initWithDictionary:dic];
                
                [modelMuArray addObject:model];
            }
            
            weakSelf.flashTable.judge = YES;
            weakSelf.flashTable.flashAray = modelMuArray;
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakSelf.flashTable reloadData];
            });
        }
        
        [weakSelf.flashTable.mj_header endRefreshing];
        [weakSelf.flashTable.mj_footer endRefreshing];
        
    } errorBlock:^(NSError *error) {
        
        ZDYLOG(@"---%s---%@",__func__,error);
    }];
    
}

/**
 首页加载新品购的网络请求
 */
- (void)httpPostNews {
    
    WS(weakSelf);
    [self GETHttpRequestUrl:[NSString stringWithFormat:@"http://123.57.141.249:8080/beautalk/appActivity/appHomeGoodsList.do"] dic:nil successBlock:^(id JSON) {
        
        NSArray *dataArray = JSON;
        
        if (dataArray.count > 0) {
            
            NSMutableArray *modelMuArray = [[NSMutableArray alloc] initWithCapacity:dataArray.count];
            
            for (NSDictionary *dic in dataArray) {
                
                WYNewsModel *model = [[WYNewsModel alloc] initWithDictionary:dic];
                
                [modelMuArray addObject:model];
            }
            
            weakSelf.grouponArray = modelMuArray;
            
            weakSelf.flashTable.judge = NO;
            weakSelf.flashTable.flashAray = weakSelf.grouponArray;
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakSelf.flashTable reloadData];
            });
            
        }
        
        [weakSelf.flashTable.mj_header endRefreshing];
        [weakSelf.flashTable.mj_footer endRefreshing];
    } errorBlock:^(NSError *error) {
        
        ZDYLOG(@"--%s--%@",__func__,error);
    }];
    
    /**
     显示导航
     */
//    [self.navigationController.navigationBar setHidden:NO];
    /**
     显示标签栏
     */
//    [self.tabBarController.tabBar setHidden:NO];
}

/**
 加载展示视图的方法
 */
- (void)topAddRollView {
    CGFloat scale = 232 / 667.0;
    TopRollView *rollView = [[TopRollView alloc] initWithFrame:(CGRectMake(0, 0, VIEW_WIDTH, VIEW_HEIGHT * scale))];
    self.rollView = rollView;
    
    __block WYFlashTable *tableView = [[WYFlashTable alloc] initWithFrame:(CGRectMake(0, 64, VIEW_WIDTH, VIEW_HEIGHT - 49 - 64)) style:(UITableViewStyleGrouped)];
    [tableView setTableHeaderView:rollView];
    [self.view addSubview:tableView];
    self.flashTable = tableView;
    
    tableView.cellRow = ^(NSInteger cellRow) {
        
        WYProductViewController *productVC = [[WYProductViewController alloc] init];
        
        id data = _grouponArray[cellRow];
        
        NSString *goodID;
        
        if ([data isKindOfClass:[WYNewsModel class]]) {
            
            WYNewsModel *model = data;
            productVC.start = YES;
            goodID = model.goodsId;
            productVC.countryImageUrl = model.countryImg;
            
        } else {
            productVC.start = NO;
            WYSaleModel *model = data;
            goodID = model.activityId;
        }

        productVC.goodsID = goodID;
        
        [productVC setHidesBottomBarWhenPushed:YES];
        
        [self.navigationController pushViewController:productVC animated:YES];
    };
    
    WS(weakSelf);
    
    tableView.btnTag = ^(NSInteger btnTag) {
        if (btnTag == 0) {
            
            [weakSelf httpPostNews];
        } else {
            
            [weakSelf httpPostBrandGroupon];
        }
            
    };
    
    tableView.newBlock = ^() {
        [weakSelf httpPostNews];
    };
    
    tableView.moreBlock = ^() {
        [weakSelf httpPostBrandGroupon];
    };
    
    tableView.cellBtnAction = ^(NSInteger btnTag) {
        ZDYLOG(@"=====Cell===%ld",btnTag);
    };
}

/**
 添加导航右上角的搜索按钮
 */
- (void)rightNavAddBtnItem {
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageWithModeImageName:[NSString stringWithFormat:@"限时特卖界面搜索按钮"]] style:(UIBarButtonItemStylePlain) target:self action:@selector(barBtnItemActionRight:)];
    
    [self.navigationItem setRightBarButtonItem:rightItem];
}

/**
 导航右上搜索按钮的点击事件
 */
- (void)barBtnItemActionRight:(UIBarButtonItem *)rightItem {
    
    WYSearchViewController *seaerchVC = [[WYSearchViewController alloc] init];
    
    [seaerchVC setHidesBottomBarWhenPushed:YES];
    
    [self.navigationController pushViewController:seaerchVC animated:YES];
    
}

#pragma make- UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    self.pageControl.currentPage = scrollView.contentOffset.x / self.view.frame.size.width;
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
