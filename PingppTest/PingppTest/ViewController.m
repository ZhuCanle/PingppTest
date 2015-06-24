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

#import "ZCLPingpp.h"

@interface ViewController ()
{
    ZCLPingpp *_zclPingpp;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _zclPingpp = [[ZCLPingpp alloc] init];
    //_zclPingpp payWithURL:<#(NSString *)#> parament:<#(NSDictionary *)#> viewController:<#(UIViewController *)#> appURLScheme:<#(NSString *)#>
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
