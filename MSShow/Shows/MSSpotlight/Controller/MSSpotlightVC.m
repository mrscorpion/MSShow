//
//  MSSpotlightVC.m
//  MSShow
//
//  Created by mr.scorpion on 16/8/22.
//  Copyright © 2016年 mr.scorpion. All rights reserved.
//

#import "MSSpotlightVC.h"
#import "MSGuideView.h"

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

@interface MSSpotlightVC ()
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) MSGuideView *markView;
@end

@implementation MSSpotlightVC
#pragma mark - View Life Cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    self.imageView = imageView;
    [imageView setImage:[UIImage imageNamed:@"mm1"]];
    [self.view addSubview:imageView];
    
    UITapGestureRecognizer *singleTapTwo = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)];
    singleTapTwo.numberOfTapsRequired = 2;
    [self.view addGestureRecognizer:singleTapTwo];
}
- (void)viewWillAppear:(BOOL)animated
{
    _markView = [[MSGuideView alloc] initWithFrame:self.imageView.bounds];
    _markView.model = GuideViewCleanModeOval;
    _markView.markText = @"很高兴你能来...";
    [self.imageView addSubview:_markView];
}

#pragma mark - Actions
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSArray *rectArray = @[
                           [NSValue valueWithCGRect:CGRectMake(40, SCREEN_HEIGHT - 110, 60, 80)],
                           [NSValue valueWithCGRect:CGRectMake(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2 + 20, 100, 50)],
                           [NSValue valueWithCGRect:CGRectMake(SCREEN_WIDTH - 30, 42, 50, 200)],
                           [NSValue valueWithCGRect:CGRectMake(SCREEN_WIDTH / 2 - 150, SCREEN_HEIGHT / 2 - 20, 1, 0)]
                           ];
    
    NSArray *messageArray = @[
                              @"欢迎",
                              @"这是我的名字",
                              @"搜索附近的人",
                              @"开始聊天吧"
                              ];
    
    [_markView setMessageArray:messageArray rectArray:rectArray];
}
- (void)dismiss
{
//    [self.markView removeFromSuperview];
//    self.markView = nil;
    [self dismissViewControllerAnimated:YES completion:nil];
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
