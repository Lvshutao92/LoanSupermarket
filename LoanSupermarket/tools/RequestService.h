//
//  RequestService.h
//  SLDJ
//
//  Created by 苹果 on 16/9/26.
//  Copyright © 2016年 Mr Liu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"


typedef enum {
    GET,
    POST
} RequestMethod;


typedef void(^ResponseBlock)(id responseObject);

typedef void(^ErrorBlock)(id error);


@interface RequestService : NSObject

+ (RequestService *)sharedDataRequest;

//+(BOOL) checkNetwork;

+ (void)requestWithURL:(NSString *)url method:(RequestMethod)method params:(id)params
              response:(ResponseBlock)response info:(ErrorBlock)info;
+ (void)requestImagURL:(NSString *)url method:(UIImage*)photo params:(id)params
              response:(ResponseBlock)response info:(ErrorBlock)info;
@end
