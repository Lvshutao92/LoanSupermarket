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
    
    if (self.childViewControllers.count>0) {
        UIButton *but=[ZCControl createButtonWithFrame:CGRectMake(0, 19/2, 25, 25) ImageName:@"fanhui" Target:self Action:@selector(back)];
        UIView *vie = [ZCControl viewWithFrame:CGRectMake(0, 0, 44, 44) viewColor:nil];
        [vie addSubview:but];
        viewController.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:vie];
        viewController.hidesBottomBarWhenPushed=YES;
    }
    
    
    [super pushViewController:viewController animated:animated];
    
}


- (void)back

{
    [self popViewControllerAnimated:YES];
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
