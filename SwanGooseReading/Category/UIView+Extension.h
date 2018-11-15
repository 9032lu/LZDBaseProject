//
//  UIView+Extension.h
//  Fame
//
//  Created by qingyun on 16/3/14.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)


@property (nonatomic, assign) CGFloat left;
@property (nonatomic, assign) CGFloat top;

@property (nonatomic, assign) CGFloat bottom;
@property (nonatomic, assign) CGFloat right;

@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;

@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;

@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign) CGSize size;

/**
 寻找当前view所在的主视图控制器
 
 @return 返回当前主视图控制器
 */
- (UIViewController *)viewController;

@end
