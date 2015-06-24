//
//  ZCLPingpp.h
//  PingppTest
//
//  Created by lwj on 15/6/24.
//  Copyright (c) 2015年 root. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <Pingpp.h>
#import <AFNetworking.h>

@interface ZCLPingpp : NSObject

// App服务器地址、交易要素字典、viewController、URLScheme、交易成功后的操作、交易失败后的操作
+ (void)payWithURL:(NSString *)urlString parament:(NSDictionary *)parament viewController:(UIViewController *)viewController appURLScheme:(NSString *)URLScheme success:(void (^)(NSString *result))success failure:(void (^)(NSString *result))failure;

@end
