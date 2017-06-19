//
//  BaseNavigationController.m
//  SinaWeibo
//
//  Created by 嗷嗷叫 on 2017/6/19.
//  Copyright © 2017年 嗷嗷叫aoaojiao. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    //mask_titlebar.png mask_titlebar64.png
    CGFloat systemVersion = kSystemVersion;
    if (systemVersion >=7.0) {
        UIImage *image = [UIImage imageNamed:@"Skins/bluemoon/mask_titlebar64.png"];
        [self.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    }else {
        UIImage *image = [UIImage imageNamed:@"Skins/bluemoon/mask_titlebar64.png"];
        [self.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    }
    NSDictionary *dic = @{
                          NSFontAttributeName : [UIFont systemFontOfSize:20],
                          NSForegroundColorAttributeName : [UIColor whiteColor]
                          };
    self.navigationBar.titleTextAttributes = dic;
    self.navigationBar.translucent = NO;
    
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
