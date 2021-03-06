//
//  WMTabbarController.m
//  WormManager
//
//  Created by ZhangTu on 2017/10/18.
//  Copyright © 2017年 zhangtu. All rights reserved.
//

#import "WMTabbarController.h"
#import "WMNavigationViewController.h"
#import "SGRMineViewController.h"
#import "SGRHomeViewController.h"


@interface WMTabbarController ()

@end

@implementation WMTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.tabBar.backgroundImage = [self imageWithColor:RGBA(1.0, 1.0, 1.0, 0.0)];
//    self.tabBar.shadowImage = [UIImage new];
//    [[UITabBar appearance] setTranslucent:NO];
    self.tabBar.translucent = NO;
    [self addControllers];
    
}
- (UIStatusBarStyle)preferredStatusBarStyle{

    return UIStatusBarStyleLightContent;
}
-(void)addChildVc:(UIViewController *)chiledVC Withtitle:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage{
    
    chiledVC.tabBarItem.title = title;
//    [chiledVC.tabBarController.tabBar setTintColor:[UIColor clearColor]];
//    chiledVC.navigationItem.title = title;
    chiledVC.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    chiledVC.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    // 设置文字样式
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    NSMutableDictionary *selectedTextAttrs = [NSMutableDictionary dictionary];
    selectedTextAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    [chiledVC.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [chiledVC.tabBarItem setTitleTextAttributes:selectedTextAttrs forState:UIControlStateSelected];
    // 创建并添加导航控制器
    WMNavigationViewController *navigationC = [[WMNavigationViewController alloc]initWithRootViewController:chiledVC];
    [self addChildViewController:navigationC];
}
- (void)addControllers{

    SGRHomeViewController *bookVC = [[SGRHomeViewController alloc]init];
    [self addChildVc:bookVC Withtitle:@"首页" image:@"home-0" selectedImage:@"home-1"];

    SGRMineViewController *spaceVC = [[SGRMineViewController alloc]init];
    [self addChildVc:spaceVC Withtitle:@"我的" image:@"mine-0" selectedImage:@"mine-1"];
//
//    WMScanViewController *scanVC = [[WMScanViewController alloc]init];
//    [self addChildVc:scanVC Withtitle:nil image:@"scanIcon" selectedImage:@"scanIcon"];
//    
//    WMReaderViewController *readerVC = [[WMReaderViewController alloc]init];
//    [self addChildVc:readerVC Withtitle:@"" image:@"读者" selectedImage:@"读者2"];
//
//    WMMineViewController *mineVC = [[WMMineViewController alloc]init];
//    [self addChildVc:mineVC Withtitle:@"" image:@"我的" selectedImage:@"我的2"];
    
}

- (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f,0.0f, 1.0f,1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context =UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image =UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
@end
