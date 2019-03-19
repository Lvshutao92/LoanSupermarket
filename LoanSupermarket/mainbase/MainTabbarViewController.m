//
//  MainTabbarViewController.m
//  jie
//
//  Created by apple on 2019/3/18.
//  Copyright © 2019年 魏魏莹. All rights reserved.
//

#import "MainTabbarViewController.h"
#import "MineViewController.h"
#import "CreditCardViewController.h"
#import "LoanViewController.h"
#import "HomePageViewController.h"


@interface MainTabbarViewController ()

@end

@implementation MainTabbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (instancetype)init {
    if (self = [super init]) {
        HomePageViewController *oneVc = [[HomePageViewController alloc]init];
        MainNavigationViewController *aaa = [[MainNavigationViewController alloc]initWithRootViewController:oneVc];
        aaa.tabBarItem.image = [UIImage imageNamed:@"ic_icon_1_normal"];
        aaa.tabBarItem.title = @"首页";
        aaa.tabBarItem.selectedImage = [UIImage imageNamed:@"ic_icon_1_pressed"];
        
        LoanViewController *zeroVc = [[LoanViewController alloc]init];
        //MainNavigationViewController *ccc = [[MainNavigationViewController alloc]initWithRootViewController:zeroVc];
        zeroVc.tabBarItem.image = [UIImage imageNamed:@"ic_icon_2_normal"];
        zeroVc.title = @"贷款大全";
        zeroVc.tabBarItem.selectedImage = [UIImage imageNamed:@"ic_icon_2_pressed"];
        
        CreditCardViewController *credVc = [[CreditCardViewController alloc]init];
        MainNavigationViewController *ddd = [[MainNavigationViewController alloc]initWithRootViewController:credVc];
        ddd.tabBarItem.image = [UIImage imageNamed:@"ic_icon_4_normal"];
        credVc.title = @"信用卡";
        ddd.tabBarItem.selectedImage = [UIImage imageNamed:@"ic_icon_4_pressed"];
        
        
        
        MineViewController *twpVc = [[MineViewController alloc]init];
        MainNavigationViewController *bbb = [[MainNavigationViewController alloc]initWithRootViewController:twpVc];
        bbb.tabBarItem.image = [UIImage imageNamed:@"ic_icon_5_normal"];
        bbb.tabBarItem.title = @"我的";
        bbb.tabBarItem.selectedImage = [UIImage imageNamed:@"ic_icon_5_pressed"];
        
        self.tabBar.tintColor = RGBACOLOR(41, 147, 252, 1);
        self.viewControllers = @[aaa,zeroVc,ddd,bbb];
    }
    return self;
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
