//
//  MainNavigationViewController.m
//  jie
//
//  Created by apple on 2019/3/18.
//  Copyright © 2019年 魏魏莹. All rights reserved.
//

#import "MainNavigationViewController.h"

@interface MainNavigationViewController ()

@end

@implementation MainNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
//        [self.navigationBar setBarTintColor:RGBACOLOR(132, 214, 67, 1)];
//        [self.navigationBar setTintColor:[UIColor whiteColor]];
//        self.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
        //        if( ([[[UIDevice currentDevice] systemVersion] doubleValue]>=7.0))
        //        {
        //            self.navigationController.navigationBar.translucent = NO;
        //        }
    }
    return self;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0)
    {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
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
