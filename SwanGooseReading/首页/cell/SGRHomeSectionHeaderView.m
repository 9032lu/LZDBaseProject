//
//  SGRHomeSectionHeaderView.m
//  SwanGooseReading
//
//  Created by ZhangTu on 2018/11/19.
//  Copyright © 2018年 Test. All rights reserved.
//

#import "SGRHomeSectionHeaderView.h"

@implementation SGRHomeSectionHeaderView

- (instancetype)initWithReuseIdentifier:(nullable NSString *)reuseIdentifier
{
    
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        
        [self creatSubviews];
    }
    
    return self;
    
    
}

-(void)creatSubviews{
    
    UIView *backView = [[UIView alloc]init];
    backView.backgroundColor = [UIColor whiteColor];
    [self addSubview:backView];
    
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.right.mas_equalTo(0);
    }];
    UIView *line = [[UIView alloc]init];
    line.backgroundColor = LZDMainColor;
    [backView addSubview:line];

    [line mas_makeConstraints:^(MASConstraintMaker *make) {

        make.left.mas_equalTo(15);
        make.top.mas_equalTo(15);
        make.bottom.mas_equalTo(0);
        make.width.mas_equalTo(6);
    }];
    UILabel *labe = [[UILabel alloc]init];
    labe.font = BMTitleFont;
    labe.textColor = RGB(51,51,51);
    labe.userInteractionEnabled = YES;
    labe.text = @"在借图书";
    [backView addSubview:labe];
    self.lab = labe;
    [labe mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(line.mas_right).offset(9);
        make.top.bottom.mas_equalTo(line);
        make.right.mas_lessThanOrEqualTo(-8);

    }];
    
  
    
    
}
@end
