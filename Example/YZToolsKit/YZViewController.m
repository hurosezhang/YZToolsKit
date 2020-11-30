//
//  YZViewController.m
//  YZToolsKit
//
//  Created by hurosezhang on 09/28/2020.
//  Copyright (c) 2020 hurosezhang. All rights reserved.
//

#import "YZViewController.h"

@interface YZViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation YZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    [self test1];
    
    
    
    
}

- (void)test1 {
   
    UITableView * tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 300)];
    
    tableView.dataSource = self;
    tableView.delegate = self;
    
    
    
    [self.view addSubview:tableView];
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"123"];
    cell.contentView.backgroundColor = [UIColor yellowColor];
    UIButton *btn = [[UIButton alloc] initWithFrame:cell.bounds];
    btn.backgroundColor = [UIColor greenColor];
    [btn addTarget:self action:@selector(btnclick:) forControlEvents:UIControlEventTouchUpInside];
    [cell addSubview: btn];
    
    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    
    return cell;
    
}
- (void)btnclick:(UIButton *)btn {
    
    
    NSLog(@"btnclick");
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    NSLog(@"didSelectRowAtIndexPath");
}

- (void)test {
    NSMutableArray * arr = [NSMutableArray arrayWithArray:@[@"0",@"1"]];
    
    NSString * num = arr[2];
    NSLog(@"取出数组的值%@",num);
    
    [arr insertObject:nil atIndex:0];
    
    NSMutableDictionary * dic = [NSMutableDictionary dictionary];
    
    [dic setObject:nil forKey:@"nilkey"];
    NSDictionary * dic2 = [NSDictionary dictionary];
    
    NSLog(@"dic中的空key%@",dic2[@"nilkey"]);

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
