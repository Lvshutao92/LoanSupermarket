//
//  MobileLoginView.h
//  LoanSupermarket
//
//  Created by 吕书涛 on 2019/3/20.
//  Copyright © 2019 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@protocol PhoneCodeDelegate <NSObject>


- (void)sendPhoneValue:(NSString *)phoneValue;
-(void)sendCodeValue:(NSString *)codeValue;

@end

//==========================================================================
@interface MobileLoginView : UIView



@property (nonatomic, weak)id<PhoneCodeDelegate> delegate; //声明协议变量




@property(nonatomic,strong)NSString *phoneText;
@property(nonatomic,strong)NSString *codeText;




@end

NS_ASSUME_NONNULL_END
