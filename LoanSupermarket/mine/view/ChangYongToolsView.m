//
//  ChangYongToolsView.m
//  LoanSupermarket
//
//  Created by 吕书涛 on 2019/3/20.
//  Copyright © 2019 apple. All rights reserved.
//

#import "ChangYongToolsView.h"

@interface ChangYongToolsView()

@end


@implementation ChangYongToolsView
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        UILabel *lab = [ZCControl createLabelWithFrame:CGRectMake(10, 0, 100, 39) Font:16 Text:@"常用工具" textColor:UIColor.blackColor NSTextAlignment:NSTextAlignmentLeft];
        [self addSubview:lab];
        
        UIView *line = [ZCControl viewWithFrame:CGRectMake(0, 39, SCREEN_WIDTH, 1) viewColor:COLOR(.8, .3)];
        [self addSubview:line];
        
        [self setUpChangYongButton];
    }
    return self;
}
- (void)setUpChangYongButton{
    NSMutableArray *arr1 = [@[@"领券中心",@"我要投诉",@"微信服务号",@"公益救助",@"在线客服",@"认证中心",@"千元奖励",@"银行卡管理",@"帮助中心"]mutableCopy];
    NSMutableArray *arr2 = [@[@"sy1",@"sy2",@"sy3",@"sy4",@"sy5",@"sy6",@"sy7",@"sy8",@"sy9"]mutableCopy];
    int b = 0;
    int hangshu;
    if (arr1.count % 4 == 0 ) {
        hangshu = (int )arr1.count / 4;
    } else {
        hangshu = (int )arr1.count / 4 + 1;
    }
    for (int i = 0; i < hangshu; i++) {
        for (int j = 0; j < 4; j++) {
            SQButton *btn = [SQButton buttonWithType:UIButtonTypeCustom];
            if ( b  < arr1.count) {
                btn.frame = CGRectMake((0  + j * SCREEN_WIDTH/4), 40+(i * 100) ,SCREEN_WIDTH/4, 100);
                btn.tag = b;
                
                btn.titleLabel.font = FONT(14);
                [btn setTitle:arr1[b] forState:UIControlStateNormal];
                [btn setTitleColor:UIColor.darkGrayColor forState:UIControlStateNormal];
                [btn setImage:[UIImage imageNamed:arr2[b]] forState:UIControlStateNormal];
                
                [self addSubview:btn];
                if (b > arr1.count)
                {
                    [btn removeFromSuperview];
                }
            }
            b++;
        }
    }
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
