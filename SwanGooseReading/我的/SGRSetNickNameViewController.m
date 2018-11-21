//
//  SGRSetNickNameViewController.m
//  SwanGooseReading
//
//  Created by ZhangTu on 2018/11/16.
//  Copyright © 2018年 Test. All rights reserved.
//

#import "SGRSetNickNameViewController.h"

@interface SGRSetNickNameViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nickName;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topConstant;

@end

@implementation SGRSetNickNameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"昵称";
    SETTitleTextColorFont
    self.nickName.font = BMNormalFont;
    
    if (@available(iOS 11.0, *)) {
        self.topConstant.constant = 0;
    }else{
        self.topConstant.constant = StatusBarAndNavigationBarHeight;
    }
    
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(0, 0, 40, 40);
    [rightBtn setTitle:@"保存" forState:0];
    rightBtn.titleLabel.font = BMNormalFont;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    [[rightBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
       
        LZDLog(@"--保存--")
    }];

    
    
    
    // Do any additional setup after loading the view from its nib.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}
@end
