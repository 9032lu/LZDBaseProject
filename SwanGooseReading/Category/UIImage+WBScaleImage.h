//
//  UIImage+WBScaleImage.h
//  WorkBench
//
//  Created by ZhangTu on 2017/8/16.
//  Copyright © 2017年 zhangtu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (WBScaleImage)
/**
 缩放图片到指定Size
 */
- (UIImage *)scaleImageWithSize:(CGSize)size;


+ (UIImage *)resizingImageWithName:(NSString *)name;

@end
