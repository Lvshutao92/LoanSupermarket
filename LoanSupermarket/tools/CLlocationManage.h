//
//  CLlocationManage.h
//  cehsifor
//
//  Created by 魏魏莹 on 2019/1/30.
//  Copyright © 2019年 魏魏莹. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>


NS_ASSUME_NONNULL_BEGIN


typedef void (^LocationBlock)(CLLocationCoordinate2D locationCorrrdinate,NSString*adress);
typedef void(^AuthorizationFailure)(void);


@interface CLlocationManage : NSObject


+ (CLlocationManage *)shareLocation;
- (void) getLocationCoordinate:(NSString *)typeStr;



@end

NS_ASSUME_NONNULL_END
