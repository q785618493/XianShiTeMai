//
//  WYBaseViewController.m
//  限时购
//
//  Created by ma c on 16/5/26.
//  Copyright © 2016年 WY. All rights reserved.
//

#import "WYBaseViewController.h"

@interface WYBaseViewController ()

@end

@implementation WYBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 GET 网络请求
 */
- (void)GETHttpRequestUrl:(NSString *)url
                      dic:(NSDictionary *)dic
             successBlock:(HttpSuccessBlock)requestSuccess
               errorBlock:(HttpErrorBlock)requestError {
    
    WS(weakSelf);
    
    /**
     显示等待动画
     */
    [JPRefreshView showJPRefreshFromView:weakSelf.view];
    
    [ZJPBaseHttpTool getWithPath:url params:dic success:^(id JSON) {
        
        if (requestSuccess) {
            requestSuccess(JSON);
        }
        
        /**
         移除等待动画
         */
        [JPRefreshView removeJPRefreshFromView:weakSelf.view];
        
    } failure:^(NSError *error) {
        
        if (requestError) {
            requestError(error);
        }
        [JPRefreshView removeJPRefreshFromView:weakSelf.view];
    }];
}


/**
 POST 网络请求
 */
- (void)POSTHttpRequestUrl:(NSString *)url
                       dic:(NSDictionary *)dic
              successBlock:(HttpSuccessBlock)requestSuccess
                errorBlock:(HttpErrorBlock)requestError {
    
    WS(weakSelf);
    
    [JPRefreshView showJPRefreshFromView:weakSelf.view];
    
    [ZJPBaseHttpTool postWithPath:url params:dic success:^(id JSON) {
        
        if (requestSuccess) {
            requestSuccess(JSON);
        }
        
        [JPRefreshView removeJPRefreshFromView:weakSelf.view];
    } failure:^(NSError *error) {
        
        if (requestError) {
            requestError(error);
        }
        [JPRefreshView removeJPRefreshFromView:weakSelf.view];
    }];
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
