//
//  SGRBorrowedBookViewController.m
//  SwanGooseReading
//
//  Created by ZhangTu on 2018/11/16.
//  Copyright © 2018年 Test. All rights reserved.
//

#import "SGRBorrowedBookViewController.h"
#import "SGRBorrowedBookCell.h"

@interface SGRBorrowedBookViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation SGRBorrowedBookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    SETTitleTextColorFont
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SGRBorrowedBookCell class]) bundle:nil] forCellReuseIdentifier:borrowedBookCellID];

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SGRBorrowedBookCell *cell = [tableView dequeueReusableCellWithIdentifier:borrowedBookCellID];
    return cell;
    
}


@end
