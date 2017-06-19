//
//  AppDelegate.m
//  SinaWeibo
//
//  Created by 嗷嗷叫 on 2017/5/24.
//  Copyright © 2017年 嗷嗷叫aoaojiao. All rights reserved.
//

#import "AppDelegate.h"
#import "MainTabBarController.h"
#define kAccessTokenKey @"kAccessTokenKey"
#define kUserIDKey @"kUserIDKey"
#define kExpirationDateKey @"kExpirationDateKey"
#define kAuthDataKey @"kAuthDataKey"
@interface AppDelegate ()<SinaWeiboDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //创建Window
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    //创建TabBarController
    MainTabBarController *main = [[MainTabBarController alloc]init];
    self.window.rootViewController = main;
    //初始化新浪微博
    [self initSinaWeibo];
    //判断是否已登录
////    BOOL isLogin = [self readAuthData];
//    if (isLogin) {
//        NSLog(@"微博已登录：%@",_sinaWeibo.accessToken);
//    } else {
//        [_sinaWeibo logIn];
//    }
    return YES;
}

-(void)initSinaWeibo {
    //新浪微博初始化
    _sinaWeibo = [[SinaWeibo alloc]initWithAppKey:kAppKey   //app识别符
                                        appSecret:kAppSecret   //APP密码
                                   appRedirectURI:kAppRedirectURL   //回调页面
                                       andDelegate:self];     //代理对象  用来处理登录结果
}
#pragma mark - SinaWeibo Login
//登录成功
-(void)sinaweiboDidLogIn:(SinaWeibo *)sinaweibo {
    
//保存用户数据
    [self saveAuthData];
    
}
//登录取消 登陆过程中，点击了右上角的关 闭
-(void)sinaweiboLogInDidCancel:(SinaWeibo *)sinaweibo {
    NSLog(@"登录取消");
}
//注销
-(void)sinaweiboDidLogOut:(SinaWeibo *)sinaweibo {
    
}
//登录失败
-(void)sinaweibo:(SinaWeibo *)sinaweibo logInDidFailWithError:(NSError *)error {
    NSLog(@"登录失败Error:%@",error);
}
#pragma mark -登录数据本地持久化
-(void)saveAuthData {
    //获取登录后返回的用户数据
    //用户令牌
    NSString *accessToken = _sinaWeibo.accessToken;
    //User ID
    NSString *userID =_sinaWeibo.userID;
    //令牌的有效期限
    NSDate *date = _sinaWeibo.expirationDate;
    //将数据打包成一个字典
    NSMutableDictionary *authDataDic = [[NSMutableDictionary alloc]init];
    [authDataDic setObject:accessToken forKey:kAccessTokenKey];
    [authDataDic setObject:userID forKey:kUserIDKey];
    [authDataDic setObject:date forKey:kExpirationDateKey];
    //使用NSUserDefaults来保存用户数据
    NSUserDefaults *userDef = [NSUserDefaults standardUserDefaults];
    [userDef setObject:[authDataDic copy] forKey:kAuthDataKey];
    //将保存的数据同步到属性列表中
    [userDef synchronize];
    NSLog(@"%@",NSHomeDirectory());
}
-(BOOL)readAuthData {
    NSUserDefaults *userDef = [NSUserDefaults standardUserDefaults];
    NSDictionary *authDatadic = [userDef objectForKey:kAuthDataKey];
    if (authDatadic !=nil) {
        if (authDatadic[kAccessTokenKey] !=nil && authDatadic[kAuthDataKey] !=nil &&authDatadic[kExpirationDateKey] !=nil) {
            NSLog(@"已登录，无需再次");
            _sinaWeibo.accessToken = authDatadic[kAccessTokenKey];
            _sinaWeibo.userID = authDatadic[kUserIDKey];
            _sinaWeibo.expirationDate = authDatadic[kExpirationDateKey];
            return YES;
        }else{
            [userDef removeObjectForKey:kAuthDataKey];
            return NO;
        }
    }else {
        return NO;
    }
    return YES;
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
