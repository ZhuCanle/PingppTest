//
//  UIButton+ZCLQuickControl.m
//  PingppTest
//
//  Created by lwj on 15/6/24.
//  Copyright (c) 2015年 root. All rights reserved.
//

#import "UIButton+ZCLQuickControl.h"

@implementation UIButton (ZCLQuickControl)

- (void)setState:(UIControlState)theState imageName:(NSString *)imageName title:(NSString *)title
{
    [self setTitle:title forState:theState];
    if(self.buttonType==UIButtonTypeCustom)
    {
        [self setImage:[UIImage imageNamed:imageName] forState:theState];
    }
}

@end
