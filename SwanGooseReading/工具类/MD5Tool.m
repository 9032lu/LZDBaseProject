//
//  MD5Tool.m
//  Book worm
//
//  Created by ZhangTu on 2017/6/21.
//  Copyright © 2017年 zhangtu. All rights reserved.
//

#import "MD5Tool.h"
#import <CommonCrypto/CommonCrypto.h>
@implementation MD5Tool
#pragma mark - 32位 小写
+(NSString *)MD5ForLower32Bate:(NSString *)str{
    
    //要进行UTF8的转码
    const char* input = [str UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(input, (CC_LONG)strlen(input), result);
    NSMutableString *digest = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (NSInteger i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [digest appendFormat:@"%02x", result[i]];
    }
    
    return digest;
}

@end
