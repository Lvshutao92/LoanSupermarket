//
//  RequestService.m
//  SLDJ
//
//  Created by 苹果 on 16/9/26.
//  Copyright © 2016年 Mr Liu. All rights reserved.
//

#import "RequestService.h"

static RequestService * dataRequest;
@implementation RequestService

-(instancetype)init{
    if (self = [super init]) {
    }
    return self;
}

+(RequestService *)sharedDataRequest{
    if (!dataRequest) {
        dataRequest = [[self alloc] init];
    }
    return dataRequest;
}
+ (void)requestWithURL:(NSString *)url method:(RequestMethod)method params:(id)params
              response:(ResponseBlock)response info:(ErrorBlock)info
{
//    NSMutableDictionary * mutDic = [[NSMutableDictionary alloc] init];
//    mutDic[@"token"]=[[GlobleStting shareGlobalSettingInstance]getToken];
//    mutDic[@"mobile"]=[[GlobleStting shareGlobalSettingInstance]getToken];
//    if (params.count>0) {
//        [mutDic addEntriesFromDictionary:params];
//    }
//
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    
    
    //在单向认证时，前端不放证书，服务器去验证
//    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
//    // 如果是需要服务端验证证书，需要设置为YES
//    securityPolicy.allowInvalidCertificates = YES;
//    //validatesDomainName 是否需要验证域名，默认为YES；
//    securityPolicy.validatesDomainName = NO;
//    //设置验证模式
//    session.securityPolicy = securityPolicy;
    

    session.responseSerializer = [AFJSONResponseSerializer serializer];
    //申明请求的数据是json类型
    session.requestSerializer=[AFJSONRequestSerializer serializer];
    [session.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"text/plain", @"text/html", @"application/json",@"text/xml; charset=utf-8",@"application/x-www-form-urlencoded",@"text/json",@"json/html",@"text/javascript", nil]];

    url = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLFragmentAllowedCharacterSet]];
       
    
    if (method == GET) {
        [session GET:url parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            response(responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            info(error);
        }];
    } else {
        [session POST:url parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            response(responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            info(error);
//            [SVProgressHUD showInfoWithStatus:@"获取数据失败！"];
        }];
        
        
    }

}
+ (void)requestImagURL:(NSString *)url method:(UIImage*)photo params:(id)params
              response:(ResponseBlock)response info:(ErrorBlock)info
{

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"text/plain", @"multipart/form-data", @"application/json", @"text/html", @"image/jpeg", @"image/png", @"application/octet-stream", @"text/json", nil]];
       url = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLFragmentAllowedCharacterSet]];
    [manager POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        NSData *fileData = UIImageJPEGRepresentation(photo,0.5);
        // 设置上传图片的名字
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"yyyyMMddHHmmss";
        NSString *str = [formatter stringFromDate:[NSDate date]];
        NSString *fileName = [NSString stringWithFormat:@"%@.jpg", str];
        [formData appendPartWithFileData:fileData name:@"file" fileName:fileName mimeType:@"image/jpeg"];
    } success:^(NSURLSessionDataTask *task, id responseObject) {
       response(responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        info(error);
    }];
    
}



@end
