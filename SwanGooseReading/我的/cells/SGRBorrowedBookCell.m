//
//  SGRBorrowedBookCell.m
//  SwanGooseReading
//
//  Created by ZhangTu on 2018/11/16.
//  Copyright © 2018年 Test. All rights reserved.
//

#import "SGRBorrowedBookCell.h"

@implementation SGRBorrowedBookCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.bookName.font = [UIFont boldSystemFontOfSize:15];
    self.author.font = self.dateLab.font = BMsmallFont;
    self.reBorrrowBookBtn.titleLabel.font = BMsmallFont;
    self.bookImgWidth.constant = 93*fontScale;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
