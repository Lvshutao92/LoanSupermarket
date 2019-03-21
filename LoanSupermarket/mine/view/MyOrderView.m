//
//  MyOrderView.m
//  LoanSupermarket
//
//  Created by 吕书涛 on 2019/3/20.
//  Copyright © 2019 apple. All rights reserved.
//

#import "MyOrderView.h"

@interface MyOrderView()
@property(nonatomic,strong)SQCustomButton *daihuanBtn;
@property(nonatomic,strong)SQCustomButton *daitixianBtn;
@property(nonatomic,strong)SQCustomButton *daibangkaBtn;
@property(nonatomic,strong)SQCustomButton *daiquerenBtn;
@property(nonatomic,strong)SQCustomButton *lookallBtn;
@end


@implementation MyOrderView


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        self.daihuanBtn = [[SQCustomButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/5*0, 0, SCREEN_WIDTH/5, 70) type:SQCustomButtonTopImageType imageSize:CGSizeMake(25, 25) midmargin:5];
        self.daihuanBtn.titleLabel.text = @"待还款";
        self.daihuanBtn.backgroundColor = UIColor.whiteColor;
        self.daihuanBtn.imageView.image = [UIImage imageNamed:@"dhk"];
        self.daihuanBtn.titleLabel.textColor = UIColor.blackColor;
        [self addSubview:self.daihuanBtn];
        [self.daihuanBtn touchAction:^(SQCustomButton * _Nonnull button) {
            
        }];
        
        self.daitixianBtn = [[SQCustomButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/5*1, 0, SCREEN_WIDTH/5, 70) type:SQCustomButtonTopImageType imageSize:CGSizeMake(25, 25) midmargin:5];
        self.daitixianBtn.titleLabel.text = @"待提现";
        self.daitixianBtn.backgroundColor = UIColor.whiteColor;
        self.daitixianBtn.imageView.image = [UIImage imageNamed:@"dtx"];
        self.daitixianBtn.titleLabel.textColor = UIColor.blackColor;
        [self addSubview:self.daitixianBtn];
        [self.daitixianBtn touchAction:^(SQCustomButton * _Nonnull button) {
            
        }];
        
        self.daibangkaBtn = [[SQCustomButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/5*2, 0, SCREEN_WIDTH/5, 70) type:SQCustomButtonTopImageType imageSize:CGSizeMake(25, 25) midmargin:5];
        self.daibangkaBtn.titleLabel.text = @"待绑卡";
        self.daibangkaBtn.backgroundColor = UIColor.whiteColor;
        self.daibangkaBtn.imageView.image = [UIImage imageNamed:@"dbk"];
        self.daibangkaBtn.titleLabel.textColor = UIColor.blackColor;
        [self addSubview:self.daibangkaBtn];
        [self.daibangkaBtn touchAction:^(SQCustomButton * _Nonnull button) {
            
        }];
        
        
        self.daiquerenBtn = [[SQCustomButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/5*3, 0, SCREEN_WIDTH/5, 70) type:SQCustomButtonTopImageType imageSize:CGSizeMake(25, 25) midmargin:5];
        self.daiquerenBtn.titleLabel.text = @"待确认";
        self.daiquerenBtn.backgroundColor = UIColor.whiteColor;
        self.daiquerenBtn.imageView.image = [UIImage imageNamed:@"dqr"];
        self.daiquerenBtn.titleLabel.textColor = UIColor.blackColor;
        [self addSubview:self.daiquerenBtn];
        [self.daiquerenBtn touchAction:^(SQCustomButton * _Nonnull button) {
            
        }];
        
        
        self.lookallBtn = [[SQCustomButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/5*4, 0, SCREEN_WIDTH/5, 70) type:SQCustomButtonTopImageType imageSize:CGSizeMake(25, 25) midmargin:5];
        self.lookallBtn.titleLabel.text = @"查看全部";
        self.lookallBtn.backgroundColor = UIColor.whiteColor;
        self.lookallBtn.imageView.image = [UIImage imageNamed:@"ckqb"];
        self.lookallBtn.titleLabel.textColor = UIColor.blackColor;
        [self addSubview:self.lookallBtn];
        [self.lookallBtn touchAction:^(SQCustomButton * _Nonnull button) {
            
        }];
    }
    
    return self;
}






/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
