//
//  TopUpVC.m
//  Book worm
//
//  Created by ZhangTu on 2016/12/5.
//  Copyright © 2016年 zhangtu. All rights reserved.
//

#import "TopUpVC.h"
#import <objc/runtime.h>
@interface TopUpVC ()

@end

@implementation TopUpVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
  
    
    // Do any additional setup after loading the view.
}

+ (void)showAlertControllerNavgation:(id)navgat Tittle:(NSString *)tittle Message:(NSString *)massage Btn_f:(NSString *)btnf Btn_s:(NSString *)btns Action:(void (^)())action {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:tittle message:massage preferredStyle:UIAlertControllerStyleAlert];
    
    if (btnf != nil) {
        UIAlertAction *cancle = [UIAlertAction actionWithTitle:btnf style:UIAlertActionStyleCancel handler:nil];
        [alertController addAction:cancle];
        
//        if ([cancle valueForKey:@"titleTextColor"]) {
//            [cancle setValue:[UIColor lightGrayColor] forKey:@"titleTextColor"];
//        }
    }
    if (btns != nil) {
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:btns style:UIAlertActionStyleDefault handler:action];
        [alertController addAction:okAction];
//        if ([okAction valueForKey:@"titleTextColor"]) {
//            [okAction setValue:themeColor forKey:@"titleTextColor"];
//        }
        
        
        
    }
    [navgat presentViewController:alertController animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
