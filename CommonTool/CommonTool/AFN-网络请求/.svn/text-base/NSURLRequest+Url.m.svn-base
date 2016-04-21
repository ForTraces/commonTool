//
//  NSURLRequest+Url.m
//  YNDoctor
//
//  Created by Elaine on 15--11.
//  Copyright (c) 2015年 yinuo. All rights reserved.
//

#import "NSURLRequest+Url.h"

@implementation NSURLRequest (Url)

+ (NSString *)requestWithPath:(NSString *)path params:(NSDictionary *)params
{
    NSMutableString *urlStr = [NSMutableString stringWithFormat:@"%@", path];
    // 拼接参数
    if (params) {
        // 拼接一个?
        [urlStr appendString:@"?"];
        // 拼接其他参数
        [params enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
            [urlStr appendFormat:@"&%@=%@", key, obj];
        }];
    }
    
    NSString *url = [urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    return url;
}

@end
