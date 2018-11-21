//
//  SGRRegistViewController.m
//  SwanGooseReading
//
//  Created by ZhangTu on 2018/11/16.
//  Copyright © 2018年 Test. All rights reserved.
//

#import "SGRRegistViewController.h"
#import "SGRBindCardViewController.h"

@interface SGRRegistViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *phoneTF;
@property (weak, nonatomic) IBOutlet UITextField *codeTF;
@property (weak, nonatomic) IBOutlet UITextField *passWordTF;
@property (weak, nonatomic) IBOutlet UITextField *surePassWordTF;
@property (weak, nonatomic) IBOutlet UIButton *codeBtn;
@property (weak, nonatomic) IBOutlet UIButton *registBtn;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topConstanst;
@property (weak, nonatomic) IBOutlet UIView *surePassWordView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *backViewheight;

@end

@implementation SGRRegistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (_formType == LOGINFROMTYPE_regist) {
        self.navigationItem.title = @"新用户注册";
        self.surePassWordView.hidden = YES;
        self.backViewheight.constant = 141;
    }else{
        [self.registBtn setTitle:@"找回" forState:0];
        self.navigationItem.title = @"找回密码";

    }
    SETTitleTextColorFont
    self.phoneTF.font = self.codeTF.font = self.passWordTF.font =self.codeBtn.titleLabel.font= BMsmallFont;
    self.registBtn.titleLabel.font = BMNormalFont;

    if (@available(iOS 11.0, *)) {
        self.topConstanst.constant = 0;
    }else{
        self.topConstanst.constant = StatusBarAndNavigationBarHeight;
    }


}
- (IBAction)getCodeClick:(UIButton *)sender {
}

- (IBAction)registBtnClcik:(id)sender {
    
    if (_formType ==LOGINFROMTYPE_regist) {
        PUSH(SGRBindCardViewController)
    }
    
    
}
- (IBAction)showPasswBtnClick:(UIButton *)sender {
    
    sender.selected = !sender.isSelected;
    self.passWordTF.secureTextEntry = !sender.isSelected;

    
}


@end
