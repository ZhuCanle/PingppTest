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
#import <Masonry.h>

#import "ZCLPingpp.h"

@interface ViewController ()
{
    ZCLPingpp *_zclPingpp;
    
    UITextField *_urlTF;
    UITextField *_amountTF;
    UIButton *_aliPayBtn;
    UIButton *_unionPayBtn;
    UIButton *_wechatPayBtn;
    UIButton *_baiduPayBtn;
}

@end

@implementation ViewController

#pragma mark - VC生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 创建UI
    [self createUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 创建界面试图
- (void)createUI
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createTextField];
    [self createButton];
    
}

- (void)createTextField
{
    // URL输入框
    _urlTF = [[UITextField alloc] init];
    _urlTF.layer.borderWidth = 1;
    _urlTF.layer.borderColor = [UIColor darkGrayColor].CGColor;
    _urlTF.placeholder = @"URL";
    [self.view addSubview:_urlTF];
    [_urlTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(@(88));
        make.left.mas_equalTo(@100);
        make.height.mas_equalTo(@28);
        make.width.mas_equalTo(@230);
    }];
    
    // 金额输入框
    _amountTF = [[UITextField alloc] init];
    _amountTF.layer.borderWidth = 1;
    _amountTF.layer.borderColor = [UIColor darkGrayColor].CGColor;
    _amountTF.placeholder = @"金额";
    _amountTF.keyboardType = UIKeyboardTypeNumberPad;
    [self.view addSubview:_amountTF];
    [_amountTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(@(180));
        make.left.mas_equalTo(@100);
        make.height.mas_equalTo(@28);
        make.width.mas_equalTo(@230);
    }];
}

- (void)createButton
{
    
}

@end
