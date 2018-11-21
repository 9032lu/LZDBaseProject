//
//  SGRBookHeaderCell.h
//  SwanGooseReading
//
//  Created by ZhangTu on 2018/11/20.
//  Copyright © 2018年 Test. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
static NSString *const SGRBookHeaderCellID = @"SGRBookHeaderCell";

@interface SGRBookHeaderCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *bookImg;
@property (weak, nonatomic) IBOutlet UILabel *bookName;
@property (weak, nonatomic) IBOutlet UILabel *author;
@property (weak, nonatomic) IBOutlet UILabel *publishDate;
@property (weak, nonatomic) IBOutlet UILabel *isbn;
@property (weak, nonatomic) IBOutlet UILabel *publisher;
@property (weak, nonatomic) IBOutlet UILabel *collectionTiltle;
@property (weak, nonatomic) IBOutlet UILabel *introduceTitle;
@property (weak, nonatomic) IBOutlet UILabel *introductionLab;
@property (weak, nonatomic) IBOutlet LZDButton *foldBtn;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bookImgWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *foldBtnHeight;

@end

NS_ASSUME_NONNULL_END
