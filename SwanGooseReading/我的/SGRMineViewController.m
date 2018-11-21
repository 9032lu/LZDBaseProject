//
//  SGRMineViewController.m
//  SwanGooseReading
//
//  Created by ZhangTu on 2018/11/16.
//  Copyright © 2018年 Test. All rights reserved.
//

#import "SGRMineViewController.h"
#import "SGRBorrowedBookViewController.h"
#import "SGRSettingViewController.h"
#import "SGRBorrowHistoryViewController.h"

@interface SGRMineViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIImageView *userImgView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *userImgWidth;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation SGRMineViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.userImgWidth.constant = 81*fontScale;
    self.userImgView.layer.cornerRadius = self.userImgWidth.constant/2;
    self.tableView.rowHeight = 53;

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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cellID"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.font = BMNormalFont;
        cell.detailTextLabel.font = BMsmallFont;
    }
    
    NSArray *titlearr = @[@[@"在借图书",@"借阅历史"],@[@"设置"]];
    NSArray *imgarr = @[@[@"books",@"history"],@[@"set"]];
    NSArray *contarr = @[@[@"3",@"2"],@[@""]];

    cell.imageView.image = [UIImage imageNamed:imgarr[indexPath.section][indexPath.row]];
    cell.textLabel.text = titlearr[indexPath.section][indexPath.row];
    cell.detailTextLabel.text = contarr[indexPath.section][indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        
        if (indexPath.row == 0) {
            PUSH(SGRBorrowedBookViewController)
            vc.navigationItem.title = @"在借图书";
        }else{
            PUSH(SGRBorrowHistoryViewController)
            vc.navigationItem.title = @"借阅历史";
        }
    }else{
        
        PUSH(SGRSettingViewController)
        vc.navigationItem.title = @"设置";
    }
}


@end
