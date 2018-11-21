//
//  SGRSetNewPassWordViewController.m
//  SwanGooseReading
//
//  Created by ZhangTu on 2018/11/19.
//  Copyright © 2018年 Test. All rights reserved.
//

#import "SGRSetNewPassWordViewController.h"

@interface SGRSetNewPassWordViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIButton *sureBtn;
@property (weak, nonatomic) IBOutlet UITextField *oldPassWord;
@property (weak, nonatomic) IBOutlet UITextField *passWordNew;
@property (weak, nonatomic) IBOutlet UITextField *surePassWord;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topConstanst;

@end

@implementation SGRSetNewPassWordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"修改密码";
    SETTitleTextColorFont
    if (@available(iOS 11.0, *)) {
        self.topConstanst.constant = 11;
    }else{
        self.topConstanst.constant = StatusBarAndNavigationBarHeight+11;
    }

    self.oldPassWord.font = self.passWordNew.font = self.surePassWord.font = BMFifteenFont;
    self.sureBtn.titleLabel.font = BMNormalFont;
}
- (IBAction)sureBtnClick:(id)sender {
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

@end
