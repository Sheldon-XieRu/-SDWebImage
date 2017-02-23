//
//  ViewController.m
//  XRWebImage
//
//  Created by Ru on 23/2/17.
//  Copyright © 2017年 Ru. All rights reserved.
//

#import "ViewController.h"
#import "AppInfo.h"
#import "TableViewCell.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@property (nonatomic,strong) NSArray *datalist;
@end

@implementation ViewController

static NSString *cellID = @"Cell";
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.datalist.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    cell.info = self.datalist[indexPath.row];
    
    return cell;
}




- (NSArray *)datalist {
    if (_datalist == nil) {
        _datalist = [AppInfo appInfos];
    }
    return _datalist;
}

@end
