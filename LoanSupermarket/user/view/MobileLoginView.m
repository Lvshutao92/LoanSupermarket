//
//  MobileLoginView.m
//  LoanSupermarket
//
//  Created by 吕书涛 on 2019/3/20.
//  Copyright © 2019 apple. All rights reserved.
//

#import "MobileLoginView.h"

@interface MobileLoginView()<UITextFieldDelegate>

@property(nonatomic,strong)UITextField *phoneT;
@property(nonatomic,strong)UITextField *codeT;
@property(nonatomic,strong)UIButton *codeButton;


@end


@implementation MobileLoginView



- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        
        _phoneT = [ZCControl createTextFieldWithFrame:CGRectMake(10, 20, SCREEN_WIDTH-20, 40) placeholder:@"请输入您的手机号" textColor:UIColor.blackColor Font:18 Alignment:NSTextAlignmentLeft];
        _phoneT.delegate = self;
        _phoneT.clearButtonMode = UITextFieldViewModeWhileEditing;
        _phoneT.keyboardType = UIKeyboardTypePhonePad;
        [self addSubview:_phoneT];
        
        UIView *lin1 = [ZCControl viewWithFrame:CGRectMake(0, 60, SCREEN_WIDTH, 1) viewColor:COLOR(.8, .3)];
        [self addSubview:lin1];
        
        [_phoneT addTarget:self action:@selector(changedPhoneTextField:) forControlEvents:UIControlEventEditingChanged];
        
        
        _codeT = [ZCControl createTextFieldWithFrame:CGRectMake(10, 80, SCREEN_WIDTH-100, 40) placeholder:@"请输入验证码" textColor:UIColor.blackColor Font:18 Alignment:NSTextAlignmentLeft];
        _codeT.keyboardType = UIKeyboardTypeNumberPad;
        _codeT.delegate = self;
        _codeT.clearButtonMode = UITextFieldViewModeWhileEditing;
        [self addSubview:_codeT];
        
        UIView *lin2 = [ZCControl viewWithFrame:CGRectMake(0, 121, SCREEN_WIDTH, 1) viewColor:COLOR(.8, .3)];
        [self addSubview:lin2];
        
        [_codeT addTarget:self action:@selector(changedCodeTextField:) forControlEvents:UIControlEventEditingChanged];

        
        _codeButton = [ZCControl createButtonNormalFrame:CGRectMake(SCREEN_WIDTH-90, 80, 90, 40) Target:self Action:@selector(clickSendCode) Title:@"发送验证码" TitleColor:UIColor.blackColor Font:14 BackGColor:nil];
        [self addSubview:_codeButton];
    }
    return self;
}
#pragma mark -给每个textfield添加事件，只要值改变就调用此函数
-(void)changedPhoneTextField:(UITextField *)textField
{
    if ([_delegate respondsToSelector:@selector(sendPhoneValue:)]) {
        [_delegate sendPhoneValue:textField.text];
    }
}
-(void)changedCodeTextField:(UITextField *)textField
{
    if ([_delegate respondsToSelector:@selector(sendCodeValue:)]) {
        [_delegate sendCodeValue:textField.text];
    }
}


- (void)textFieldDidEndEditing:(UITextField *)textField{
    if ([textField isEqual:self.phoneT]) {
        if ([XYQRegexPatternHelper validateMobile:self.phoneT.text]!=YES) {
            [SVProgressHUD showErrorWithStatus:@"请输入正确的手机号"];
            [SVProgressHUD dismissWithDelay:1];
        }
    }
}
- (void)clickSendCode{
    if ([XYQRegexPatternHelper validateMobile:self.phoneT.text]!=YES) {
        [SVProgressHUD showErrorWithStatus:@"请输入正确的手机号"];
        [SVProgressHUD dismissWithDelay:1];
        return;
    }
}













- (void)setPhoneText:(NSString *)phoneText{
    _phoneText = phoneText;
    _phoneT.text = phoneText;
}

- (void)setCodeText:(NSString *)codeText{
    _codeText = codeText;
    _codeT.text = codeText;
}



@end
