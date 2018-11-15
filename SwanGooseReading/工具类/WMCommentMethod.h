//
//  WMCommentMethod.h
//  WormManager
//
//  Created by ZhangTu on 2018/6/1.
//  Copyright © 2018年 zhangtu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WMCommentMethod : NSObject



/**
 * 过滤value中的空值 -----引入头文件后，在需要的地方直接这样写SafeValue(你需要判断过滤的值)
 */
NSString *SafeValue(id value);

@end
