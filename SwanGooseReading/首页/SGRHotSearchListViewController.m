//
//  SGRHotSearchListViewController.m
//  SwanGooseReading
//
//  Created by ZhangTu on 2018/11/19.
//  Copyright © 2018年 Test. All rights reserved.
//

#import "SGRHotSearchListViewController.h"
#import "SGRSearchResultViewController.h"

@interface SGRHotSearchListViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tabView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topConstant;
/**
 <#Description#>
 */
@property (nonatomic,strong) UITextField *textField;
@end

@implementation SGRHotSearchListViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    if (@available(iOS 11.0, *)) {
        _tabView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        _topConstant.constant = 0;
    }else {
        _topConstant.constant = StatusBarAndNavigationBarHeight;
        
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    
    [self creatSearchView];
    
    
   
    

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 50)];
    view.backgroundColor = [UIColor whiteColor];
    
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(15, 10, view.width-15, 40)];
    lab.textColor = RGB(153,153,153);
    lab.text = @"热门搜索";
    lab.font = [UIFont systemFontOfSize:15*fontScale];
    [view addSubview:lab];
    
    return view;
    
    
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.font = [UIFont systemFontOfSize:14*fontScale];
        cell.textLabel.textColor = RGB(51,51,51);
    }
    
    NSString *index = [NSString stringWithFormat:@"%ld.",indexPath.row+1];
    
    cell.textLabel.text = [index stringByAppendingString:@"爱的教育(插图典藏版）"];
    
    NSMutableAttributedString *att = [[NSMutableAttributedString alloc]initWithString:cell.textLabel.text];

    UIColor *color;
    if (indexPath.row==0) {
        color =RGB(194,31,24);
        
    }else if (indexPath.row==1){
        color =RGB(248,177,25);

    }else if (indexPath.row==2){
        color =RGB(219,203,29);

    }else{
        color =RGB(153,153,153);

    }
    [att setAttributes:@{NSForegroundColorAttributeName :color} range:NSMakeRange(0, index.length)];
    
    cell.textLabel.attributedText = att;
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    self.textField.text = [cell.textLabel.text componentsSeparatedByString:@"."].lastObject;
    
    PUSH(SGRSearchResultViewController)
    vc.keyWord = self.textField.text;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
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
    textField.font = [UIFont systemFontOfSize:14*fontScale];
    [backView addSubview:textField];
    self.textField = textField;
    textField.delegate = self;
    [textField setValue:[NSNumber numberWithInt:10] forKey:@"paddingLeft"];
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(textField.right, 0, 60, textField.height);
    rightBtn.titleLabel.font = [UIFont systemFontOfSize:15*fontScale];
    [rightBtn setTitle:@"搜索" forState:0];
    
    [backView addSubview:rightBtn];
    MJWeakSelf
    [[rightBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        if ([weakSelf.textField.text stringByReplacingOccurrencesOfString:@" " withString:@""].length<1) {
            [MBManager showBriefAlert:@"请输入书名/作者"];
            
        }else{
            PUSH(SGRSearchResultViewController)
            vc.keyWord = weakSelf.textField.text;

        }
        LZDLog(@"--保存--")
    }];
    
    self.navigationItem.titleView = backView;

}

@end
