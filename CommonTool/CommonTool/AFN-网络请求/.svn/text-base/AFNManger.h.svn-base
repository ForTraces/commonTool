//
//  AFNManger.h
//  XIAOMADINGPIAO
//
//  Created by wangtian on 15/5/27.
//  Copyright (c) 2015年 wangtian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

@interface AFNManger : NSObject

@property (nonatomic, strong) AFHTTPRequestOperationManager *defaultmanger;
@property (nonatomic, strong) AFHTTPRequestOperationManager *jsonManager;

//  单例对象
+ (AFNManger *)shareAFNManger;

/**
 *  POST请求
 *  urlString : 上传请求的链接;    parameters : 上传的字段;      success :请求成功的block块;      failure: 请求失败返回的block块;     isjson : 后台返回的是否是JSON数据。
 */
+ (void)postWithUrlString:(NSString *)urlString parameters:(NSDictionary *)parameters success:(void(^)(AFHTTPRequestOperation *operation, id responseObject))success failure:(void(^)(AFHTTPRequestOperation *operation, NSError *error))failure isJson:(BOOL)isjson;

/**
 *  POST请求  可上传拼接图片、文件
 formData :用于上传图片数据流
 */
+ (void)postWithUrlString:(NSString *)urlString parameters:(NSDictionary *)parameters constructingBodyWithBlock:(void (^) (id<AFMultipartFormData> formData))block success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure isJson:(BOOL)isjson;

/**
 *  GET请求
 */
+ (void)getWithUrlString:(NSString *)urlString parameters:(NSDictionary *)parameters success:(void(^)(AFHTTPRequestOperation *operation, id responseObject))success failure:(void(^)(AFHTTPRequestOperation *operation, NSError *error))failure isJson:(BOOL)isjson;

+ (NSString *)logFullUrl:(NSString *)urlString  andParameters:(NSDictionary *)pa;

+ (NSString *)logFullUrl1:(NSString *)urlString  andParameters:(NSDictionary *)pa;
@end
