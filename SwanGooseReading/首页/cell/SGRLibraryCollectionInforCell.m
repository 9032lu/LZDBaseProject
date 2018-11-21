//
//  SGRLibraryCollectionInforCell.m
//  SwanGooseReading
//
//  Created by ZhangTu on 2018/11/20.
//  Copyright © 2018年 Test. All rights reserved.
//

#import "SGRLibraryCollectionInforCell.h"

@implementation SGRLibraryCollectionInforCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.address.font = self.detailAddress.font = self.collectionCode.font = BMsmallFont;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
