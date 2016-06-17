//
//  WYMeViewController.m
//  限时购
//
//  Created by ma c on 16/5/26.
//  Copyright © 2016年 WY. All rights reserved.
//

#import "WYMeViewController.h"

#import "WYLoginViewController.h"
#import "WYRegisterViewController.h"

#import "WYMeTableView.h"
#import "WYMeHeaderView.h"
#import "WYMeModel.h"

#define INFO_PATH [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:@"infoArray.data"]

#define XSG_USER_DEFAULTS [NSUserDefaults standardUserDefaults]

static NSString *userInfo = @"userInfo";

static NSString *isStatus = @"status";

@interface WYMeViewController () <WYLoginViewControllerDelegate>

/**
 保存数据的数组
 */
@property (strong, nonatomic) NSMutableArray *dataArray;

/**
 展示界面的 WYMeTableView
 */
@property (strong, nonatomic) WYMeTableView *meTableView;

/** 加载登录、注册顶部视图*/
@property (strong, nonatomic) WYMeHeaderView *topLoginView;

/** 加载用户成功登录后的顶部视图*/
@property (strong, nonatomic) WYMeHeaderView *topUserView;

@end

@implementation WYMeViewController

/**
 懒加载保存数据的数组
 */
- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        
        //解档数组
        _dataArray = [NSKeyedUnarchiver unarchiveObjectWithFile:INFO_PATH];
        
        if (!_dataArray) {
            NSArray *pathArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"MeModel.plist"] ofType:nil]];
            
            NSMutableArray *muArray = [NSMutableArray arrayWithCapacity:pathArray.count];
            
            for (NSDictionary *dic in pathArray) {
                WYMeModel *model = [WYMeModel meModelDic:dic];
                
                [muArray addObject:model];
            }
            _dataArray = muArray;
        }
        
    }
    return _dataArray;
}

/**
 懒加载展示界面的 WYMeTableView
 */
- (WYMeTableView *)meTableView {
    
    if (!_meTableView) {
        _meTableView = [[WYMeTableView alloc] initWithFrame:(CGRectMake(0, 64, VIEW_WIDTH, VIEW_HEIGHT - 64 - 49)) style:(UITableViewStylePlain)];
        _meTableView.dataArray = self.dataArray;
    }
    return _meTableView;
}

/** 懒加载登录、注册顶部视图*/
- (WYMeHeaderView *)topLoginView {
    if (!_topLoginView) {
        _topLoginView = [WYMeHeaderView showMeHeaderViewAddWidth:VIEW_WIDTH height:125];
    }
    return _topLoginView;
}

/** 懒加载用户成功登录后的顶部视图*/
- (WYMeHeaderView *)topUserView {
    if (!_topUserView) {
        _topUserView = [WYMeHeaderView meHeaderViewAddWidth:VIEW_WIDTH height:125];
    }
    return _topUserView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /**
     加载展示视图
     */
    [self showMeTableView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    BOOL status = [XSG_USER_DEFAULTS boolForKey:isStatus];
    
    NSDictionary *userDic = [XSG_USER_DEFAULTS objectForKey:userInfo];
    
    if (status) {
        [self.meTableView setTableHeaderView:self.topUserView];
        self.topUserView.meberDic = userDic;
    }
    else {
        
        [self.meTableView setTableHeaderView:self.topLoginView];
    }
    
    WS(weakSelf);
    /** 登录按钮 跳转登录界面*/
    weakSelf.topLoginView.loginBlock = ^() {
        WYLoginViewController *loginVC = [[WYLoginViewController alloc] init];
        [loginVC setDelegate:weakSelf];
        [loginVC setHidesBottomBarWhenPushed:YES];
        [weakSelf.navigationController pushViewController:loginVC animated:YES];
    };
    
    /** 注册按钮 跳转注册界面*/
    weakSelf.topLoginView.registerBlock = ^() {
        WYRegisterViewController *registerVC = [[WYRegisterViewController alloc] init];
        [registerVC setHidesBottomBarWhenPushed:YES];
        [weakSelf.navigationController pushViewController:registerVC animated:YES];
    };
    
}

/**
 加载展示视图
 */
- (void)showMeTableView {
    [self.view addSubview:self.meTableView];
    
//    WYMeModel *model = [self.dataArray lastObject];
//    
//    if (model.isStatus) {
//        
//        [self.meTableView setTableHeaderView:self.topUserView];
//    }
//    else {
//        
//        [self.meTableView setTableHeaderView:self.topLoginView];
//    }
    
    WS(weakSelf);
    
//    weakSelf.meTableView.loginBtnAction = ^() {
//        
//        WYLoginViewController *loginVC = [[WYLoginViewController alloc] init];
//        [loginVC setDelegate:weakSelf];
//        [loginVC setHidesBottomBarWhenPushed:YES];
//        [weakSelf.navigationController pushViewController:loginVC animated:YES];
//                                          
//    };
    
//    weakSelf.meTableView.registerBtnAction = ^() {
//        
//        WYRegisterViewController *registerVC = [[WYRegisterViewController alloc] init];
//        [registerVC setHidesBottomBarWhenPushed:YES];
//        [weakSelf.navigationController pushViewController:registerVC animated:YES];
//    };
    
    /** 用户登录成功后 用户信息按钮跳转*/
    weakSelf.topUserView.userBlock = ^() {
        NSLog(@"用户登录成功后 用户信息按钮跳转");
    };
    
    weakSelf.meTableView.cellRow = ^(NSInteger cellRow) {
        
    };
}


#pragma make-
#pragma make- WYLoginViewControllerDelegate
- (void)loginView:(WYLoginViewController *)loginview judgeStatus:(BOOL)status couponModel:(WYMeModel *)couponModel moneyModel:(WYMeModel *)moneyModel userDic:(NSDictionary *)userDic {
    
    [self.topLoginView hiddenDeleteView];
    [self.meTableView setTableHeaderView:self.topUserView];
    self.topUserView.meberDic = userDic;
    
    [self.dataArray addObject:couponModel];
    [self.dataArray addObject:moneyModel];
    [self.meTableView reloadData];
    
    [XSG_USER_DEFAULTS setObject:userDic forKey:userInfo];
    [XSG_USER_DEFAULTS setBool:status forKey:isStatus];
    
    [NSKeyedArchiver archiveRootObject:self.dataArray toFile:INFO_PATH];
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

