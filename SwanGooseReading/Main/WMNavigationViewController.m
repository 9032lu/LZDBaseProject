//
//  WMNavigationViewController.m
//  WormManager
//
//  Created by ZhangTu on 2017/10/18.
//  Copyright © 2017年 zhangtu. All rights reserved.
//

#import "WMNavigationViewController.h"

@interface WMNavigationViewController ()<UIGestureRecognizerDelegate,UINavigationControllerDelegate>

@end

@implementation WMNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.interactivePopGestureRecognizer.delegate = self;
    self.delegate = self;
    [self.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    self.navigationBar.shadowImage = [UIImage new];
    self.navigationBar.translucent = YES;
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:largeFont}];
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        UIButton *leftButton = [[UIButton alloc]initWithFrame:CGRectMake(0,0,15,30)];
        [leftButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        [leftButton setImage:[UIImage imageNamed:@"pop_arrow"] forState:UIControlStateNormal];
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
