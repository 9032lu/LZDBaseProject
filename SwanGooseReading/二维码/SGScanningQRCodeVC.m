//
//  SGScanningQRCodeVC.m
//  SGQRCodeExample
//
//  Created by Sorgle on 16/8/25.
//  Copyright © 2016年 Sorgle. All rights reserved.
//
//  - - - - - - - - - - - - - - 交流QQ：1357127436 - - - - - - - - - - - - - - - //
//
//  - - 如在使用中, 遇到什么问题或者有更好建议者, 请于 kingsic@126.com 邮箱联系 - - - - //
//  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
//  - - GitHub下载地址 https://github.com/kingsic/SGQRCode.git - - - - - - - - - //
//
//  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - //

#import "SGScanningQRCodeVC.h"
#import <AVFoundation/AVFoundation.h>
#import "SGScanningQRCodeView.h"
//#import "WFScanSuccessViewController.h"
#import "SGQRCodeTool.h"

@interface SGScanningQRCodeVC () <AVCaptureMetadataOutputObjectsDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate>
/** 会话对象 */
@property (nonatomic, strong) AVCaptureSession *session;
/** 图层类 */
@property (nonatomic, strong) AVCaptureVideoPreviewLayer *previewLayer;
@property (nonatomic, strong) SGScanningQRCodeView *scanningView;

@property (nonatomic, strong) UIButton *right_Button;
@property (nonatomic, assign) BOOL first_push;

@end

@implementation SGScanningQRCodeVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    [self.navigationController.navigationBar setTitleTextAttributes:
//     @{NSFontAttributeName:largeFont,
//       NSForegroundColorAttributeName:ZTBTNCOLOR}];
//

//    self.tabBarController.tabBar.hidden = YES;
    
    self.scanningView = [[SGScanningQRCodeView alloc] initWithFrame:self.view.frame outsideViewLayer:self.view.layer];
    [self.view addSubview:self.scanningView];
    [self setupScanningQRCode];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"扫ISNB借书";
   SETTitleTextColorFont
    
    // 创建扫描边框
  
    // 二维码扫描
    
    self.first_push = YES;
    
    // 从相册中读取二维码
//    [self setupRightBarButtonItem];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
//    self.tabBarController.tabBar.hidden = NO;
}

// rightBarButtonItem
- (void)setupRightBarButtonItem {
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"相册" style:(UIBarButtonItemStyleDone) target:self action:@selector(rightBarButtonItenAction)];
}
#pragma mark - - - rightBarButtonItenAction 的点击事件
- (void)rightBarButtonItenAction {
    [self readImageFromAlbum];
}
#pragma mark - - - 从相册中读取照片
- (void)readImageFromAlbum {
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init]; // 创建对象
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary; //（选择类型）表示仅仅从相册中选取照片
    imagePicker.delegate = self; // 指定代理，因此我们要实现UIImagePickerControllerDelegate,  UINavigationControllerDelegate协议
    [self presentViewController:imagePicker animated:YES completion:nil]; // 显示相册
}
#pragma mark - - - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
//    NSLog(@"info - - - %@", info);
    
    [self dismissViewControllerAnimated:YES completion:^{
        [self scanQRCodeFromPhotosInTheAlbum:[info objectForKey:@"selectImg"]];
    }];
}
#pragma mark - - - 从相册中识别二维码, 并进行界面跳转
- (void)scanQRCodeFromPhotosInTheAlbum:(UIImage *)image {
    // CIDetector(CIDetector可用于人脸识别)进行图片解析，从而使我们可以便捷的从相册中获取到二维码
    // 声明一个CIDetector，并设定识别类型 CIDetectorTypeQRCode
    CIDetector *detector = [CIDetector detectorOfType:CIDetectorTypeQRCode context:nil options:@{ CIDetectorAccuracy : CIDetectorAccuracyHigh }];
    
    // 取得识别结果
    NSArray *features = [detector featuresInImage:[CIImage imageWithCGImage:image.CGImage]];
    
//    NSLog(@"扫描结果 － － %@", features);
    
    for (int index = 0; index < [features count]; index ++) {
        CIQRCodeFeature *feature = [features objectAtIndex:index];
        NSString *scannedResult = feature.messageString;
        NSLog(@"result:%@",scannedResult);
        
        if (self.first_push) {
//            WFScanSuccessViewController *jumpVC = [[WFScanSuccessViewController alloc] init];
//            jumpVC.jump_URL = scannedResult;
//            [self.navigationController pushViewController:jumpVC animated:YES];
            
            self.first_push = NO;
        }
    }
}

