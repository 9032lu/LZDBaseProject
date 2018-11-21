//
//  SGRBorrowHistoryViewController.m
//  SwanGooseReading
//
//  Created by ZhangTu on 2018/11/19.
//  Copyright © 2018年 Test. All rights reserved.
//

#import "SGRBorrowHistoryViewController.h"
#import "SGRBorrowHistoryCell.h"

@interface SGRBorrowHistoryViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation SGRBorrowHistoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    SETTitleTextColorFont
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SGRBorrowHistoryCell class]) bundle:nil] forCellReuseIdentifier:SGRBorrowHistoryCellID];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SGRBorrowHistoryCell *cell = [tableView dequeueReusableCellWithIdentifier:SGRBorrowHistoryCellID];
    
    return cell;
}



@end
