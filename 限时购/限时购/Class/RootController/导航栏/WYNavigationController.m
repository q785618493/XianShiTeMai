//
//  WYNavigationController.m
//  限时购
//
//  Created by ma c on 16/5/26.
//  Copyright © 2016年 WY. All rights reserved.
//

#import "WYNavigationController.h"


@interface WYNavigationController ()

@end

@implementation WYNavigationController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


+ (void)initialize {
    
    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedIn:self, nil];
    
    NSDictionary *dic = @{NSFontAttributeName : [UIFont boldSystemFontOfSize:18],
                          NSForegroundColorAttributeName : [UIColor blackColor]};
    
    [bar setTitleTextAttributes:dic];
    
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
