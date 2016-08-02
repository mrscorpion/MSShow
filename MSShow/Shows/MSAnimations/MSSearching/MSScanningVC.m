//
//  MSScanningVC.m
//  MSShow
//
//  Created by mr.scorpion on 16/8/22.
//  Copyright © 2016年 mr.scorpion. All rights reserved.
//

#import "MSScanningVC.h"

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

@interface MSScanningVC ()
@property (strong, nonatomic) UIImageView *scanImageView;
@property (nonatomic, strong) UIImageView *dotImageView;
@property (nonatomic, assign) BOOL isAnimating;
@end

@implementation MSScanningVC
#pragma mark - View Life Cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImageView *bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    bgImageView.center = self.view.center;
    bgImageView.image = [UIImage imageNamed:@"bgScan"];
    [self.view addSubview:bgImageView];
    
    self.scanImageView = [[UIImageView alloc] initWithFrame:bgImageView.bounds];
    self.scanImageView.center = self.view.center;
    _scanImageView.image = [UIImage imageNamed:@"plainScan"];
    [self.view addSubview:self.scanImageView];
    
    _dotImageView = [[UIImageView alloc] initWithFrame:CGRectMake((SCREEN_WIDTH - 18) / 2, (SCREEN_HEIGHT - 18) / 2, 10, 10)];
    _dotImageView.image = [UIImage imageNamed:@"dotScan"];
    [self.view addSubview:self.dotImageView];
    
    
    UITapGestureRecognizer *singleTapTwo = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)];
    singleTapTwo.numberOfTapsRequired = 2;
    [self.view addGestureRecognizer:singleTapTwo];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.dotImageView.hidden = YES;
    self.isAnimating = NO;
}

#pragma mark - Actions
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (!self.isAnimating) {
        CABasicAnimation* rotationAnimation;
        rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
        rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI / 2.0 ];
        rotationAnimation.duration = .5;
        rotationAnimation.cumulative = YES;
        rotationAnimation.repeatCount = MAXFLOAT;
        [self.scanImageView.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
        self.isAnimating = YES;
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.dotImageView.hidden = NO;
        });
    }
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
    return YES;
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
