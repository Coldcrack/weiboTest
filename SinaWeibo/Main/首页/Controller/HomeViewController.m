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
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//     Do any additional setup after loading the view.
    self.navigationItem.title = @"我的微博";
    _imageView.image = [UIImage imageNamed:@"Skins/bluemoon/avatar_default.png"];
    
    //结束通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeTheme:) name:kThemeChangedNotificationName object:nil];
}
-(void)changeTheme:(NSNotification *)noti {
    NSLog(@"%@",noti.userInfo);
}
-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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
