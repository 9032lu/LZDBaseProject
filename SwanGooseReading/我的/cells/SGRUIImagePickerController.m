//
//  SGRUIImagePickerController.m
//  SwanGooseReading
//
//  Created by ZhangTu on 2018/11/21.
//  Copyright © 2018年 Test. All rights reserved.
//

#import "SGRUIImagePickerController.h"

@interface SGRUIImagePickerController ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@end

@implementation SGRUIImagePickerController

//-(instancetype)init{
//    self = [super init];
//
//    if (self) {
//        [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"bg_40px"] forBarMetrics:UIBarMetricsDefault];
//        self.navigationBar.tintColor = [UIColor whiteColor];
//
//    }
//    return self;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"bg_40px"] forBarMetrics:UIBarMetricsDefault];
    self.navigationBar.tintColor = [UIColor whiteColor];

}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        UIButton *leftButton = [[UIButton alloc]initWithFrame:CGRectMake(0,0,21,19.5)];
        [leftButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        [leftButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        [leftButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateHighlighted];
        
        leftButton.titleLabel.textColor = [UIColor whiteColor];
        UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
        viewController.navigationItem.leftBarButtonItem = leftItem;
        
    }
    
    [super pushViewController:viewController animated:YES];
}

-(void)back {
    
    [self popViewControllerAnimated:YES];
}

@end
