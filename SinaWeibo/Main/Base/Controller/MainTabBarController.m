//
//  MainTabBarController.m
//  SinaWeibo
//
//  Created by 嗷嗷叫 on 2017/5/24.
//  Copyright © 2017年 嗷嗷叫aoaojiao. All rights reserved.
//

#import "MainTabBarController.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController
-(instancetype)init {
    self = [super init];
    if (self) {
        //使用数组保持文件名
        NSArray *fileNames = @[@"Home",
                               @"Message",
                               @"Profile",
                               @"Discover",
                               @"More"];
        NSMutableArray *mArray = [[NSMutableArray alloc]init];
        //分别读取5个storyBoard
        for (NSString *storyBoardName in fileNames) {
            //文件读取
            UIStoryboard *sb = [UIStoryboard storyboardWithName:storyBoardName bundle:[NSBundle mainBundle]];
            //从读取到的文件中 获取控制器
            UIViewController *viewController = [sb instantiateInitialViewController];
            [mArray addObject:viewController];
        }
        //将读取到的视图控制器交给标签控制器处理
        self.viewControllers = [mArray copy];
        
    }
    return self;
}

//自定义标签栏
-(void)customTabBar {
//    1.移除系统自带的UITabBarButton
    for (UIView *tabBarButton in self.tabBar.subviews) {
        //判断获取到的子视图是否是UITabBarButton的类对象
        Class buttonClass = NSClassFromString(@"UITabBarButton");
        
        if ([tabBarButton isKindOfClass:buttonClass]) {
            //移除
            [tabBarButton removeFromSuperview];
        }
    }
}
//视图即将渲染
-(void)viewWillAppear:(BOOL)animated {
    [self customTabBar];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
