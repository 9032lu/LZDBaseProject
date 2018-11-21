//
//  SGRSetTableViewCell.m
//  SwanGooseReading
//
//  Created by ZhangTu on 2018/11/19.
//  Copyright © 2018年 Test. All rights reserved.
//

#import "SGRSetTableViewCell.h"

@implementation SGRSetTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.textLabel.font = self.detailLab.font =BMNormalFont;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
