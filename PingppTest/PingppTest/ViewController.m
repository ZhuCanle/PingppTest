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
#import "UIView+ZCLQuickControl.h"

#define URL_SCHEME @"pinggongnengceshidd"

@interface ViewController () <UIActionSheetDelegate>
{
    ZCLPingpp *_zclPingpp;
    
    UITextField *_urlTF;
    UITextField *_amountTF;
    UIButton *_aliPayBtn;
    UIButton *_unionPayBtn;
    UIButton *_wechatPayBtn;
    UIButton *_baiduPayBtn;
    UIButton *_payBtn;
    UIButton *_shareBtn;
    
    NSString *_channel;
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
    _aliPayBtn = [self.view addSystemButtonAtNormalStateWithFrame:CGRectMake(30, 240, 60, 30) title:@"支付宝" titleColor:[UIColor redColor] fontSize:15 fontName:nil aligmentType:NSTextAlignmentCenter];
    [_aliPayBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    _aliPayBtn.selected = YES;
    _channel = @"alipay";
    
    _unionPayBtn = [self.view addSystemButtonAtNormalStateWithFrame:CGRectMake(100, 240, 60, 30) title:@"银联" titleColor:[UIColor redColor] fontSize:15 fontName:nil aligmentType:NSTextAlignmentCenter];
    [_unionPayBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    _wechatPayBtn = [self.view addSystemButtonAtNormalStateWithFrame:CGRectMake(170, 240, 60, 30) title:@"微信" titleColor:[UIColor redColor] fontSize:15 fontName:nil aligmentType:NSTextAlignmentCenter];
    [_wechatPayBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    _baiduPayBtn = [self.view addSystemButtonAtNormalStateWithFrame:CGRectMake(240, 240, 60, 30) title:@"百度" titleColor:[UIColor redColor] fontSize:15 fontName:nil aligmentType:NSTextAlignmentCenter];
    [_baiduPayBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    _payBtn = [self.view addSystemButtonAtNormalStateWithFrame:CGRectMake(260, 280, 60, 30) title:@"支付" titleColor:[UIColor blackColor] fontSize:17 fontName:nil aligmentType:NSTextAlignmentCenter];
    [_payBtn addTarget:self action:@selector(payBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    _shareBtn = [self.view addSystemButtonAtNormalStateWithFrame:CGRectMake(200, 350, 60, 30) title:@"分享" titleColor:[UIColor blueColor] fontSize:17 fontName:nil aligmentType:NSTextAlignmentCenter];
    [_shareBtn addTarget:self action:@selector(shareBtnClick:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - 响应
- (void)btnClick:(UIButton *)button
{
    _aliPayBtn.selected = NO;
    _unionPayBtn.selected = NO;
    _wechatPayBtn.selected = NO;
    _baiduPayBtn.selected = NO;
    
    button.selected = YES;
    
    if(button==_aliPayBtn)
    {
        _channel = @"alipay";
    }
    else if(button==_unionPayBtn)
    {
        _channel = @"unionpay";
    }
    else if(button==_wechatPayBtn)
    {
        _channel = @"wechat";
    }
    else
    {
        _channel = @"baidu";
    }
}

- (void)payBtnClick:(UIButton *)btn
{
    [ZCLPingpp payWithURL:_urlTF.text parament:@{@"channel":_channel,@"amount":_amountTF.text} viewController:self appURLScheme:URL_SCHEME success:^(NSString *result) {
        NSLog(@"success");
    } failure:^(NSString *result) {
        NSLog(@"failure");
    }];
}

- (void)shareBtnClick:(UIButton *)button
{
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"分享" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"微信朋友圈",@"QQ空间",@"短信", nil];
    sheet.delegate = self;
    [sheet showInView:self.view];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_urlTF resignFirstResponder];
    [_amountTF resignFirstResponder];
}


@end
