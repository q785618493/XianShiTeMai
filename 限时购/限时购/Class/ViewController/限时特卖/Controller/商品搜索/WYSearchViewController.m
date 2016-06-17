//
//  WYSearchViewController.m
//  限时购
//
//  Created by ma c on 16/5/31.
//  Copyright © 2016年 WY. All rights reserved.
//

#import "WYSearchViewController.h"

@interface WYSearchViewController ()<UISearchBarDelegate>

/**
 搜索框
 */
//@property (strong, nonatomic) UISearchController *searchVC;

/**
添加搜索框
 */
@property (strong, nonatomic) UISearchBar *searchBar;

@end

@implementation WYSearchViewController

//- (UISearchController *)searchVC {
//    if (!_searchVC) {
//        _searchVC = [[UISearchController alloc] initWithSearchResultsController:nil];
//        [_searchVC setSearchResultsUpdater:self];
//        [_searchVC.searchBar setFrame:(CGRectMake(0, 200, 320, 40))];
//        [_searchVC setHidesBottomBarWhenPushed:YES];
//        [_searchVC setDimsBackgroundDuringPresentation:NO];
//        [_searchVC.searchBar setSearchBarStyle:(UISearchBarStyleDefault)];
//        [_searchVC.searchBar setKeyboardType:(UIKeyboardTypeDefault)];
//    }
//    return _searchVC;
//}

- (UISearchBar *)searchBar {
    if (!_searchBar) {
        _searchBar = [[UISearchBar alloc] initWithFrame:(CGRectMake(0, 0, 200, 40))];
        [_searchBar setDelegate:self];
        [_searchBar setSearchBarStyle:(UISearchBarStyleDefault)];
        [_searchBar setKeyboardType:(UIKeyboardTypeDefault)];
        [_searchBar setPlaceholder:[NSString stringWithFormat:@"没事干的占位符"]];
    }
    return _searchBar;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self.navigationItem setTitleView:self.searchBar];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma make- UISearchResultsUpdating
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    
    NSString *text = searchController.searchBar.text;
    
    NSLog(@"===%@",text);
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.searchBar resignFirstResponder];
    
}

#pragma make- UISearchBarDelegate


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
