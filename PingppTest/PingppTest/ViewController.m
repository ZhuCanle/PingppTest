//
//  ViewController.m
//  PingppTest
//
//  Created by lwj on 15/6/24.
//  Copyright (c) 2015年 root. All rights reserved.
//

#import "ViewController.h"

#import <AFNetworking.h>
#import <Pingpp.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //交易数据字典转字符串再转NSData
    NSDictionary *dic = @{@"chanel":@"alipay",@"amount":@1};
    NSData *data = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:nil];
    NSString *bodyStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSData *paraData = [NSData dataWithBytes:[bodyStr UTF8String] length:strlen([bodyStr UTF8String])];
    
    //上传
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    [manager POST:@"http://" parameters:paraData success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *chargeDic = [NSJSONSerialization dataWithJSONObject:responseObject options:NSJSONReadingMutableContainers error:nil];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"请求失败");
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
