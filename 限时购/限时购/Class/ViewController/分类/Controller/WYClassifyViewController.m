//
//  WYClassifyViewController.m
//  限时购
//
//  Created by ma c on 16/5/26.
//  Copyright © 2016年 WY. All rights reserved.
//

#import "WYClassifyViewController.h"
#import "WYSortModel.h"
#import "WYSortCollection.h"

#import "WYFaceModel.h"
#import "WYFaceCollection.h"

#import "WYTypeQueryViewController.h"

@interface WYClassifyViewController ()

/**
 功效专区的 CollectionView
 */
@property (weak, nonatomic) WYSortCollection *collSortView;

/**
 脸部专区和身体专区的 CollectionView
 */
@property (weak, nonatomic) WYFaceCollection *faceCollView;

/**
 保存网络请求数据的数组
 */
@property (strong, nonatomic) NSMutableArray *muFaceArray;

@end

@implementation WYClassifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _muFaceArray = [NSMutableArray array];
    
    /** 展示视图*/
    [self faceAddCollectionView];
    
    /**
     添加顶部的导航栏和搜索按钮
     */
    [self topAddNavView];
    
    /**
     分类区接口网络请求
     */
    [self httpGetClassfy];
    
    WS(weakSelf);
    
    /**
     面部专区的网络请求
     */
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [weakSelf httpGetFace];
    });
    
    
    /**
     身体专区的网络请求
     */
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [weakSelf httpGetBody];
    });
    
    /**
     品牌专区的网络请求
     */
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [weakSelf httpPostBrand];
    });
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 分类区接口网络请求
 */
- (void)httpGetClassfy {
    
    [self GETHttpRequestUrl:[NSString stringWithFormat:@"http://123.57.141.249:8080/beautalk/appBrandareatype/findBrandareatype.do"] dic:nil successBlock:^(id JSON) {
        
        NSArray *dataArray = JSON;
        
        if (dataArray.count > 0) {
            
            NSMutableArray *muArray = [NSMutableArray arrayWithCapacity:dataArray.count];
            
            for (NSDictionary *dic in dataArray) {
                WYSortModel *model = [[WYSortModel alloc] initWithDictionary:dic];
                [muArray addObject:model];
            }
            
            [_muFaceArray addObject:muArray];
        }
        
    } errorBlock:^(NSError *error) {
        NSLog(@"=%s  \n=%@",__func__,error);
    }];
    

}

/**
 面部专区的网络请求
 */
- (void)httpGetFace {
    
    [self GETHttpRequestUrl:[NSString stringWithFormat:@"http://123.57.141.249:8080/beautalk/appBrandarea/asianBrand.do"] dic:nil successBlock:^(id JSON) {
        
        NSArray *dataArray = JSON;
        
        if (dataArray.count > 0) {
            
            NSMutableArray *muArray = [NSMutableArray arrayWithCapacity:dataArray.count];
            
            for (NSDictionary *dic in dataArray) {
                WYFaceModel *model = [[WYFaceModel alloc] initWithDictionary:dic];
                [muArray addObject:model];
            }
            
            [_muFaceArray addObject:muArray];
            
        }
        
    } errorBlock:^(NSError *error) {
        NSLog(@"==%s  \n==%@",__func__,error);
    }];

}

/**
 身体专区的网络请求
 */
- (void)httpGetBody {
    
    [self GETHttpRequestUrl:[NSString stringWithFormat:@"http://123.57.141.249:8080/beautalk/appBrandarea/europeanBrand.do"] dic:nil successBlock:^(id JSON) {
        
        NSArray *dataArray = JSON;
        
        if (dataArray.count > 0) {
            
            NSMutableArray *muArray = [NSMutableArray arrayWithCapacity:dataArray.count];
            
            for (NSDictionary *dic in dataArray) {
                WYFaceModel *model = [[WYFaceModel alloc] initWithDictionary:dic];
                [muArray addObject:model];
            }
            
            [_muFaceArray addObject:muArray];
        }
        
    } errorBlock:^(NSError *error) {
        NSLog(@"===%s  \n===%@",__func__,error);
    }];
    
}

