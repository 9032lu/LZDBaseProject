
//
//  SGRBorrowHistoryCell.m
//  SwanGooseReading
//
//  Created by ZhangTu on 2018/11/19.
//  Copyright © 2018年 Test. All rights reserved.
//

#import "SGRBorrowHistoryCell.h"

@implementation SGRBorrowHistoryCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.bookImgWidth.constant = 93*fontScale;
    self.bookName.font = BMNormalFont;
    self.author.font = self.publisher.font = self.publishDate.font = self.isbn.font =BMsmallFont;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
