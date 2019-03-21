//
//  MyActivityView.m
//  LoanSupermarket
//
//  Created by 吕书涛 on 2019/3/20.
//  Copyright © 2019 apple. All rights reserved.
//

#import "MyActivityView.h"


@interface MyActivityView()


@property(nonatomic,strong)UIButton *jiDouBtn;
@property(nonatomic,strong)UIButton *youHuiQuanBtn;
@property(nonatomic,strong)UIButton *xianjinhongbaoBtn;
@property(nonatomic,strong)UIButton *jujiupeiBtn;
@property(nonatomic,strong)SQCustomButton *myQianBaoBtn;



@end


@implementation MyActivityView


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        self.jiDouBtn = [ZCControl createButtonNormalFrame:CGRectMake(0, 0, SCREEN_WIDTH/5, 70) Target:self Action:@selector(clickOne) Title:@"10\n金豆" TitleColor:UIColor.blackColor Font:14 BackGColor:UIColor.whiteColor];
        self.jiDouBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.jiDouBtn.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        self.jiDouBtn.titleLabel.numberOfLines = 2;
        [self addSubview:self.jiDouBtn];
        
        
        self.youHuiQuanBtn = [ZCControl createButtonNormalFrame:CGRectMake(SCREEN_WIDTH/5, 0, SCREEN_WIDTH/5, 70) Target:self Action:@selector(clickTwo) Title:@"2\n优惠券" TitleColor:UIColor.blackColor Font:14 BackGColor:UIColor.whiteColor];
        self.youHuiQuanBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.youHuiQuanBtn.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        self.youHuiQuanBtn.titleLabel.numberOfLines = 2;
        [self addSubview:self.youHuiQuanBtn];
        
        
        self.xianjinhongbaoBtn = [ZCControl createButtonNormalFrame:CGRectMake(SCREEN_WIDTH/5*2, 0, SCREEN_WIDTH/5, 70) Target:self Action:@selector(clickThree) Title:@"0.00\n现金红包" TitleColor:UIColor.blackColor Font:14 BackGColor:UIColor.whiteColor];
        self.xianjinhongbaoBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.xianjinhongbaoBtn.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        self.xianjinhongbaoBtn.titleLabel.numberOfLines = 2;
        [self addSubview:self.xianjinhongbaoBtn];
        
        self.jujiupeiBtn = [ZCControl createButtonNormalFrame:CGRectMake(SCREEN_WIDTH/5*3, 0, SCREEN_WIDTH/5, 70) Target:self Action:@selector(clickFour) Title:@"1\n拒就陪" TitleColor:UIColor.blackColor Font:14 BackGColor:UIColor.whiteColor];
        self.jujiupeiBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.jujiupeiBtn.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        self.jujiupeiBtn.titleLabel.numberOfLines = 2;
        [self addSubview:self.jujiupeiBtn];
        
        
        self.myQianBaoBtn = [[SQCustomButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/5*4, 0, SCREEN_WIDTH/5, 70) type:SQCustomButtonTopImageType imageSize:CGSizeMake(20, 20) midmargin:5];
        self.myQianBaoBtn.titleLabel.text = @"我的钱包";
        self.myQianBaoBtn.backgroundColor = UIColor.whiteColor;
        self.myQianBaoBtn.imageView.image = [UIImage imageNamed:@"wdqb"];
        self.myQianBaoBtn.titleLabel.textColor = UIColor.blackColor;
        [self addSubview:self.myQianBaoBtn];
        [self.myQianBaoBtn touchAction:^(SQCustomButton * _Nonnull button) {
        }];
        
    }
    return self;
}
//=============

- (void)clickOne{
    
}
- (void)clickTwo{
    
}
- (void)clickThree{
    
}
- (void)clickFour{
    
}






//============
- (void)setJindou:(NSString *)jindou{
    _jindou = jindou;
    [self.jiDouBtn setTitle:jindou forState:UIControlStateNormal];
}
- (void)setYouhuiquan:(NSString *)youhuiquan{
    _youhuiquan = youhuiquan;
    [self.youHuiQuanBtn setTitle:youhuiquan forState:UIControlStateNormal];
}
- (void)setXianjinhongbao:(NSString *)xianjinhongbao{
    _xianjinhongbao = xianjinhongbao;
    [self.xianjinhongbaoBtn setTitle:xianjinhongbao forState:UIControlStateNormal];
}
- (void)setJujiupei:(NSString *)jujiupei{
    _jujiupei = jujiupei;
    [self.jujiupeiBtn setTitle:jujiupei forState:UIControlStateNormal];
}





@end
