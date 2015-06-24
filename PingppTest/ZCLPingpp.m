//
//  ZCLPingpp.m
//  PingppTest
//
//  Created by lwj on 15/6/24.
//  Copyright (c) 2015年 root. All rights reserved.
//

#import "ZCLPingpp.h"

@implementation ZCLPingpp

+ (void)payWithURL:(NSString *)urlString parament:(NSDictionary *)parament viewController:(UIViewController *)viewController appURLScheme:(NSString *)URLScheme success:(void (^)(NSString *))success failure:(void (^)(NSString *))failure
{
    // 获取charge
    // 交易要素字典转字符串再转NSData
    NSData *data = [NSJSONSerialization dataWithJSONObject:parament options:NSJSONWritingPrettyPrinted error:nil];
    NSString *bodyStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSData *paraData = [NSData dataWithBytes:[bodyStr UTF8String] length:strlen([bodyStr UTF8String])];
    
    // 上传并获取charge
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    [manager POST:@"http://" parameters:paraData success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *chargeDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSData *chargeData = [NSJSONSerialization dataWithJSONObject:chargeDic options:NSJSONWritingPrettyPrinted error:nil];
        NSString *charge = [[NSString alloc] initWithData:chargeData encoding:NSUTF8StringEncoding];
        // 接入
        [Pingpp createPayment:charge
               viewController:viewController
                 appURLScheme:URLScheme
               withCompletion:^(NSString *result, PingppError *error) {
                   if ([result isEqualToString:@"success"]) {
                       // 支付成功,执行success block中的操作
                       success(result);
                   } else {
                       // 支付失败或取消
                       NSLog(@"Error: code=%lu msg=%@", error.code, [error getMsg]);
                       // 执行failure block中的操作
                       failure(result);
                   }
        }];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"请求失败");
        
    }];
}

@end
