//
//  UIButton+ZCLQuickControl.h
//  PingppTest
//
//  Created by ZhuCanle on 15/6/24.
//  Copyright (c) 2015年 root. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (ZCLQuickControl)

- (void)setState:(UIControlState)currentState imageName:(NSString *)imageName title:(NSString *)title titleColor:(UIColor *)color;

@end
