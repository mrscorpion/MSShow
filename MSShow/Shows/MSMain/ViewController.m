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
#import "MSEraseImageVC.h"
#import "MSMenuVC.h"
#import "MSVoteVC.h"

#define kSectionHeight 30
static NSString *const cellId = @"cellId";

@interface ViewController ()
<
UITableViewDelegate,
UITableViewDataSource
>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *data;
@property (nonatomic, strong) NSArray *titleData;
@end

@implementation ViewController
#pragma mark - View Life Cycle
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
}
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
        _data = @[
                  @[@"文字特效", @"360度视频播放器", @"投票"],
                  @[@"渐变圆弧进度动画", @"地图定位动画", @"加载动画", @"擦一擦", @"播放Gif"],
                  @[@"聚光灯效果用户引导", @"搜索动画", @"仿KEEP应用引导页"]
                  ];
    }
    return _data;
}
- (NSArray *)titleData
{
    if (!_titleData) {
        _titleData = @[@"chapter1", @"chapter2", @"chapter3"];
    }
    return _titleData;
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
    cell.textLabel.text = self.data[indexPath.section][indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return kSectionHeight;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return self.titleData[section];
}
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
                    [self presentViewController:[[MSFadingText alloc] init] animated:YES completion:nil];
                }
                    break;
                    
                case 1:
                {
                    [self presentViewController:[[MSMenuVC alloc] initWithNibName:@"MSMenuVC" bundle:[NSBundle mainBundle]] animated:YES completion:nil];
                }
                    break;

                case 2:
                {
                    [self.navigationController pushViewController:[[MSVoteVC alloc] init] animated:YES];
                }
                    break;
//
//                case 3:
//                {
//                    
//                }
//                    break;
//                    
//                case 4:
//                {
//                    [self.navigationController pushViewController:[[MSGifVC alloc] init] animated:YES];
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
                    [self.navigationController pushViewController:[[UIStoryboard storyboardWithName:@"MSProgressVC" bundle:nil] instantiateViewControllerWithIdentifier:@"progressVC"] animated:YES];
                }
                    break;
                    
                case 1:
                {
                    [self presentViewController:[[MapViewController alloc] init] animated:YES completion:nil];
                }
                    break;

                case 2:
                {
                    [self presentViewController:[[MSLoadingDotsVC alloc] init] animated:YES completion:nil];
                }
                    break;
                    
                case 3:
                {
                    MSEraseImageVC *eraseVC = [[MSEraseImageVC alloc] initWithNibName:@"MSEraseImageVC" bundle:nil];
                    [self presentViewController:eraseVC animated:YES completion:nil];
                }
                    break;
                    
                case 4:
                {
                    [self.navigationController pushViewController:[[MSGifVC alloc] init] animated:YES];
                }
                    break;
                    
                default:
                    break;
            }
        }
        
        break;
        
        case 2:
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
