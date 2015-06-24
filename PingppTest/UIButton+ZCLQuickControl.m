//
//  UIButton+ZCLQuickControl.m
//  PingppTest
//
//  Created by ZhuCanle on 15/6/24.
//  Copyright (c) 2015年 root. All rights reserved.
//

#import "UIButton+ZCLQuickControl.h"

@implementation UIButton (ZCLQuickControl)

- (void)setState:(UIControlState)theState imageName:(NSString *)imageName title:(NSString *)title titleColor:(UIColor *)color
{
    [self setTitle:title forState:theState];
    [self setTitleColor:color forState:theState];
    if(self.buttonType==UIButtonTypeCustom)
    {
        [self setImage:[UIImage imageNamed:imageName] forState:theState];
    }
}

@end
