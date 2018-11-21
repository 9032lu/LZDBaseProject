//
//  SGRHomeViewController.m
//  SwanGooseReading
//
//  Created by ZhangTu on 2018/11/16.
//  Copyright © 2018年 Test. All rights reserved.
//

#import "SGRHomeViewController.h"
#import "SGRBorrowedBookCell.h"
#import "SGRQRcodeCell.h"
#import "SGRHomeSectionHeaderView.h"
#import "SGRHtmlDetailViewController.h"
#import "SGRHotSearchListViewController.h"
#import "SGScanningQRCodeVC.h"
#import "SGRSettlementViewController.h"

@interface SGRHomeViewController ()<UITableViewDelegate,UITableViewDataSource,XLsn0wLoopDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomConstanst;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topConstant;
@property (strong, nonatomic) IBOutlet XLsn0wLoop *loopView;

@end

@implementation SGRHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"鸿雁悦读";
    SETTitleTextColorFont
    self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    if (@available(iOS 11.0, *)) {
        _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        _topConstant.constant = 0;

    }else {

        _topConstant.constant = StatusBarAndNavigationBarHeight;

        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    self.loopView.frame = CGRectMake(0, 0, ScreenWidth, ScreenWidth*217/375);
    self.loopView.xlsn0wDelegate = self;
    self.loopView.time = 3.0;
    [self.loopView setPageColor:[UIColor whiteColor] andCurrentPageColor:ZTBTNCOLOR];
    self.loopView.pagePosition = PositionBottomRight;
    self.tableView.tableHeaderView = self.loopView;
    self.loopView.imageArray = @[[UIImage imageNamed:@"aHolder"]];
    self.loopView.describeArray = @[@"鸿雁悦读：开启全民阅读呼和浩特模式"];

    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SGRBorrowedBookCell class]) bundle:nil] forCellReuseIdentifier:borrowedBookCellID];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SGRQRcodeCell class]) bundle:nil] forCellReuseIdentifier:SGRQRcodeCellID];
    [self.tableView registerClass:[SGRHomeSectionHeaderView class] forHeaderFooterViewReuseIdentifier:SGRHomeSectionHeaderViewID];
    
    
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(0, 0, 40, 40);
    rightBtn.titleLabel.font = [UIFont systemFontOfSize:15*fontScale];
    [rightBtn setImage:[UIImage imageNamed:@"sreach"] forState:0];
    [rightBtn setImage:[UIImage imageNamed:@"sreach"] forState:UIControlStateHighlighted];

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    [[rightBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        PUSH(SGRHotSearchListViewController)
        LZDLog(@"--保存--")
    }];
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 1;
    }else{
        return 3;
    }
        
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 9;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return section ?37:0.01;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section) {
        SGRHomeSectionHeaderView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:SGRHomeSectionHeaderViewID];
        header.tag = section;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]init];
        
        [header addGestureRecognizer:tap];
        
        [[tap rac_gestureSignal]subscribeNext:^(__kindof UIGestureRecognizer * _Nullable x) {
            LZDLog(@"x=%ld",x.view.tag)
            
        }];
        
        return header;
    }else{
        return nil;
    }
   
    
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section!=0) {
        SGRBorrowedBookCell *cell = [tableView dequeueReusableCellWithIdentifier:borrowedBookCellID];
        cell.dateLab.text = @"借书时间:2018-11-7 16:12:29";
        cell.author.text = @"凯利·麦格尼格尔";
        cell.bookName.text = @"自控力:和压力做朋友";
        [cell.reBorrrowBookBtn setTitle:@"结算校验" forState:0];
        
        [cell.reBorrrowBookBtn addTarget:self action:@selector(settlementClcik:) forControlEvents:UIControlEventTouchUpInside];
        return cell;
    }else{
        SGRQRcodeCell *cell = [tableView dequeueReusableCellWithIdentifier:SGRQRcodeCellID];
        [cell.scanCodeBtn addTarget:self action:@selector(scanBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
        return cell;
        
    }
        
    
}

-(void)scanBtnClick{
    
    if (!SIMULATOR) {
        PUSH(SGScanningQRCodeVC)

    }else{
        [MBManager showBriefAlert:@"请使用真机测试"];
    }
    
}

-(void)settlementClcik:(UIButton*)sender{
    
    SGRSettlementViewController*vc = [[SGRSettlementViewController alloc]init];
    vc.modalPresentationStyle = UIModalPresentationOverCurrentContext;
  
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:vc animated:YES completion:^{

    }];
  
    
    
}

#pragma mark  XLsn0wLoop代理

- (void)loopView:(XLsn0wLoop *)loopView clickImageAtIndex:(NSInteger)index;
{
    
    PUSH(SGRHtmlDetailViewController)
    vc.url = @"https://www.baidu.com";
    
}

@end
