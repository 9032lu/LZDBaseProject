//
//  SGRBindCardViewController.m
//  SwanGooseReading
//
//  Created by ZhangTu on 2018/11/16.
//  Copyright © 2018年 Test. All rights reserved.
//

#import "SGRBindCardViewController.h"
#import "WMTabbarController.h"

@interface SGRBindCardViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topContanst;
@property (weak, nonatomic) IBOutlet UITextField *cardTF;
@property (weak, nonatomic) IBOutlet UITextField *passWordTF;
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UIButton *sureBtn;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation SGRBindCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"绑定借书卡";
     SETTitleTextColorFont
    self.cardTF.font = self.passWordTF.font = BMsmallFont;
    self.sureBtn.titleLabel.font = self.titleLab.font =  BMNormalFont;
    if (@available(iOS 11.0, *)) {
        self.topContanst.constant = 0;
    }else{
        self.topContanst.constant = StatusBarAndNavigationBarHeight;
    }
    
}

- (IBAction)sureBtnClick:(id)sender {
    WMTabbarController *tab = [[WMTabbarController alloc]init];
    
    [UIApplication sharedApplication].delegate.window.rootViewController = tab;
    
}


@end
