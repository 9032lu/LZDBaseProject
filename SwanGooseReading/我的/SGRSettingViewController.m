//
//  SGRSettingViewController.m
//  SwanGooseReading
//
//  Created by ZhangTu on 2018/11/16.
//  Copyright © 2018年 Test. All rights reserved.
//

#import "SGRSettingViewController.h"
#import "SGRSetNickNameViewController.h"
#import "SGRSetNewPassWordViewController.h"
#import <AVFoundation/AVCaptureDevice.h>
#import "SGRSetTableViewCell.h"
#import "SGRUIImagePickerController.h"

@interface SGRSettingViewController ()<UITableViewDataSource,UITableViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    UIImage *selectImg;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;
/**
 <#Description#>
 */
@property (nonatomic,strong) UIImageView *headerImgView;
@end

@implementation SGRSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    SETTitleTextColorFont
    self.tableView.rowHeight = 53;
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SGRSetTableViewCell class]) bundle:nil] forCellReuseIdentifier:SGRSetTableViewCellID];
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return section==1?1:2;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return section?0.01:15;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SGRSetTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SGRSetTableViewCellID];
    
  
    
    cell.headerImgView.hidden = !(indexPath.section==0 &&indexPath.row==0);
    cell.detailLab.hidden = !(indexPath.section==0 &&indexPath.row==1);
    self.headerImgView= cell.headerImgView;
    
    cell.headerImgView.image = selectImg?selectImg:[UIImage imageNamed:@"pic"];
    NSArray *titlearr = @[@[@"头像",@"昵称"],@[@"修改借书卡密码"]];
    NSArray *contarr = @[@[@"",@"张三"],@[@""]];
    
    cell.textLabel.text = titlearr[indexPath.section][indexPath.row];
    cell.detailTextLabel.text = contarr[indexPath.section][indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        
        if (indexPath.row == 0) {

            [self setUserHeaderImg];
        }else{
            
            PUSH(SGRSetNickNameViewController)
        }
    }else{
        
        PUSH(SGRSetNewPassWordViewController)
    }
}

-(void)setUserHeaderImg{
    //修改头像
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"选择图片" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *photoAction = [UIAlertAction actionWithTitle:@"相册获取" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        // 获取用户的权限
        // 询问用户要求权限
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
            // 实例化图片选择器
            SGRUIImagePickerController *imagePicker = [[SGRUIImagePickerController alloc]init];
       
           
       
            // 设置图片选择器的数据类型
            imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            // 设置代理
            imagePicker.delegate = self;
            // 进入图片选择器
            [self presentViewController:imagePicker animated:YES completion:nil];
        }else{
            
        }
    }];
    [alert addAction:photoAction];
    
    UIAlertAction *camaraAction = [UIAlertAction actionWithTitle:@"直接拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //相机权限
        NSString * mediaType = AVMediaTypeVideo;
        AVAuthorizationStatus  authorizationStatus = [AVCaptureDevice authorizationStatusForMediaType:mediaType];
        
        if (authorizationStatus == AVAuthorizationStatusRestricted || authorizationStatus == AVAuthorizationStatusDenied) {
            
            [TopUpVC showAlertControllerNavgation:self Tittle:@"温馨提示" Message:@"请去->打开访问权限" Btn_f:@"取 消" Btn_s:@"确 定" Action:^{
                
                NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
                if ([[UIApplication sharedApplication]canOpenURL:url]) {
                    [[UIApplication sharedApplication]openURL:url];
                }
            }];
            
        }else if ([UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear]) {
            // 请求用户权限
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
                SGRUIImagePickerController *picker = [[SGRUIImagePickerController alloc]init];

                picker.sourceType = UIImagePickerControllerSourceTypeCamera;
                picker.delegate = self;
                [self presentViewController:picker animated:YES completion:nil];
            }else{
                NSLog(@"用户拒绝访问相机");
            }
        }else{
            NSLog(@"无有效摄像头可供使用");
        }
    }];
    [alert addAction:camaraAction];
    
    UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }];
    [alert addAction:cancleAction];
    
    [self presentViewController:alert animated:YES completion:nil];
}

//图片选择器的方法
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
//    UIGraphicsBeginImageContextWithOptions(self.headerImgView.frame.size, YES, 10.0);
//
//    //将下载完的Image对象绘制到图形上下文
//
//    CGFloat width = self.headerImgView.frame.size.width;
//
//    CGFloat height = width * image.size.height/image.size.width;
//
//    [image drawInRect:CGRectMake(0, 0, width, height)];
//
//    //获得图片
//
//    image = UIGraphicsGetImageFromCurrentImageContext();
//
//    //结束图形上下文
//
//    UIGraphicsEndImageContext();
    selectImg = image;
    self.headerImgView.image = image;
//    NSString *url = [NSString stringWithFormat:@"%@api/user/editHeader.html", URLHeader];
//    NSUserDefaults * userDefault=[NSUserDefaults standardUserDefaults];
//    NSString * token=[userDefault  stringForKey:@"token"];
//    NSString * userId=[userDefault stringForKey:@"userId"];
//    NSDictionary *pramas = @{@"userId":userId,@"token":token,@"coverFile":image};
//    NSLog(@"--%@",pramas);
//    [Manager uploadImageWithUrl:url Parameters:pramas UploadImage:image Success:^(id responseObject) {
//        id code = responseObject[@"code"];
//        NSDictionary *tempDic = responseObject[@"data"];
//        if ([code isEqual:@1]) {
//
//            [MBManager showBriefAlert:@"设置成功" inView:self.view.window];
//            [userDefault setValue:tempDic[@"cover"] forKey:@"cover"];
//
//        }else{
//            [MBManager showBriefAlert:@"设置失败" inView:self.view.window];
//        }
//    } Failure:^(NSError *error) {
//
//    }];
//
    
    MJWeakSelf
    [picker dismissViewControllerAnimated:YES completion:^{
        
        [weakSelf.tableView reloadData];
    }];
    
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    
    [picker dismissViewControllerAnimated:YES completion:nil];

}




@end
