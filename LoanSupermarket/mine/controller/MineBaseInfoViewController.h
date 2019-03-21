//
//  MineBaseInfoViewController.h
//  LoanSupermarket
//
//  Created by 吕书涛 on 2019/3/19.
//  Copyright © 2019 apple. All rights reserved.
//

#import "MainBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface MineBaseInfoViewController : MainBaseViewController
/**
 导航栏文字
 */
@property (nonatomic,strong)UIImageView *userImg;
@property (nonatomic,strong)UILabel *userlab;



@property (nonatomic,strong)UIView *navBarView;

@property (nonatomic,strong)UIButton *setButton;
@property (nonatomic,strong)UIButton *eamilyButton;
@end

NS_ASSUME_NONNULL_END