#pragma mark - - - 二维码扫描
- (void)setupScanningQRCode {
    // 初始化链接对象（会话对象）
    self.session = [[AVCaptureSession alloc] init];
    // 实例化预览图层, 传递_session是为了告诉图层将来显示什么内容
    self.previewLayer = [AVCaptureVideoPreviewLayer layerWithSession:_session];
    [SGQRCodeTool SG_scanningQRCodeOutsideVC:self session:_session previewLayer:_previewLayer];
}

#pragma mark - - - 二维码扫描代理方法
// 调用代理方法，会频繁的扫描
- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection {
    
    // 0、扫描成功之后的提示音
    [self playSoundEffect:@"sound.caf"];

    // 1、如果扫描完成，停止会话
    [self.session stopRunning];
    
    // 2、删除预览图层
    [self.previewLayer removeFromSuperlayer];
    
    // 3、设置界面显示扫描结果
    if (metadataObjects.count > 0) {
        AVMetadataMachineReadableCodeObject *obj = metadataObjects[0];
        NSLog(@"-------%@",obj.stringValue);
        
        if (self.scanBlcok) {
            self.scanBlcok(obj.stringValue);
            
        }
        POP
        
        
        // 扫描结果为二维码
        if ([obj.stringValue hasPrefix:@"http:"]) {

//            if ([obj.stringValue hasPrefix:@"http://t1.beijingzhangtu.com"]) {
//
//                if (self.lectureType == 10001) {//讲座扫码签到
//
//                    if ([obj.stringValue hasPrefix:@"http://r1.beijingzhangtu.com/library/yylectureinfo/wst.html"] || [obj.stringValue hasPrefix:@"http://t1.beijingzhangtu.com/library/yylectureinfo/wst.html"]) {
//
//                        NSArray *arr = [obj.stringValue componentsSeparatedByString:@"="];
//                        NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
//                        NSString *libraryId = [userDefault valueForKey:@"libraryId"];
//                        NSString *token = [userDefault valueForKey:@"token"];
//                        NSString *userId = [userDefault valueForKey:@"userId"];
//                        NSString *url = [NSString stringWithFormat:@"%@api/lectureAppointment/check_LectureAppointment.html", URLHeader];
//                        NSDictionary *parames = @{@"libraryId":libraryId, @"token": token,@"LectureId":arr[1],@"userId":userId};
//
//                        [Manager getDataPostWithUrl:url Parameters:parames Success:^(id responseObject) {
//
//                            id code = responseObject[@"code"];
//                            NSString *msg = responseObject[@"msg"];
//                            if ([code isEqual:@1]) {
//
//                                [MBManager showBriefAlert:@"签到成功" inView:self.view.window];
//
//                                [self.navigationController popViewControllerAnimated:YES];
//
//                            }else if ([code isEqual:@0]){
//
//                                [MBManager showBriefAlert:msg inView:self.view.window];
//                                [self.navigationController popViewControllerAnimated:YES];
//                            }
//
//
//                        } Failure:^(NSError *error) {
//
//
//                        }];
//
//                    }else{
//
//                        [MBManager showBriefAlert:@"非法二维码" inView:self.view.window];
//
//                        [self.navigationController popViewControllerAnimated:YES];
//                    }
//
//                }else{
//
////                    WFScanSuccessViewController *jumpVC = [[WFScanSuccessViewController alloc] init];
////                    jumpVC.type = self.type;
////                    jumpVC.jump_URL = obj.stringValue;
//                    if (self.lendType == 1 && ![obj.stringValue hasPrefix:@"http://t1.beijingzhangtu.com"]) {
//
//                        [MBManager showBriefAlert:@"此书不能转借" inView:self.view.window];
//
//                        [self.navigationController popViewControllerAnimated:YES];
//
//                    }else{
//
////                        [self.navigationController pushViewController:jumpVC animated:YES];
//
//                    }
//                }
//
//            }else{
//
//                [MBManager showBriefAlert:@"非法二维码" inView:self.view.window];
//                [self.navigationController popToRootViewControllerAnimated:YES];
//
//            }
            
            
        } else { // 扫描结果为条形码

//            if (self.lectureType == 10001){
//
//                [MBManager showBriefAlert:@"非法二维码" inView:self.view.window];
//                [self.navigationController popViewControllerAnimated:YES];
//            }else{
//
//                WFScanSuccessViewController *jumpVC = [[WFScanSuccessViewController alloc] init];
//                jumpVC.jump_bar_code = obj.stringValue;
//                jumpVC.type = self.type;
//                if (self.lendType == 1) {
//
//                    [MBManager showBriefAlert:@"此书不能转借" inView:self.view.window];
//
//                    [self.navigationController popViewControllerAnimated:YES];
//
//                }else{
//
//                    [self.navigationController pushViewController:jumpVC animated:YES];
//
//                }
//
//            }
            
        }
    }
}

