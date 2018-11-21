//
//  SGRSearchResultViewController.m
//  SwanGooseReading
//
//  Created by ZhangTu on 2018/11/20.
//  Copyright © 2018年 Test. All rights reserved.
//

#import "SGRSearchResultViewController.h"
#import "SGRBorrowHistoryCell.h"
#import "SGRBookDetailViewController.h"

@interface SGRSearchResultViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topConstant;
@property (nonatomic,strong) UITextField *textField;

@end

@implementation SGRSearchResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (@available(iOS 11.0, *)) {
        _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        _topConstant.constant = 0;
    }else {
        _topConstant.constant = StatusBarAndNavigationBarHeight;
        
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    
    [self creatSearchView];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SGRBorrowHistoryCell class]) bundle:nil] forCellReuseIdentifier:SGRBorrowHistoryCellID];

    
 
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SGRBorrowHistoryCell *cell = [tableView dequeueReusableCellWithIdentifier:SGRBorrowHistoryCellID];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    PUSH(SGRBookDetailViewController)
}


-(void)creatSearchView{
    UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth-45, 30)];
    //    backView.backgroundColor = [UIColor whiteColor];
    backView.layer.cornerRadius = 3;
    backView.layer.masksToBounds= YES;
    
    UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(10, 0, backView.width-10-60, 30)];
    textField.backgroundColor = [UIColor whiteColor];
    textField.layer.cornerRadius = 3;
    textField.layer.masksToBounds= YES;
    textField.textColor = RGB(153,153,153);
    textField.placeholder = @"  请输入书名/作者";
    textField.text= _keyWord;
    textField.font = BMsmallFont;
    [backView addSubview:textField];
    self.textField = textField;
    textField.delegate = self;
    [textField setValue:[NSNumber numberWithInt:10] forKey:@"paddingLeft"];
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(textField.right, 0, 60, textField.height);
    rightBtn.titleLabel.font = BMNormalFont;
    [rightBtn setTitle:@"搜索" forState:0];
    
    [backView addSubview:rightBtn];
    [[rightBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
//        PUSH(SGRHotSearchListViewController)
        LZDLog(@"--保存--")
    }];
    
    self.navigationItem.titleView = backView;
    
    UIButton *leftButton = [[UIButton alloc]initWithFrame:CGRectMake(0,0,21,19.5)];
    [leftButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [leftButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [leftButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateHighlighted];
    
    leftButton.titleLabel.textColor = [UIColor whiteColor];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    
}
-(void)back{
    [self.navigationController popToRootViewControllerAnimated:YES];
}


@end
