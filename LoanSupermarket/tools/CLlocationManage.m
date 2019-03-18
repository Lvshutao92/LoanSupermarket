
//
//  CLlocationManage.m
//  cehsifor
//
//  Created by 魏魏莹 on 2019/1/30.
//  Copyright © 2019年 魏魏莹. All rights reserved.
//

#import "CLlocationManage.h"

static CLlocationManage * shareLocation;
@interface CLlocationManage ()<CLLocationManagerDelegate>
{
    NSString *typeString;
}

/** 位置管理者 */
@property(nonatomic,strong) CLLocationManager *mgr;
@property (nonatomic, copy) LocationBlock locationBlock;

@end
@implementation CLlocationManage

+ (CLlocationManage *)shareLocation{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!shareLocation) {
            shareLocation =[[self alloc] init];
        }
    });
    return shareLocation;
}

- (void) getLocationCoordinate:(NSString *)typeStr{
 
    if([CLLocationManager authorizationStatus] == kCLAuthorizationStatusDenied)
    {
        
//        UIAlertController*alert=[UIAlertController alertControllerWithTitle:@"提示" message:@"需要开启定位服务,请到设置->隐私,打开定位服务" preferredStyle:UIAlertControllerStyleAlert];
//        UIAlertAction*okACtion=[UIAlertAction actionWithTitle:@"去设置" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//            NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
//            if ([[UIApplication sharedApplication] canOpenURL:url]){
//                [[UIApplication sharedApplication] openURL:url];
//            }
//        }];
//        UIAlertAction*cancle=[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
//        
//        [alert addAction:okACtion];
//        [alert addAction:cancle];
//        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:YES completion:nil];

    }else
    {
        typeString = typeStr;
//        self.locationBlock = [locaiontBlock copy];
        self.mgr=[[CLLocationManager alloc]init];
        self.mgr.delegate=self;
        self.mgr.desiredAccuracy = kCLLocationAccuracyBest;
        [self.mgr requestWhenInUseAuthorization];
        [self.mgr startUpdatingLocation];
    }
  
 
}


- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(nonnull NSArray<CLLocation *> *)locations
{
    //当前所在城市的坐标值
    CLLocation *currLocation = [locations lastObject];
    
//   CLLocationCoordinate2D lastCoordinate = CLLocationCoordinate2DMake(currLocation.coordinate.latitude ,currLocation.coordinate.longitude );
//    NSLog(@"经度=%f 纬度=%f 高度=%f", currLocation.coordinate.latitude, currLocation.coordinate.longitude, currLocation.altitude);
    //
    //根据经纬度反向地理编译出地址信息
    CLGeocoder * geoCoder = [[CLGeocoder alloc] init];
    
    [geoCoder reverseGeocodeLocation:currLocation completionHandler:^(NSArray *placemarks, NSError *error) {
        if (error!=nil||placemarks.count==0) {
//            定位失败
            return ;
        }
        if(placemarks.count > 0)
            
        {
            CLPlacemark *placemark = [placemarks objectAtIndex:0];
            NSDictionary *address = [placemark addressDictionary];
            
            //  Country(国家)  State(省)/Users/apple/Desktop/现金贷的副本/jie/librays/Sources  City（市）
//            NSLog(@"#####%@",address);
            
            // NSLog(@"%@", [address objectForKey:@"State"]);//---最好不要这个省，我们获取城市只要city --无锡市，包括北京市和重庆市
            NSString*sheng=[address objectForKey:@"State"];
            if (sheng.length==0) {
                sheng=@"";
            }
            
            NSString*street=@"";
            if ([address objectForKey:@"Street"]) {
                street=[address objectForKey:@"Street"];
            }else{
                street=@"";
            }
            
            NSString*cityStr=[NSString stringWithFormat:@"%@%@%@%@",sheng,[address objectForKey:@"City"],[address objectForKey:@"SubLocality"],street];
            
            NSMutableDictionary*mutDic=[NSMutableDictionary dictionary];
            NSLog(@"--CLLocation-%@",mutDic);
            
        }
    }];
    [manager stopUpdatingLocation];
    manager.delegate = nil;

    
}
//- (CLLocationManager *)mgr
//{
//    if (_mgr == nil) {
//        // 实例化位置管理者
//        _mgr=[[CLLocationManager alloc]init];
//        _mgr.delegate=self;
//        _mgr.desiredAccuracy = kCLLocationAccuracyBest;
////        [_mgr requestAlwaysAuthorization];
////        _mgr.distanceFilter=100;
//
//
//        // 兼容iOS8之后的方法
//        // 方法一:判断iOS版本号
//
////            [_mgr requestAlwaysAuthorization];
//            // 前台定位授权 官方文档中说明info.plist中必须有NSLocationWhenInUseUsageDescription键
//            [_mgr requestWhenInUseAuthorization];
////        [_mgr requestWhenInUseAuthorization];
//            // 前后台定位授权 官方文档中说明info.plist中必须有NSLocationAlwaysUsageDescription键
//
//
//
//
//    }
//    return _mgr;
//}
- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    if([CLLocationManager authorizationStatus] == kCLAuthorizationStatusDenied)
    {
         [self.mgr stopUpdatingLocation];
    }
    
}
@end
