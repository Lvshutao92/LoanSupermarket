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
#import "HomeViewController.h"

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
        aaa.tabBarItem.image = [UIImage imageNamed:@"1"];
        aaa.tabBarItem.title = @"首页";
        aaa.tabBarItem.selectedImage = [UIImage imageNamed:@"01"];
        
        LoanViewController *zeroVc = [[LoanViewController alloc]init];
        MainNavigationViewController *ccc = [[MainNavigationViewController alloc]initWithRootViewController:zeroVc];
        ccc.tabBarItem.image = [UIImage imageNamed:@"2"];
        zeroVc.title = @"贷款大全";
        ccc.tabBarItem.selectedImage = [UIImage imageNamed:@"2"];
        
        CreditCardViewController *credVc = [[CreditCardViewController alloc]init];
        MainNavigationViewController *ddd = [[MainNavigationViewController alloc]initWithRootViewController:credVc];
        ddd.tabBarItem.image = [UIImage imageNamed:@"3"];
        credVc.title = @"信用卡";
        ddd.tabBarItem.selectedImage = [UIImage imageNamed:@"03"];
        
        
        
        MineViewController *twpVc = [[MineViewController alloc]init];
        MainNavigationViewController *bbb = [[MainNavigationViewController alloc]initWithRootViewController:twpVc];
        bbb.tabBarItem.image = [UIImage imageNamed:@"4"];
        twpVc.title = @"我的";
        bbb.tabBarItem.selectedImage = [UIImage imageNamed:@"04"];
        
        self.tabBar.tintColor = RGBACOLOR(0, 191, 255, 1);
        self.viewControllers = @[aaa,ccc,ddd,bbb];
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
