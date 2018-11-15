//
//  UIImage+WBScaleImage.m
//  WorkBench
//
//  Created by ZhangTu on 2017/8/16.
//  Copyright © 2017年 zhangtu. All rights reserved.
//

#import "UIImage+WBScaleImage.h"

@implementation UIImage (WBScaleImage)
/**
 缩放图片到指定Size
 */
- (UIImage *)scaleImageWithSize:(CGSize)size{
    
    //创建上下文
    UIGraphicsBeginImageContextWithOptions(size, YES, self.scale);
    
    //绘图
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    //获取新图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}


+ (UIImage *)resizingImageWithName:(NSString *)name
{
    UIImage *normalImg = [UIImage imageNamed:name];
    
    CGFloat w = normalImg.size.width * 0.5f;
    CGFloat h = normalImg.size.height * 0.5f;
    
    return [normalImg resizableImageWithCapInsets:UIEdgeInsetsMake(h, w, h, w)];
}

@end
