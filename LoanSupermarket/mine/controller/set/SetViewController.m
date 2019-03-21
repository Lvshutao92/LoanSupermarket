//
//  SetViewController.m
//  LoanSupermarket
//
//  Created by 吕书涛 on 2019/3/20.
//  Copyright © 2019 apple. All rights reserved.
//

#import "SetViewController.h"

@interface SetViewController ()
@property(nonatomic,strong)UIButton *logOutBtn;
@end

@implementation SetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.logOutBtn];
    
    [ZCControl setJianBianSeGreay:self.logOutBtn];
    // Do any additional setup after loading the view.
}


- (void)clickLogOut{
    [GlobleStting setUsername:@""];
    [GlobleStting setPassword:@""];
    
    [SVProgressHUD showSuccessWithStatus:@"退出成功"];
    [SVProgressHUD dismissWithDelay:1 completion:^{
        [self.navigationController popViewControllerAnimated:YES];
    }];
}

- (UIButton *)logOutBtn{
    if (!_logOutBtn) {
        _logOutBtn = [ZCControl createButtonNormalFrame:CGRectMake(10, 200, SCREEN_WIDTH-20, 50) Target:self Action:@selector(clickLogOut) Title:@"退出登录" TitleColor:UIColor.whiteColor Font:16 BackGColor:nil];
        LRViewBorderRadius(_logOutBtn, 5, 0, UIColor.clearColor);
        
    }
    return _logOutBtn;
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
