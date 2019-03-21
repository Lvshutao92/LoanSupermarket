//
//  QianDaoView.m
//  LoanSupermarket
//
//  Created by 吕书涛 on 2019/3/20.
//  Copyright © 2019 apple. All rights reserved.
//

#import "QianDaoView.h"

@interface QianDaoView()

@end


@implementation QianDaoView
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        //=========
        UIView *qdView = [ZCControl viewWithFrame:CGRectMake(10, 10, SCREEN_WIDTH/2-20, 50) viewColor:UIColor.whiteColor];
        qdView.layer.cornerRadius = 5;
        qdView.layer.shadowColor = [UIColor darkGrayColor].CGColor;
        qdView.layer.shadowOffset = CGSizeMake(2,2);
        qdView.layer.shadowOpacity = 0.5;
        qdView.layer.shadowRadius = 5;
        [self addSubview:qdView];
        
        UIImageView *qdimg = [ZCControl createImageViewWithFrame:CGRectMake(10, 10, 30, 30) ImageName:@"qdimg"];
        [qdView addSubview:qdimg];
        
        UILabel *qdlab1 = [ZCControl createLabelWithFrame:CGRectMake(50, 5, (SCREEN_WIDTH/2-20-60), 20) Font:14 Text:@"签到领拒就赔" textColor:baseColor NSTextAlignment:NSTextAlignmentLeft];
        [qdView addSubview:qdlab1];
        
        UILabel *qdlab2 = [ZCControl createLabelWithFrame:CGRectMake(50, 25, (SCREEN_WIDTH/2-20-60), 20) Font:11 Text:@"连续7天签到领大礼" textColor:UIColor.lightGrayColor NSTextAlignment:NSTextAlignmentLeft];
        [qdView addSubview:qdlab2];
        
        
        //=======
        UIView *jlView = [ZCControl viewWithFrame:CGRectMake(10 + SCREEN_WIDTH/2, 10, SCREEN_WIDTH/2-20, 50) viewColor:UIColor.whiteColor];
        jlView.layer.cornerRadius = 5;
        jlView.layer.shadowColor = [UIColor darkGrayColor].CGColor;
        jlView.layer.shadowOffset = CGSizeMake(2,2);
        jlView.layer.shadowOpacity = 0.5;
        jlView.layer.shadowRadius = 5;
        [self addSubview:jlView];
        
        UIImageView *jlimg = [ZCControl createImageViewWithFrame:CGRectMake(10, 10, 30, 30) ImageName:@"jlimg"];
        [jlView addSubview:jlimg];
        
        UILabel *jllab1 = [ZCControl createLabelWithFrame:CGRectMake(50, 5, (SCREEN_WIDTH/2-20-60), 20) Font:14 Text:@"每日奖励" textColor:baseColor NSTextAlignment:NSTextAlignmentLeft];
        [jlView addSubview:jllab1];
        
        UILabel *jllab2 = [ZCControl createLabelWithFrame:CGRectMake(50, 25, (SCREEN_WIDTH/2-20-60), 20) Font:11 Text:@"完成实名认证得奖励" textColor:UIColor.lightGrayColor NSTextAlignment:NSTextAlignmentLeft];
        [jlView addSubview:jllab2];
        
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
