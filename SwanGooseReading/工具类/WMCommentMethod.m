//
//  WMCommentMethod.m
//  WormManager
//
//  Created by ZhangTu on 2018/6/1.
//  Copyright © 2018年 zhangtu. All rights reserved.
//

#import "WMCommentMethod.h"

@implementation WMCommentMethod

NSString *SafeValue(id value) {
    if(!value) {
        return @"";
    }else if ([value isKindOfClass:[NSString class]]) {
        if ([value isEqualToString:@"<null>"] || [value isEqualToString:@"(null)"]) {
            return @"";
        }
        return value;
    }else {
        return [NSString stringWithFormat:@"%@",value];
    }
}
@end
