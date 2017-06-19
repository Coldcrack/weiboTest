//
//  HomeViewController.m
//  SinaWeibo
//
//  Created by 嗷嗷叫 on 2017/5/24.
//  Copyright © 2017年 嗷嗷叫aoaojiao. All rights reserved.
//

#import "HomeViewController.h"
#import "AppDelegate.h"
@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
//登录微博操作
- (IBAction)loginWeibo:(id)sender {
    //拿到APPDelegate对象
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    //拿到sinaweibo对象
    SinaWeibo *weibo = delegate.sinaWeibo;
    //打开登录界面，显示WebView
    [weibo logIn];
    
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
