//
//  WYTabBarController.m
//  限时购
//
//  Created by ma c on 16/5/26.
//  Copyright © 2016年 WY. All rights reserved.
//

#import "WYTabBarController.h"
#import "WYNavigationController.h"

@interface WYTabBarController ()

/**
 读取 ViewControllerS.plist 文件里的视图控制器
 */
@property (weak, nonatomic) NSArray *vcArray;

@end

@implementation WYTabBarController

/**
 懒加载数据
 */
- (NSArray *)vcArray {
    if (!_vcArray) {
        
        NSArray *plistArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"ViewControllerS.plist" ofType:nil]];
        _vcArray = plistArray;
    }
    return _vcArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /**
     索引 用来记录
     */
    __block NSInteger index = 0;
    
//    [self.tabBar setHidden:YES];
    
    /**
     用来保存视图控制器的数组
     */
    NSMutableArray *muArray = [[NSMutableArray alloc] initWithCapacity:self.vcArray.count];
    
    /**
     遍历数组里的数据,创建标签栏,设置相应的属性
     */
    [self.vcArray enumerateObjectsUsingBlock:^(NSDictionary *dict, NSUInteger idx, BOOL * _Nonnull stop) {
        
        Class vcClass = NSClassFromString(dict[@"ViewController"]);
        
        UIViewController *controller = [[vcClass alloc] init];
        
        [controller.view setBackgroundColor:[UIColor whiteColor]];
        
        [controller.tabBarItem setImage:[UIImage imageWithModeImageName:dict[@"image"]]];
        
        [controller.tabBarItem setSelectedImage:[UIImage imageWithModeImageName:dict[@"seleImage"]]];
        
        controller.title = dict[@"title"];
        
        [controller.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : RGB(167, 167, 167)} forState:(UIControlStateNormal)];
        
        [controller.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : RGB(2, 184, 240)} forState:(UIControlStateSelected)];
        
        [controller setAutomaticallyAdjustsScrollViewInsets:NO];
        
        WYNavigationController *navVC = [[WYNavigationController alloc] initWithRootViewController:controller];
        
//        if (0 == index) {
//            [navVC.navigationBar setHidden:YES];
//        }
//        index ++;
        
        [muArray addObject:navVC];
        
    }];
    
    self.viewControllers = muArray;
    
    self.selectedIndex = 0;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
