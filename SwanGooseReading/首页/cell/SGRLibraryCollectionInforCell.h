//
//  SGRLibraryCollectionInforCell.h
//  SwanGooseReading
//
//  Created by ZhangTu on 2018/11/20.
//  Copyright © 2018年 Test. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
static NSString *const SGRLibraryCollectionInforCellID = @"SGRLibraryCollectionInforCell";

@interface SGRLibraryCollectionInforCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *address;
@property (weak, nonatomic) IBOutlet UILabel *detailAddress;
@property (weak, nonatomic) IBOutlet UILabel *collectionCode;
@property (weak, nonatomic) IBOutlet UIImageView *stateImg;

@end

NS_ASSUME_NONNULL_END
