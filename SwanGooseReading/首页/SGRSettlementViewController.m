//
//  SGRSettlementViewController.m
//  SwanGooseReading
//
//  Created by ZhangTu on 2018/11/20.
//  Copyright © 2018年 Test. All rights reserved.
//

#import "SGRSettlementViewController.h"

@interface SGRSettlementViewController ()

@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UILabel *settlementTitle;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *codeImgWidth;
@property (weak, nonatomic) IBOutlet UIImageView *bookImageView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bookImgWidth;
@property (weak, nonatomic) IBOutlet UILabel *bookName;
@property (weak, nonatomic) IBOutlet UILabel *isbnTitle;
@property (weak, nonatomic) IBOutlet UILabel *publishDateTitle;
@property (weak, nonatomic) IBOutlet UILabel *author;
@property (weak, nonatomic) IBOutlet UILabel *publisherTitle;
@property (weak, nonatomic) IBOutlet UILabel *collectionCodeTitle;
@property (weak, nonatomic) IBOutlet UIImageView *codeImgView;


@end

@implementation SGRSettlementViewController


- (void)viewDidLoad {
    [super viewDidLoad];

    self.titleLab.font = self.settlementTitle.font =BMNormalFont;
    self.codeImgWidth.constant = 154*fontScale;
    self.bookImgWidth.constant =100*fontScale;
    self.bookName.font = [UIFont boldSystemFontOfSize:16*fontScale];
    self.author.font = self.publisherTitle.font = self.publishDateTitle.font = self.isbnTitle.font = self.collectionCodeTitle.font = BMsmallFont;

    
    NSString *codeString = @"self.bookName.font = [UIFont boldSystemFontOfSize:16*fontScale];";
    
    UIImage *image = [SGQRCodeTool SG_generateWithDefaultQRCodeData:codeString imageViewWidth:self.codeImgWidth.constant];
    
    self.codeImgView.image = image;
    
    
    
    
    
}


- (IBAction)hideClick:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];

}


@end
