//
//  AccountLoginView.h
//  LoanSupermarket
//
//  Created by 吕书涛 on 2019/3/26.
//  Copyright © 2019 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@protocol AccountPwdDelegate <NSObject>


- (void)sendAccountValue:(NSString *)accountValue;
-(void)sendPwdValue:(NSString *)pwdValue;

@end


@interface AccountLoginView : UIView


@property (nonatomic, weak)id<AccountPwdDelegate> delegate;




@property(nonatomic,strong)NSString *accountText;
@property(nonatomic,strong)NSString *pwdText;



@end

NS_ASSUME_NONNULL_END
