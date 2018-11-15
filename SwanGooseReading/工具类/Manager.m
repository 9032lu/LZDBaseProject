//
//  Manager.m
//  Snail
//
//  Created by ZhangTu on 2016/11/12.
//  Copyright © 2016年 ZhangTu. All rights reserved.
//

#import "Manager.h"
#import "UploadImage.h"
#import "AFNetworking.h"

@implementation Manager

static id _instance;

static AFHTTPSessionManager *manager ;
+ (AFHTTPSessionManager *)sharedHTTPSession {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        manager = [AFHTTPSessionManager manager];
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/html", @"text/json", @"text/javascript",@"text/plain",@"var",nil];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        manager.responseSerializer = [AFJSONResponseSerializer serializer];
        manager.requestSerializer = [AFHTTPRequestSerializer serializer];
        
        /* 请求队列最大并发数 */
        manager.operationQueue.maxConcurrentOperationCount = 5;
        /* 请求超时的时间 */
        manager.requestSerializer.timeoutInterval = RequestTimeOut;
    });
    return manager;
}
static AFNetworkReachabilityManager * networkManager ;
+ (AFNetworkReachabilityManager *)sharedNetworkManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        networkManager = [AFNetworkReachabilityManager manager];
        
    });
    return networkManager;
}


+ (void)getDataGetWithUrl: (NSString *)url Parameters:(id)parameter Success: (void (^) (id responseObject))success Failure: (void (^) (NSError *error))failure {
    AFHTTPSessionManager *Manager = [self sharedHTTPSession];
    
    /* 数据请求 */
    
     [Manager GET:url parameters:parameter progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
  
}

+ (void)getDataPostWithUrl: (NSString *)url Parameters: (id)parameter Success: (void (^) (id responseObject))success Failure: (void (^) (NSError *error))failure {
    
    AFHTTPSessionManager *Manager = [self sharedHTTPSession];
    NSLog(@"url:%@",url);
    [Manager.operationQueue cancelAllOperations];
    
    [Manager POST:url parameters:parameter progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
            
            if ([error.localizedDescription isEqualToString:@"已取消"]){
            
                
            }else{
            
//                NSString *str = [NSString stringWithFormat:@"%@请重新加载或联系管理员！",error.localizedDescription];
//                [MBManager showBriefAlert:str inView:[UIApplication sharedApplication].keyWindow];
            }
            
        }
    }];
}

+ (void)uploadImageWithUrl: (NSString *)url Parameters: (id)parameter UploadImage :(UIImage *)uploadImage Success: (void (^) (id responseObject))success Failure: (void (^) (NSError *error))failure {
    
    AFHTTPSessionManager *Manager = [self sharedHTTPSession];
    [Manager POST:url parameters:parameter constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        if (uploadImage != nil) {
            NSData *imgData = UIImageJPEGRepresentation(uploadImage, 0.05);
            [formData appendPartWithFileData:imgData name:@"coverFile" fileName:@"png" mimeType:@"image/png"];
        }
    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}

+ (void)monitoringNetStatus:(void (^)(id responseObject))netStatus {
    AFNetworkReachabilityManager * manager = [self sharedNetworkManager];
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
                if (netStatus) {
                    netStatus(@"未知网络类型");
                }
                break;
                
            case AFNetworkReachabilityStatusNotReachable:
                if (netStatus) {
                    netStatus(@"无可用网络");
                }
                break;
                
            case AFNetworkReachabilityStatusReachableViaWWAN:
                if (netStatus) {
                    netStatus(@"使用蜂窝流量");
                }
                break;
                
            case AFNetworkReachabilityStatusReachableViaWiFi:
                if (netStatus) {
                    netStatus(@"当前WIFI下");
                }
                break;
                
            default:
                break;
        }
    }];
    [manager startMonitoring];
}
#pragma mark 上传多张图片
+ (void)uploadImageWithPath:(NSString *)path photos:(NSArray *)photos params:(NSDictionary *)params currentProgress:(progressBlock)currentProgress success:(HttpUploadSuccessBlock)success failure:(HttpUploadFailureBlock)failure
{
    
    AFHTTPSessionManager *manager = [self sharedHTTPSession];
    [manager POST:path parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        for (int i = 0; i < photos.count; i ++) {
            NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
            formatter.dateFormat=@"yyyyMMddHHmmss";
            NSString *str=[formatter stringFromDate:[NSDate date]];
            NSString *fileName=[NSString stringWithFormat:@"%@.jpg",str];
            UIImage *image = photos[i];
            NSData *imageData = UIImageJPEGRepresentation(image, 0.05);
            [formData appendPartWithFileData:imageData name:[NSString stringWithFormat:@"coverFile%d",i+1] fileName:fileName mimeType:@"image/jpeg"];
        }
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        currentProgress(uploadProgress);
        NSLog(@"uploadProgress is %lld,总字节 is %lld",uploadProgress.completedUnitCount,uploadProgress.totalUnitCount);
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (success){
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSString *str = [NSString stringWithFormat:@"%@请重新加载或联系管理员！",error.localizedDescription];
        [MBManager showBriefAlert:str inView:[UIApplication sharedApplication].keyWindow];
        failure(error);
    }];
}
+ (void)cancelAllTasks{

   AFHTTPSessionManager *Manager = [self sharedHTTPSession];

   [Manager.tasks makeObjectsPerformSelector:@selector(cancel)];
   
}

@end
