//
//  TopUpVC.h
//  Book worm
//
//  Created by ZhangTu on 2016/12/5.
//  Copyright © 2016年 zhangtu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopUpVC : UIViewController

+ (void)showAlertControllerNavgation:(id)navgat Tittle:(NSString *)tittle Message:(NSString *)massage Btn_f:(NSString *)btnf Btn_s:(NSString *)btns Action:(void (^)())action;

@end
