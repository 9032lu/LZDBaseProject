//
//  MD5Tool.h
//  Book worm
//
//  Created by ZhangTu on 2017/6/21.
//  Copyright © 2017年 zhangtu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MD5Tool : NSObject

/**
 *  MD5加密, 32位 小写
 *
 *  @param str 传入要加密的字符串
 *
 *  @return 返回加密后的字符串
 */
+(NSString *)MD5ForLower32Bate:(NSString *)str;

@end
