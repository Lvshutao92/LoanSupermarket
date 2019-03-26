//
//  AccountLoginView.m
//  LoanSupermarket
//
//  Created by 吕书涛 on 2019/3/26.
//  Copyright © 2019 apple. All rights reserved.
//

#import "AccountLoginView.h"

@interface AccountLoginView()<UITextFieldDelegate>

@property(nonatomic,strong)UITextField *accountT;
@property(nonatomic,strong)UITextField *pwdT;
@end

@implementation AccountLoginView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        
        _accountT = [ZCControl createTextFieldWithFrame:CGRectMake(10, 20, SCREEN_WIDTH-20, 40) placeholder:@"请输入您的账号" textColor:UIColor.blackColor Font:18 Alignment:NSTextAlignmentLeft];
        _accountT.delegate = self;
        _accountT.clearButtonMode = UITextFieldViewModeWhileEditing;
        [self addSubview:_accountT];
        
        UIView *lin1 = [ZCControl viewWithFrame:CGRectMake(0, 60, SCREEN_WIDTH, 1) viewColor:COLOR(.8, .3)];
        [self addSubview:lin1];
        
        [_accountT addTarget:self action:@selector(changedAccountTextField:) forControlEvents:UIControlEventEditingChanged];
        
        
        _pwdT = [ZCControl createTextFieldWithFrame:CGRectMake(10, 80, SCREEN_WIDTH-100, 40) placeholder:@"请输入您的密码" textColor:UIColor.blackColor Font:18 Alignment:NSTextAlignmentLeft];
        _pwdT.delegate = self;
        _pwdT.secureTextEntry = YES;
        _pwdT.clearButtonMode = UITextFieldViewModeWhileEditing;
        [self addSubview:_pwdT];
        
        UIView *lin2 = [ZCControl viewWithFrame:CGRectMake(0, 121, SCREEN_WIDTH, 1) viewColor:COLOR(.8, .3)];
        [self addSubview:lin2];
        
        [_pwdT addTarget:self action:@selector(changedPwdTextField:) forControlEvents:UIControlEventEditingChanged];
        
    }
    return self;
}
#pragma mark -给每个textfield添加事件，只要值改变就调用此函数
-(void)changedAccountTextField:(UITextField *)textField
{
    if ([_delegate respondsToSelector:@selector(sendAccountValue:)]) {[_delegate sendAccountValue:textField.text];}
}



-(void)changedPwdTextField:(UITextField *)textField
{
    if ([_delegate respondsToSelector:@selector(sendPwdValue:)]) {[_delegate sendPwdValue:textField.text];}
}


- (void)textFieldDidEndEditing:(UITextField *)textField{
    if ([textField isEqual:self.accountT]) {
        if ([XYQRegexPatternHelper validateMobile:self.accountT.text]!=YES) {
            [SVProgressHUD showErrorWithStatus:@"请输入您的账号"];
            [SVProgressHUD dismissWithDelay:1];
        }
    }
}

- (void)setAccountText:(NSString *)accountText{
    _accountText = accountText;
    _accountT.text = accountText;
}

- (void)setPwdText:(NSString *)pwdText{
    _pwdText = pwdText;
    _pwdT.text = pwdText;
}



@end
