//
//  UIView+ZCLQuickControl.h
//  PingppTest
//
//  Created by ZhuCanle on 15/6/24.
//  Copyright (c) 2015年 root. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "UIButton+ZCLQuickControl.h"

@interface UIView (ZCLQuickControl)

- (UIButton *)addCustomButtonAtNormalStateWithFrame:(CGRect)frame imageName:(NSString *)imageName title:(NSString *)title titleColor:(UIColor *)color fontSize:(CGFloat)size fontName:(NSString *)font aligmentType:(NSTextAlignment)aligment;

- (UIButton *)addSystemButtonAtNormalStateWithFrame:(CGRect)frame title:(NSString *)title titleColor:(UIColor *)color fontSize:(CGFloat)size fontName:(NSString *)font aligmentType:(NSTextAlignment)aligment;

- (UIImageView *)addImageViewWithFrame:(CGRect)frame imageName:(NSString *)imageName clipToBounds:(BOOL)clip;

- (UILabel *)addLabelWithFrame:(CGRect)frame text:(NSString *)text textColor:(UIColor *)color fontSize:(CGFloat)size fontName:(NSString *)font aligmentType:(NSTextAlignment)aligment;

@end
