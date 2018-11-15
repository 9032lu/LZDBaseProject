//
//  Manager.h
//  Snail
//
//  Created by ZhangTu on 2016/11/12.
//  Copyright © 2016年 ZhangTu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UploadImage;
typedef void(^HttpUploadSuccessBlock)(id Json);
typedef void(^HttpUploadFailureBlock)();
typedef void(^progressBlock)(id progress);
@interface Manager : NSObject

// post请求
+ (void)getDataPostWithUrl: (NSString *)url Parameters: (id)parameter Success: (void (^) (id responseObject))success Failure: (void (^) (NSError *error))failure;
// get请求
+ (void)getDataGetWithUrl: (NSString *)url Parameters:(id)parameter Success: (void (^) (id responseObject))success Failure: (void (^) (NSError *error))failure;
// 上传图片
+ (void)uploadImageWithUrl: (NSString *)url Parameters: (id)parameter UploadImage :(UploadImage *)uploadImage Success: (void (^) (id responseObject))success Failure: (void (^) (NSError *error))failure;
// 检测网络状态
+ (void)monitoringNetStatus: (void (^)(id))netStatus;
+ (void)uploadImageWithPath:(NSString *)path photos:(NSArray *)photos params:(NSDictionary *)params currentProgress:(progressBlock)currentProgress success:(HttpUploadSuccessBlock)success failure:(HttpUploadFailureBlock)failure;

+ (void)cancelAllTasks;
@end
