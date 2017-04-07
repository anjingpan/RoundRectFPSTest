//
//  myTableViewController.m
//  RoundRectDemo
//
//  Created by mac on 17/4/7.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "myTableViewController.h"
#import "myTableViewCell.h"

static NSString *const kMyTableViewCell = @"myTableViewCell";

@interface myTableViewController ()

@end

@implementation myTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSInteger previousViewControllerIndex = [[self.navigationController viewControllers] indexOfObject:self] - 1;
    if (previousViewControllerIndex >= 0) {
        UIViewController *previousViewController = [[self.navigationController viewControllers] objectAtIndex:previousViewControllerIndex];
        previousViewController.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:nil];
    }
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([myTableViewCell class]) bundle:nil] forCellReuseIdentifier:kMyTableViewCell];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 60;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50.f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    myTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kMyTableViewCell];
    if (!cell) {
        cell = [[myTableViewCell alloc] init];
    }
    
    switch (self.type) {
        case RoundRectTypeUIGraphics:
            cell.cellType = CellRoundRectTypeUIGraphics;
            break;
        case RoundRectTypeCAShapeLayer:
            cell.cellType = CellRoundRectTypeCAShapeLayer;
            break;
        case RoundRectTypeCornerRadius:
            cell.cellType = CellRoundRectTypeCornerRadius;
            break;
        default:
            break;
    }
    return cell;
}

@end
