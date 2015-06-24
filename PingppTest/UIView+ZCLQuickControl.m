//
//  UIView+ZCLQuickControl.m
//  PingppTest
//
//  Created by ZhuCanle on 15/6/24.
//  Copyright (c) 2015年 root. All rights reserved.
//

#import "UIView+ZCLQuickControl.h"

@implementation UIView (ZCLQuickControl)

- (UIButton *)addCustomButtonAtNormalStateWithFrame:(CGRect)frame imageName:(NSString *)imageName title:(NSString *)title titleColor:(UIColor *)color fontSize:(CGFloat)size fontName:(NSString *)font aligmentType:(NSTextAlignment)aligment
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button setState:UIControlStateNormal imageName:imageName title:title titleColor:color];
    button.titleLabel.font = [UIFont fontWithName:font size:size];
    button.titleLabel.textAlignment = aligment;
    [self addSubview:button];
    
    return button;
}

- (UIButton *)addSystemButtonAtNormalStateWithFrame:(CGRect)frame title:(NSString *)title titleColor:(UIColor *)color fontSize:(CGFloat)size fontName:(NSString *)font aligmentType:(NSTextAlignment)aligment
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = frame;
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont fontWithName:font size:size];
    [button setTitleColor:color forState:UIControlStateNormal];
    button.titleLabel.textAlignment = aligment;
    [self addSubview:button];
    
    return button;
}

- (UIImageView *)addImageViewWithFrame:(CGRect)frame imageName:(NSString *)imageName clipToBounds:(BOOL)clip
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    imageView.image = [UIImage imageNamed:imageName];
    imageView.clipsToBounds = clip;
    [self addSubview:imageView];
    
    return imageView;
}

- (UILabel *)addLabelWithFrame:(CGRect)frame text:(NSString *)text textColor:(UIColor *)color fontSize:(CGFloat)size fontName:(NSString *)font aligmentType:(NSTextAlignment)aligment
{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.text = text;
    label.font = [UIFont fontWithName:font size:size];
    label.textAlignment = aligment;
    label.textColor = color;
    [self addSubview:label];
    
    return label;
}

@end
