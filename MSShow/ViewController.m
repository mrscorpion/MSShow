//
//  ViewController.m
//  MSShow
//
//  Created by mr.scorpion on 16/8/22.
//  Copyright © 2016年 mr.scorpion. All rights reserved.
//

#import "ViewController.h"
#import "MSSpotlightVC.h"
#import "MSScanningVC.h"
#import "KeepNewFeatureViewController.h"
#import "MSShow-Swift.h"

static NSString *const cellId = @"cellId";

@interface ViewController ()
<
UITableViewDelegate,
UITableViewDataSource
>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *data;
@end

@implementation ViewController
#pragma mark - View Life Cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
}

#pragma mark - Lazy Load
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellId];
    }
    return _tableView;
}
- (NSArray *)data
{
    if (!_data) {
        _data = @[@[@"地图定位动画"],
                  @[@"聚光灯效果用户引导", @"搜索动画", @"仿KEEP应用引导页"]];
    }
    return _data;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.data[section] count];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.data.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
//    -[__NSArrayI isEqualToString:]: unrecognized selector sent to instance 0x7fc7486dc5e0
    // 出现这个报错是因为我将原来单行row的拓展成了section，而cellForRowAtIndexPath中没有做相应的修改，从而导致crash
//    cell.textLabel.text = self.data[indexPath.row];
    cell.textLabel.text = self.data[indexPath.section][indexPath.row];
    return cell;
}
#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section)
    {
        case 0:
        {
            switch (indexPath.row)
            {
                case 0:
                {
                    [self presentViewController:[[MapViewController alloc] init] animated:YES completion:nil];
                }
                    break;
                    
//                case 1:
//                {
//                    [self presentViewController:[[MSScanningVC alloc] init] animated:YES completion:nil];
//                }
//                    break;
//                    
//                case 2:
//                {
//                    [self.navigationController pushViewController:[[KeepNewFeatureViewController alloc] init] animated:YES];
//                }
//                    break;
                    
                default:
                    break;
            }
        }
        
        break;
        
        case 1:
        {
            switch (indexPath.row)
            {
                case 0:
                {
                    [self presentViewController:[[MSSpotlightVC alloc] init] animated:YES completion:nil];
                }
                    break;
                    
                case 1:
                {
                    [self presentViewController:[[MSScanningVC alloc] init] animated:YES completion:nil];
                }
                    break;
                    
                case 2:
                {
                    [self.navigationController pushViewController:[[KeepNewFeatureViewController alloc] init] animated:YES];
                }
                    break;
                    
                default:
                    break;
            }
        }
        break;
        
        default:
            break;
    }
}


#pragma mark - Status Bar
// 隐藏状态栏
- (BOOL)prefersStatusBarHidden
{
    return NO;
}
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
@end
