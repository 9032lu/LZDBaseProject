//
//  SGRQRcodeCell.m
//  SwanGooseReading
//
//  Created by ZhangTu on 2018/11/19.
//  Copyright © 2018年 Test. All rights reserved.
//

#import "SGRQRcodeCell.h"
@interface SGRQRcodeCell()
@property (weak, nonatomic) IBOutlet UILabel *lab;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scanBtnWidth;

@end
@implementation SGRQRcodeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.scanBtnWidth.constant = 80*fontScale;
    self.lab.font = BMNormalFont;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