#pragma mark - - - 扫描提示声
/** 播放音效文件 */
- (void)playSoundEffect:(NSString *)name{
    // 获取音效
    NSString *audioFile = [[NSBundle mainBundle] pathForResource:name ofType:nil];
    NSURL *fileUrl = [NSURL fileURLWithPath:audioFile];
    
    // 1、获得系统声音ID
    SystemSoundID soundID = 0;

    AudioServicesCreateSystemSoundID((__bridge CFURLRef)(fileUrl), &soundID);
    
    // 如果需要在播放完之后执行某些操作，可以调用如下方法注册一个播放完成回调函数
    AudioServicesAddSystemSoundCompletion(soundID, NULL, NULL, soundCompleteCallback, NULL);
    
    // 2、播放音频
    AudioServicesPlaySystemSound(soundID); // 播放音效
}
/**
 *  播放完成回调函数
 *
 *  @param soundID    系统声音ID
 *  @param clientData 回调时传递的数据
 */
void soundCompleteCallback(SystemSoundID soundID, void *clientData){
//    NSLog(@"播放完成...");
}

#pragma mark - - - 移除定时器
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self.scanningView removeTimer];
    [self.scanningView removeFromSuperview];
    self.scanningView = nil;
    //    NSLog(@" - - -- viewDidAppear");
}

@end

/*
 二维码扫描的步骤：
     1、创建设备会话对象，用来设置设备数据输入
     2、获取摄像头，并且将摄像头对象加入当前会话中
     3、实时获取摄像头原始数据显示在屏幕上
     4、扫描到二维码/条形码数据，通过协议方法回调
 
 AVCaptureSession 会话对象。此类作为硬件设备输入输出信息的桥梁，承担实时获取设备数据的责任
 AVCaptureDeviceInput 设备输入类。这个类用来表示输入数据的硬件设备，配置抽象设备的port
 AVCaptureMetadataOutput 输出类。这个支持二维码、条形码等图像数据的识别
 AVCaptureVideoPreviewLayer 图层类。用来快速呈现摄像头获取的原始数据
 二维码扫描功能的实现步骤是创建好会话对象，用来获取从硬件设备输入的数据，并实时显示在界面上。在扫描到相应图像数据的时候，通过AVCaptureVideoPreviewLayer类型进行返回
 
 */

