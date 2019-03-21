//
//  GlobleStting.h
//  LoanSupermarket
//
//  Created by 吕书涛 on 2019/3/20.
//  Copyright © 2019 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GlobleStting : NSObject
+(GlobleStting *)shareGlobalSettingInstance;


+(void) setUsername:(NSString *)name;
+(void) setPassword:(NSString *)password;
+ (NSString*)getusername;
+ (NSString*)getpwd;

+ (void)loadingSvProgressView;

-(BOOL) isFirst;
-(void) setIsFirst:(BOOL)isFirst;




@end

NS_ASSUME_NONNULL_END
