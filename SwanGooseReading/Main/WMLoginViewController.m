//
//  WMLoginViewController.m
//  WormManager
//
//  Created by ZhangTu on 2018/1/10.
//  Copyright © 2018年 zhangtu. All rights reserved.
//

#import "WMLoginViewController.h"
#import "WMTabbarController.h"
//#import "WMForgetViewController.h"
#import "sys/utsname.h"
#import "MD5Tool.h"
@interface WMLoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UIButton *registBtn;
@property (weak, nonatomic) IBOutlet UIButton *forgetBtn;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;


@end

@implementation WMLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.userName setValue:[UIColor lightGrayColor] forKeyPath:@"_placeholderLabel.textColor"];
    [self.password setValue:[UIColor lightGrayColor] forKeyPath:@"_placeholderLabel.textColor"];
    self.forgetBtn.titleLabel.font = self.registBtn.titleLabel.font = BMsmallFont;
    self.loginBtn.titleLabel.font = [UIFont systemFontOfSize:15*fontScale];
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];

    if ([[userDefault objectForKey:@"login"] boolValue]) {
        _userName.text = [userDefault objectForKey:@"LZDUserName"];
        _password.text = [userDefault objectForKey:@"LZDPassWord"];

    }else{
        _userName.text =   _password.text = @"";
    }
    
 
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.view endEditing:YES];
}
//登录
- (IBAction)login:(id)sender {
    
    MJWeakSelf
    if ([self judgeTextField]){
        
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        NSString *urlStr = [NSString stringWithFormat:@"%@%@",URLHeader,@"librarian/index/loginDo.html"];
        NSMutableDictionary *param = [NSMutableDictionary dictionary];
        param[@"name"] = self.userName.text;
        NSString *passwordMD = [MD5Tool MD5ForLower32Bate:self.password.text];
        param[@"pass"] = passwordMD;
        param[@"deviceName"] = [self getDeviceName];
        param[@"deviceId"] = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
        param[@"deviceVersion"] = [UIDevice currentDevice].systemVersion;
        param[@"deviceType"] = @"iOS";
        
        [Manager getDataPostWithUrl:urlStr Parameters:param Success:^(id responseObject) {
            LZDLog(@"url:%@  result: %@",urlStr,responseObject)
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            id code = responseObject[@"code"];
            NSString *msg = responseObject[@"msg"];
            if ([code isEqual:@1]) {
                
                
                NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
                NSMutableDictionary *muta_dic = [NSMutableDictionary dictionary];
                
//                for (NSString*key in [responseObject[@"data"] allKeys]) {
//
//                    [muta_dic setValue:[NSString getTheNoNullStr:responseObject[@"data"][key] andRepalceStr:@""] forKey:key];
//
//                }
//
//                [userDefault setValue:muta_dic forKey:USER_INFO_KEY];
                
                
                [userDefault synchronize];
                
//                if (self.remberBtn.isSelected) {
//                    [userDefault setBool:YES forKey:@"login"];
//
//                    [userDefault setValue:weakSelf.userName.text forKey:@"LZDUserName"];
//                    [userDefault setValue:weakSelf.password.text forKey:@"LZDPassWord"];
//
//
//                }
                
               
                [MBManager showBriefAlert:@"登录成功！" inView:self.view.window];
                
                WMTabbarController *tabBarVC = [[WMTabbarController alloc]init];
                self.view.window.rootViewController = tabBarVC;
                
                NSLog(@"presentingViewController---%@",self.presentingViewController);

                
                if (self.presentingViewController) {
                    [self dismissViewControllerAnimated:NO completion:^{
                        
                    }];
                }
                
              
                
            }else{
                
                [MBManager showBriefAlert:msg inView:self.view.window];
                
            }
            
        } Failure:^(NSError *error) {
            
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            
        }];
    }
    
}
- (IBAction)registBtnClick:(UIButton *)sender {
}

//忘记密码
- (IBAction)forgetPassword:(id)sender {
    
//    WMForgetViewController *forgetVC = [[WMForgetViewController alloc]init];
//    [self presentViewController:forgetVC animated:YES completion:nil];
}
//记住密码
- (IBAction)rememberPassword:(UIButton *)sender {
    
    sender.selected = !sender.selected;
    
}
-(BOOL)judgeTextField{
    
    if (self.userName.text.length == 0) {
        
        [MBManager showBriefAlert:@"账号不能为空!" inView:self.view.window];
        return NO;
    }else if (self.password.text.length == 0){
        
        [MBManager showBriefAlert:@"密码不能为空!" inView:self.view.window];
        return NO;
    }else{
        
        return YES;
    }
    
}

// 获取设备型号然后手动转化为对应名称
- (NSString *)getDeviceName
{
    
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    if ([deviceString isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
    if ([deviceString isEqualToString:@"iPhone3,2"])    return @"iPhone 4";
    if ([deviceString isEqualToString:@"iPhone3,3"])    return @"iPhone 4";
    if ([deviceString isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([deviceString isEqualToString:@"iPhone5,1"])    return @"iPhone 5";
    if ([deviceString isEqualToString:@"iPhone5,2"])    return @"iPhone 5 (GSM+CDMA)";
    if ([deviceString isEqualToString:@"iPhone5,3"])    return @"iPhone 5c (GSM)";
    if ([deviceString isEqualToString:@"iPhone5,4"])    return @"iPhone 5c (GSM+CDMA)";
    if ([deviceString isEqualToString:@"iPhone6,1"])    return @"iPhone 5s (GSM)";
    if ([deviceString isEqualToString:@"iPhone6,2"])    return @"iPhone 5s (GSM+CDMA)";
    if ([deviceString isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus";
    if ([deviceString isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
    if ([deviceString isEqualToString:@"iPhone8,1"])    return @"iPhone 6s";
    if ([deviceString isEqualToString:@"iPhone8,2"])    return @"iPhone 6s Plus";
    if ([deviceString isEqualToString:@"iPhone8,4"])    return @"iPhone SE";
    // 日行两款手机型号均为日本独占，可能使用索尼FeliCa支付方案而不是苹果支付
    if ([deviceString isEqualToString:@"iPhone9,1"])    return @"国行、日版、港行iPhone 7";
    if ([deviceString isEqualToString:@"iPhone9,2"])    return @"港行、国行iPhone 7 Plus";
    if ([deviceString isEqualToString:@"iPhone9,3"])    return @"美版、台版iPhone 7";
    if ([deviceString isEqualToString:@"iPhone9,4"])    return @"美版、台版iPhone 7 Plus";
    if ([deviceString isEqualToString:@"iPhone10,1"]) return @"iPhone 8";
    if ([deviceString isEqualToString:@"iPhone10,4"]) return @"iPhone 8";
    if ([deviceString isEqualToString:@"iPhone10,2"]) return @"iPhone 8 Plus";
    if ([deviceString isEqualToString:@"iPhone10,5"]) return @"iPhone 8 Plus";
    if ([deviceString isEqualToString:@"iPhone10,3"]) return @"iPhone X";
    if ([deviceString isEqualToString:@"iPhone10,6"]) return @"iPhone X";
    
    return deviceString;
}
@end
