//
//  LoginViewController.m
//  jie
//
//  Created by apple on 2019/3/18.
//  Copyright © 2019年 魏魏莹. All rights reserved.
//

#import "LoginViewController.h"
#import "MobileLoginView.h"

@interface LoginViewController ()<PhoneCodeDelegate>
{
    NSString *phonetext;
    NSString *codetext;
}
@property(nonatomic,strong)MobileLoginView *mobileview;

@property(nonatomic,strong)UIButton *loginBtn;


@property(nonatomic,strong)SQCustomButton *changeLoginStyleBtn;

@end

@implementation LoginViewController
- (void)clickBack{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *backBtn = [ZCControl createButtonWithFrame:CGRectMake(10, kStatusBarHeight+15, 30, 30) ImageName:@"fanhui" Target:self Action:@selector(clickBack)];
    [self.view addSubview:backBtn];
    
    UILabel *lab = [ZCControl createLabelWithFrame:CGRectMake(10, kNavBarHAbove7+30, 90, 40) Font:20 Text:@"欢迎来到" textColor:UIColor.blackColor NSTextAlignment:NSTextAlignmentLeft];
    [self.view addSubview:lab];
    
    UIImageView *topimg = [ZCControl createImageViewWithFrame:CGRectMake(100, kNavBarHAbove7+30, 100, 40) ImageName:@"top"];
    topimg.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:topimg];
    
    
    [self.view addSubview:self.mobileview];
    [self.view addSubview:self.loginBtn];
    
    
    self.changeLoginStyleBtn = [[SQCustomButton alloc]initWithFrame:CGRectMake(50, kNavBarHAbove7 +320, SCREEN_WIDTH-100, 40) type:SQCustomButtonRightImageType imageSize:CGSizeMake(15, 15) midmargin:5];
    self.changeLoginStyleBtn.titleLabel.text = @"账号密码登录";
    self.changeLoginStyleBtn.imageView.image = [UIImage imageNamed:@"rightjt"];
    [self.view addSubview:self.changeLoginStyleBtn];
    // Do any additional setup after loading the view.
    
    SQCustomButton *tixbtn = [[SQCustomButton alloc]initWithFrame:CGRectMake(50, SCREEN_HEIGHT-60, SCREEN_WIDTH-100, 20) type:SQCustomButtonLeftImageType imageSize:CGSizeMake(15, 15) midmargin:1];
    tixbtn.imageView.image = [UIImage imageNamed:@"tix"];
    tixbtn.titleLabel.textColor = RGB(176, 196, 222);
    tixbtn.titleLabel.text = @"未注册用户将直接为您注册";
    tixbtn.titleLabel.font = FONT(12);
    [self.view addSubview:tixbtn];
    
}




- (MobileLoginView *)mobileview{
    if (!_mobileview) {
        _mobileview = [[MobileLoginView alloc]initWithFrame:CGRectMake(0, kNavBarHAbove7+100, SCREEN_WIDTH, 140)];
        _mobileview.delegate = self;
        //_mobileview.backgroundColor = UIColor.redColor;
    }
    return _mobileview;
}

- (UIButton *)loginBtn{
    if (!_loginBtn) {
        _loginBtn = [ZCControl createButtonNormalFrame:CGRectMake(10, kNavBarHAbove7+260, SCREEN_WIDTH-20, 50) Target:self Action:@selector(clickCodeLogin) Title:@"登录" TitleColor:UIColor.whiteColor Font:17 BackGColor:RGB(176, 196, 222)];
        LRViewBorderRadius(_loginBtn, 5, 0, UIColor.clearColor);
    }
    return _loginBtn;
}
- (void)clickCodeLogin{
    if (phonetext.length<=0) {
        [SVProgressHUD showErrorWithStatus:@"请输入电话号码"];
        [SVProgressHUD dismissWithDelay:1];
        return;
    }
    if (codetext.length<=0) {
        [SVProgressHUD showErrorWithStatus:@"请输入验证码"];
        [SVProgressHUD dismissWithDelay:1];
        return;
    }
    
    [GlobleStting setUsername:phonetext];
    [GlobleStting setPassword:codetext];
    [SVProgressHUD showSuccessWithStatus:@"登录成功"];
    [SVProgressHUD dismissWithDelay:1 completion:^{
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
}


- (void)sendPhoneValue:(NSString *)phoneValue{
    phonetext = phoneValue;
}
- (void)sendCodeValue:(NSString *)codeValue{
    codetext = codeValue;
}




@end
