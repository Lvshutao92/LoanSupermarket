//
//  Manager.m
//  LoanSupermarket
//
//  Created by apple on 2019/3/18.
//  Copyright © 2019年 apple. All rights reserved.
//

#import "Manager.h"
static Manager *manager = nil;


@implementation Manager
+ (Manager *)sharedManager {
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        manager = [[Manager alloc] init];
    });
    return manager;
}

//获取字符串的宽度
+(float) widthForString:(NSString *)value fontSize:(float)fontSize andHeight:(float)height
{
    CGSize sizeToFit = [value sizeWithFont:[UIFont systemFontOfSize:fontSize] constrainedToSize:CGSizeMake(CGFLOAT_MAX, height) lineBreakMode:NSLineBreakByWordWrapping];//此处的换行类型（lineBreakMode）可根据自己的实际情况进行设置
    return sizeToFit.width;
}

//获得字符串的高度
+(float) heightForString:(NSString *)value fontSize:(float)fontSize andWidth:(float)width
{
    CGSize sizeToFit = [value sizeWithFont:[UIFont systemFontOfSize:fontSize] constrainedToSize:CGSizeMake(width, CGFLOAT_MAX) lineBreakMode:NSLineBreakByCharWrapping];//此处的换行类型（lineBreakMode）可根据自己的实际情况进行设置
    return sizeToFit.height;
}
//行间距
+ (void)changeLineSpaceForLabel:(UILabel *)label WithSpace:(float)space {
    
    NSString *labelText = label.text;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:space];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    label.attributedText = attributedString;
    [label sizeToFit];
    
}
//字间距
+ (void)changeWordSpaceForLabel:(UILabel *)label WithSpace:(float)space {
    
    NSString *labelText = label.text;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText attributes:@{NSKernAttributeName:@(space)}];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    label.attributedText = attributedString;
    [label sizeToFit];
    
}
//行字间距
+ (void)changeSpaceForLabel:(UILabel *)label withLineSpace:(float)lineSpace WordSpace:(float)wordSpace {
    
    NSString *labelText = label.text;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText attributes:@{NSKernAttributeName:@(wordSpace)}];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpace];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    label.attributedText = attributedString;
    [label sizeToFit];
    
}

//为空判断
+ (BOOL)judgeWhetherIsEmptyAnyObject:(id)object {
    
    if(object == nil)
    {
        return NO;
    }
    
    if([object isKindOfClass:[NSDictionary class]])
    {
        
    }
    else if([object isKindOfClass:[NSArray class]])
    {
        
    }
    else if ([object isKindOfClass:[NSString class]])
    {
        if([(NSString *)object isEqualToString:@""])
            return NO;
    }
    else if ([object isKindOfClass:[NSNumber class]])
    {
        return NO;
    }
    else if ([object isKindOfClass:[NSSet class]])
    {
        
    }
    else if((NSNull *)object == [NSNull null])
    {
        return NO;
    }
    else if ([object isEqualToString:@"<null>"])
    {
        return NO;
    }
    
    return YES;
}
//时间戳转时间。不带时分秒
+ (NSString *)TimeCuoToTime:(NSString *)str{
    long long time=[str longLongValue] / 1000;
    //如果服务器返回的是13位字符串，需要除以1000，否则显示不正确(13位其实代表的是毫秒，需要除以1000)
    //long long time=[timeStr longLongValue] / 1000;
    NSDate *date = [[NSDate alloc]initWithTimeIntervalSince1970:time];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString*timeString=[formatter stringFromDate:date];
    return timeString;
}
//计算两个日期之间的天数
+ (NSInteger)calcDaysFromBegin:(NSDate *)beginDate end:(NSDate *)endDate
{
    //创建日期格式化对象
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    //取两个日期对象的时间间隔：
    //这里的NSTimeInterval 并不是对象，是基本型，其实是double类型，是由c定义的:typedef double NSTimeInterval;
    NSTimeInterval time=[endDate timeIntervalSinceDate:beginDate];
    int days=((int)time)/(3600*24);
    //int hours=((int)time)%(3600*24)/3600;
    //NSString *dateContent=[[NSString alloc] initWithFormat:@"%i天%i小时",days,hours];
    return days;
}
//获取当前的时间
+(NSString*)getCurrentTimes{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    [formatter setDateFormat:@"YYYY-MM"];
    //现在时间,你可以输出来看下是什么格式
    NSDate *datenow = [NSDate date];
    //----------将nsdate按formatter格式转成nsstring
    NSString *currentTimeString = [formatter stringFromDate:datenow];
    return currentTimeString;
}

+ (UIImage *) imageFromURLString: (NSString *) urlstring{
    return [UIImage imageWithData:[NSData  dataWithContentsOfURL:[NSURL URLWithString:urlstring]]];
}


@end
