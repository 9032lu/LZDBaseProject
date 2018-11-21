//
//  SGRBorrowedBookCell.h
//  SwanGooseReading
//
//  Created by ZhangTu on 2018/11/16.
//  Copyright © 2018年 Test. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

static NSString *const borrowedBookCellID  = @"SGRBorrowedBookCellID";
@interface SGRBorrowedBookCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *bookImg;
@property (weak, nonatomic) IBOutlet UILabel *author;
@property (weak, nonatomic) IBOutlet UILabel *bookName;
@property (weak, nonatomic) IBOutlet UIButton *reBorrrowBookBtn;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bookImgWidth;
@property (weak, nonatomic) IBOutlet UILabel *dateLab;

@end

NS_ASSUME_NONNULL_END