/**
 品牌专区的网络请求
 */
- (void)httpPostBrand {
    WS(weakSelf);
    
    [weakSelf GETHttpRequestUrl:[NSString stringWithFormat:@"http://123.57.141.249:8080/beautalk/appBrandareanew/findBrandareanew.do"] dic:nil successBlock:^(id JSON) {
        
        NSArray *array = JSON;
        
        if (array.count > 0) {
            
            NSMutableArray *muArray = [NSMutableArray arrayWithCapacity:array.count];
            
            for (NSDictionary *dic in array) {
                
                WYFaceModel *model = [[WYFaceModel alloc] initWithDictionary:dic];
                [muArray addObject:model];
            }
            
            [_muFaceArray addObject:muArray];
        }
        
        weakSelf.faceCollView.faceArray = _muFaceArray;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.faceCollView reloadData];
        });
        
    } errorBlock:^(NSError *error) {
        NSLog(@"====%s  \n====%@",__func__,error);
    }];
}

/**
 加载特效专区的 CollectionView 展示视图,传递数据
 */
- (void)setUpAddCollectionViewArray:(NSArray *)array {
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:(UICollectionViewScrollDirectionVertical)];
    
    WYSortCollection *sortCollView = [[WYSortCollection alloc] initWithFrame:(CGRectMake(0, 64, VIEW_WIDTH, VIEW_WIDTH * 0.5 + 40)) collectionViewLayout:flowLayout];
    sortCollView.sortArray = array;
    [self.view addSubview:sortCollView];
    self.collSortView = sortCollView;
}


/**
 加载面部专区的 CollectionView 展示视图,传递数据
 */
- (void)faceAddCollectionView {
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:(UICollectionViewScrollDirectionVertical)];
    
    WYFaceCollection *collView = [[WYFaceCollection alloc] initWithFrame:(CGRectMake(0, 64, VIEW_WIDTH, VIEW_HEIGHT - 64 - 49)) collectionViewLayout:flowLayout];
    [self.view addSubview:collView];
    
    self.faceCollView = collView;
    
    WS(weakSelf);
    
    collView.cellRow = ^(NSInteger section, NSInteger row) {
        
        WYTypeQueryViewController *typeVC = [[WYTypeQueryViewController alloc] init];
        
        if (0 == section) {
            
            WYSortModel *model = _muFaceArray[section][row];
            typeVC.start = NO;
            typeVC.typeID = model.goodsType;
            typeVC.name = model.goodsTypeName;
            
        } else {
            
            WYFaceModel *model = _muFaceArray[section][row];
            typeVC.start = YES;
            typeVC.typeID = model.shopId;
            typeVC.name = model.commodityText;
        }
        
        [typeVC setHidesBottomBarWhenPushed:YES];
        
        [weakSelf.navigationController pushViewController:typeVC animated:YES];
    };
}

/**
 添加顶部的导航栏和搜索按钮
 */
- (void)topAddNavView {
    UIButton *searchBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [searchBtn setFrame:(CGRectMake(17, 27, VIEW_WIDTH - 17 * 2, 30))];
    [searchBtn setBackgroundColor:RGB(228, 229, 231)];
    [searchBtn.layer setMasksToBounds:YES];
    [searchBtn.layer setCornerRadius:5];
    [searchBtn setTitle:[NSString stringWithFormat:@"🔍商品名 / 功效 / 品牌"] forState:(UIControlStateNormal)];
    [searchBtn setTitleColor:RGB(147, 147, 151) forState:(UIControlStateNormal)];
    [searchBtn addTarget:self action:@selector(btnTouchActionSearch:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.navigationItem setTitleView:searchBtn];
}
/**
 搜索按钮点击事件
 */
- (void)btnTouchActionSearch:(UIButton *)searchBtn {
    
    NSLog(@"====搜索222");
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
