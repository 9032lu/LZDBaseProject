//
//  SGRQRcodeCell.h
//  SwanGooseReading
//
//  Created by ZhangTu on 2018/11/19.
//  Copyright © 2018年 Test. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

static NSString * const SGRQRcodeCellID = @"SGRQRcodeCell";

@interface SGRQRcodeCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *scanCodeBtn;

@end

NS_ASSUME_NONNULL_END
