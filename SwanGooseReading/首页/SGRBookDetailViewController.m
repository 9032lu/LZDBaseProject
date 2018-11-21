//
//  SGRBookDetailViewController.m
//  SwanGooseReading
//
//  Created by ZhangTu on 2018/11/20.
//  Copyright © 2018年 Test. All rights reserved.
//

#import "SGRBookDetailViewController.h"
#import "SGRBookHeaderCell.h"
#import "SGRLibraryCollectionInforCell.h"

@interface SGRBookDetailViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topConstant;
@property (nonatomic,assign)  BOOL flod;;

@end

@implementation SGRBookDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"图书详情";
    SETTitleTextColorFont
    if (@available(iOS 11.0, *)) {
        _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        _topConstant.constant = 0;
    }else {
        _topConstant.constant = StatusBarAndNavigationBarHeight;
        
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SGRBookHeaderCell class]) bundle:nil] forCellReuseIdentifier:SGRBookHeaderCellID];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SGRLibraryCollectionInforCell class]) bundle:nil] forCellReuseIdentifier:SGRLibraryCollectionInforCellID];

    
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return section?10:1;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        SGRBookHeaderCell *cell = [tableView dequeueReusableCellWithIdentifier:SGRBookHeaderCellID];
        cell.introductionLab.text = @"水电费了斯柯达了防守打法律师代理费大连市地方；上的；裂缝是；代理费开始；地方；历史；来的反馈是；独领风骚；地方；历史收到了方式；地方； 收代理费；水电费； 是；的李开复；撒可富；斯柯达富士康收到了方式林德洛夫";
        NSMutableAttributedString *des_attr = [[NSMutableAttributedString alloc]initWithString:cell.introductionLab.text];
        NSMutableParagraphStyle *des_para = [[NSMutableParagraphStyle alloc]init];
        [des_para setLineSpacing:5];
        [des_attr setAttributes:@{NSParagraphStyleAttributeName:des_para} range:NSMakeRange(0, des_attr.length)];
        cell.introductionLab.attributedText = des_attr;
        
        NSInteger lines = [NSString getLineNum:cell.introductionLab.text andfont:cell.introductionLab.font labelWidth:ScreenWidth-20];
        [cell.foldBtn setTitle:(self.flod?@"收起":@"展开") forState:0];
        cell.introductionLab.numberOfLines =  self.flod?0:2;
        if (lines<=2) {
            cell.foldBtn.hidden = 1;
            cell.foldBtnHeight.constant = 0;
        }else{
            cell.foldBtn.hidden = 0;
            cell.foldBtnHeight.constant =20;
        }
        
        MJWeakSelf
        cell.foldBtn.block = ^(LZDButton *sender) {
            
            weakSelf.flod = !self.flod;
            
            [UIView performWithoutAnimation:^{
                [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
                
                [tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:NO];
            }];
        };
        
        
        
        return cell;
    }else{
        SGRLibraryCollectionInforCell *cell = [tableView dequeueReusableCellWithIdentifier:SGRLibraryCollectionInforCellID];
        
        
        return cell;
    }
    
  
}
@end
