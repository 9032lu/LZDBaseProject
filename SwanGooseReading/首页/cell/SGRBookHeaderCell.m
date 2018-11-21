//
//  SGRBookHeaderCell.m
//  SwanGooseReading
//
//  Created by ZhangTu on 2018/11/20.
//  Copyright © 2018年 Test. All rights reserved.
//

#import "SGRBookHeaderCell.h"

@implementation SGRBookHeaderCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.bookImgWidth.constant = 93*fontScale;
    self.bookName.font = [UIFont boldSystemFontOfSize:17*fontScale];
    self.author.font = self.publisher.font = self.publishDate.font = self.isbn.font =BMsmallFont;
    
    self.introduceTitle.font = BMNormalFont;
    self.collectionTiltle.font = BMNormalFont;
    self.introductionLab.font = BMsmallFont;
    self.foldBtn.titleLabel.font = BMsmallFont;
    
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
