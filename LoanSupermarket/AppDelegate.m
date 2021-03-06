//
//  AppDelegate.m
//  LoanSupermarket
//
//  Created by apple on 2019/3/18.
//  Copyright © 2019年 apple. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self loadKeboardManage];
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    MainTabbarViewController * tabBar = [[MainTabbarViewController alloc]init];
    self.window.rootViewController = tabBar;
    [self.window makeKeyAndVisible];
    
    [UITabBar appearance].translucent = NO;
    
    return YES;
}
- (void)loadKeboardManage
{
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    manager.enable = YES;
    manager.shouldResignOnTouchOutside =YES;
    manager.enableAutoToolbar = YES;// 控制是否显示键盘上的工具条
    manager.keyboardDistanceFromTextField = 10.0f;
    manager.toolbarManageBehaviour = IQAutoToolbarBySubviews;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state. 红玫瑰 百合 康乃馨 香槟玫瑰 粉玫瑰 绣球 蓝色妖姬 向日葵 满天星 混搭花束 玫瑰礼盒 七彩玫瑰 洋桔梗 雏菊 进口花 白玫瑰 蝴蝶兰 非洲菊
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
