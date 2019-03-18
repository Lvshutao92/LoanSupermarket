//
//  Manager.h
//  LoanSupermarket
//
//  Created by apple on 2019/3/18.
//  Copyright © 2019年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Manager : NSObject
//声明单例方法
+ (Manager *)sharedManager;


////获取字符串的宽度
+(float) widthForString:(NSString *)value fontSize:(float)fontSize andHeight:(float)height;
//获得字符串的高度
+(float) heightForString:(NSString *)value fontSize:(float)fontSize andWidth:(float)width;
/**
 *  改变行间距
 */
+ (void)changeLineSpaceForLabel:(UILabel *)label WithSpace:(float)space;

/**
 *  改变字间距
 */
+ (void)changeWordSpaceForLabel:(UILabel *)label WithSpace:(float)space;

/**
 *  改变行间距和字间距
 */
+ (void)changeSpaceForLabel:(UILabel *)label withLineSpace:(float)lineSpace WordSpace:(float)wordSpace;
//判断对象
+ (BOOL)judgeWhetherIsEmptyAnyObject:(id)object;
//时间戳转时间
+ (NSString *)TimeCuoToTime:(NSString *)str;
//日期相减
+ (NSInteger)calcDaysFromBegin:(NSDate *)beginDate end:(NSDate *)endDate;
//
+ (UIImage *) imageFromURLString: (NSString *) urlstring;
//获取当前时间
+(NSString*)getCurrentTimes;







@end

NS_ASSUME_NONNULL_END
