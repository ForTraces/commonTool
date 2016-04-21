//
//  AFNManger.m
//  XIAOMADINGPIAO
//
//  Created by wangtian on 15/5/27.
//  Copyright (c) 2015年 wangtian. All rights reserved.
//

#import "AFNManger.h"

#define AFNRequestTimeout 30
#define AFNDefaultManager  [AFNManger shareAFNManger].defaultmanger
#define AFNJsonManager     [AFNManger shareAFNManger].jsonManager

typedef enum{
    
    AFNGet,
    AFNpost
    
}AFNRequestType;

static AFNManger *manger = nil;

@implementation AFNManger

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    if (manger == nil)
    {
        manger = [super allocWithZone:zone];
    }
    return manger;
}

+ (AFNManger *)shareAFNManger
{
    if (manger == nil)
    {
        manger = [[super alloc] init];
        [manger setTimeOut:AFNRequestTimeout];
    }
    return manger;
}

- (AFHTTPRequestOperationManager *)defaultmanger
{
    if (_defaultmanger == nil)
    {
        _defaultmanger = [AFHTTPRequestOperationManager manager];
        _defaultmanger.responseSerializer = [AFHTTPResponseSerializer serializer];
    }
    return _defaultmanger;
}

- (AFHTTPRequestOperationManager *)jsonManager
{
    if (_jsonManager == nil)
    {
        _jsonManager = [AFHTTPRequestOperationManager manager];
        _jsonManager.responseSerializer = [AFJSONResponseSerializer serializer];
    }
    return _jsonManager;
}

#pragma mark - 设置请求超时时间
- (void)setTimeOut:(NSTimeInterval)time
{
    [self.defaultmanger.requestSerializer setTimeoutInterval:time];
    [self.jsonManager.requestSerializer setTimeoutInterval:time];
}

+ (AFHTTPRequestOperationManager *)managerWithIsjson:(BOOL)isJson
{
    if (isJson)
    {
        return AFNJsonManager;
    }
    else
    {
        return AFNDefaultManager;
    }
}

//  POST请求 带上传图片、文件
+ (void)postWithUrlString:(NSString *)urlString parameters:(NSDictionary *)parameters constructingBodyWithBlock:(void (^) (id<AFMultipartFormData>))block success:(void (^)(AFHTTPRequestOperation *, id))success failure:(void (^)(AFHTTPRequestOperation *, NSError *))failure isJson:(BOOL)isjson
{
    [[self managerWithIsjson:isjson] POST:urlString parameters:parameters constructingBodyWithBlock:block success:success failure:failure];
}

//  POST请求 普通请求
+ (void)postWithUrlString:(NSString *)urlString parameters:(NSDictionary *)parameters success:(void (^)(AFHTTPRequestOperation *, id))success failure:(void (^)(AFHTTPRequestOperation *, NSError *))failure isJson:(BOOL)isjson
{
    [self logFullUrl:urlString andParameters:parameters];
    [[self managerWithIsjson:isjson] POST:urlString parameters:parameters success:success failure:failure];
}

//  GET请求
+ (void)getWithUrlString:(NSString *)urlString parameters:(NSDictionary *)parameters success:(void (^)(AFHTTPRequestOperation *, id))success failure:(void (^)(AFHTTPRequestOperation *, NSError *))failure isJson:(BOOL)isjson
{
    [self logFullUrl:urlString andParameters:parameters];
    [[self managerWithIsjson:isjson] GET:urlString parameters:parameters success:success failure:failure];
}

//  打印出请求链接全路径    <待修改>
+ (NSString *)logFullUrl:(NSString *)urlString  andParameters:(NSDictionary *)pa
{
    NSMutableString *paString = [[NSMutableString alloc] init];
    [paString appendString:[NSString stringWithFormat:@"%@",urlString]];
    if (pa != nil)
    {
        [paString appendString:@"&"];
    }
    NSInteger paCount = pa.count;
    __block NSInteger index = 0;
    [pa enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop)
     {
         [paString appendFormat:@"%@=%@",key,obj];
         index++;
         if (index != paCount) {
             
             [paString appendString:@"&"];
         }
     }];
    Log(@"请求URL----------\n\n%@\n\n请求URL----------\n",paString);
    return paString;
}

//  打印出请求链接全路径    <待修改>
+ (NSString *)logFullUrl1:(NSString *)urlString  andParameters:(NSDictionary *)pa
{
    NSMutableString *paString = [[NSMutableString alloc] init];
    [paString appendString:[NSString stringWithFormat:@"%@",urlString]];
    if (pa != nil)
    {
        [paString appendString:@"?"];
    }
    NSInteger paCount = pa.count;
    __block NSInteger index = 0;
    [pa enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop)
     {
         [paString appendFormat:@"%@=%@",key,obj];
         index++;
         if (index != paCount) {
             
             [paString appendString:@"&"];
         }
     }];
    Log(@"请求URL=%@",paString);
    return paString;
}

@end
