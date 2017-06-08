//
//  MainTabBarController.m
//  SinaWeibo
//
//  Created by 嗷嗷叫 on 2017/5/24.
//  Copyright © 2017年 嗷嗷叫aoaojiao. All rights reserved.
//

#import "MainTabBarController.h"

@interface MainTabBarController ()
{
    UIImageView *_arrowImageView; //切换界面时，显示当前页面的标记
}
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
        [self customTabBar];
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
    //按钮宽度
    CGFloat buttonWidth = [UIScreen mainScreen].bounds.size.width / 5;
//    2.自定义创建标签栏按钮，并添加点击事件
    for (int i=0; i<5; i++) {
        CGRect buttonFrame = CGRectMake(i*buttonWidth, 0, buttonWidth, 49);
        //创建按钮对象
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = buttonFrame;
        [self.tabBar addSubview:button];
        NSString *imageName = [NSString stringWithFormat:@"Skins/bluemoon/home_tab_icon_%i.png",i+1];
        UIImage *image = [UIImage imageNamed:imageName];
        [button setImage:image forState:UIControlStateNormal];
        [button addTarget:self action:@selector(barButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = i;
    }
    
    //3.标签栏背景设定
    UIImage *image = [UIImage imageNamed:@"Skins/bluemoon/mask_navbar.png"];
    [self.tabBar setBackgroundImage:image];
    //标签栏阴影线
    self.tabBar.shadowImage = [[UIImage alloc] init];
    //4.点击选中的视图创建
    //home_bottom_tab_arrow.png
    _arrowImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, buttonWidth, 49)];
//    [self.tabBar addSubview:_arrowImageView];
    [self.tabBar insertSubview:_arrowImageView atIndex:0];
    _arrowImageView.image = [UIImage imageNamed:@"Skins/bluemoon/home_bottom_tab_arrow.png"];
    
}
-(void)barButtonAction:(UIButton *)button {
//    NSLog(@"点击一次");
    NSInteger tag = button.tag;
    if (tag>=0 && tag<self.viewControllers.count) {
        self.selectedIndex = tag;
    }
    //选中标记移动
    [UIView animateWithDuration:0.2 animations:^{
        _arrowImageView.center = button.center;
    }];
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
