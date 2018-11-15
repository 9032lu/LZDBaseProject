//
//  UploadImage.h
//  Snail
//
//  Created by ZhangTu on 2016/11/13.
//  Copyright © 2016年 ZhangTu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UploadImage : NSObject

/* 图片二进制数据 */
@property (nonatomic, strong) NSData *data;
/* 服务器对应的参数名称 */
@property (nonatomic, copy) NSString *name;
/* 文件名称 */
@property (nonatomic, copy) NSString *filename;
/* 文件的类型（image/png,image/jpg等） */
@property (nonatomic, copy) NSString *maintype;

@end
