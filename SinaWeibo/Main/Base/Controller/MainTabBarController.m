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
    UIImageView *_arrowImageView;
}
@end

@implementation MainTabBarController


-(instancetype)init {
    self = [super init];
    if (self) {

        NSArray *fileNames = @[@"Home",
                               @"Message",
                               @"Profile",
                               @"Discover",
                               @"More"];
        NSMutableArray *mArray = [[NSMutableArray alloc]init];

        for (NSString *storyBoardName in fileNames) {

            UIStoryboard *sb = [UIStoryboard storyboardWithName:storyBoardName bundle:[NSBundle mainBundle]];

            UIViewController *viewController = [sb instantiateInitialViewController];
            [mArray addObject:viewController];
        }

        self.viewControllers = [mArray copy];
        [self customTabBar];
    }
    return self;
}


-(void)customTabBar {

    for (UIView *tabBarButton in self.tabBar.subviews) {

        Class buttonClass = NSClassFromString(@"UITabBarButton");
        
        if ([tabBarButton isKindOfClass:buttonClass]) {

            [tabBarButton removeFromSuperview];
        }
    }
   
    
    CGFloat buttonWidth = [UIScreen mainScreen].bounds.size.width / 5;

    for (int i=0; i<5; i++) {
        CGRect buttonFrame = CGRectMake(i*buttonWidth, 0, buttonWidth, 49);

        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = buttonFrame;
        [self.tabBar addSubview:button];
        NSString *imageName = [NSString stringWithFormat:@"Skins/bluemoon/home_tab_icon_%i.png",i+1];
        UIImage *image = [UIImage imageNamed:imageName];
        [button setImage:image forState:UIControlStateNormal];
        [button addTarget:self action:@selector(barButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = i;
    }
    

    UIImage *image = [UIImage imageNamed:@"Skins/bluemoon/mask_navbar.png"];
    [self.tabBar setBackgroundImage:image];

    self.tabBar.shadowImage = [[UIImage alloc] init];

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
