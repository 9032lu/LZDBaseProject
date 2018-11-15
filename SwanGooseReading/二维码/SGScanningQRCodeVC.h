//
//  SGScanningQRCodeVC.h
//  SGQRCodeExample
//
//  Created by Sorgle on 16/8/25.
//  Copyright © 2016年 Sorgle. All rights reserved.
//
//  - - - - - - - - - - - - - - 交流QQ：1357127436 - - - - - - - - - - - - - - - //
//
//  - - 如在使用中, 遇到什么问题或者有更好建议者, 请于 kingsic@126.com 邮箱联系 - - - - //
//  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
//  - - GitHub下载地址 https://github.com/kingsic/SGQRCode.git - - - - - - - - - //
//
//  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - //


typedef enum : NSUInteger {
    from_findbook,
} FROM;
#import <UIKit/UIKit.h>
typedef void(^ScanBLOCK)(NSString *value);
@interface SGScanningQRCodeVC : UIViewController


/**
 <#Description#>
 */
@property (nonatomic,assign) FROM  from;
@property (nonatomic, assign) int type;//
@property (nonatomic, assign) int lendType;
@property (nonatomic, assign) int lectureType;
@property (nonatomic,strong) ScanBLOCK scanBlcok;
@property(nonatomic,copy)void(^myBlock)(NSString *);

@property (nonatomic,strong) NSDictionary *lectureDic;
@end
