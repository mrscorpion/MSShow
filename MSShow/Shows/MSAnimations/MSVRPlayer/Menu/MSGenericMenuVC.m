//
//  MSGenericMenuVC.m
//  MS360Player
//
//  Created by mr.scorpion on 11/8/15.
//  Copyright © 2015 mr.scorpion. All rights reserved.
//

#import "MSGenericMenuVC.h"
#import "MS360PlayerVC.h"

#define DIAPORAMA_DELAY 1.0 // delay between slide image in seconds

@implementation MSGenericMenuVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
  if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
  }
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    // 设置状态栏显示
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationNone];
}
- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationNone];
}
//#pragma mark -- 自动旋转
//- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
//  return UIInterfaceOrientationMaskLandscape;
//}

#pragma mark launch actions

- (void)launchVideoWithName:(NSString*)name
{
  NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:@"mp4"];
  NSURL *url = [[NSURL alloc] initFileURLWithPath:path];
  MS360PlayerVC *videoController = [[MS360PlayerVC alloc] initWithNibName:@"MS360PlayerVC" bundle:nil url:url];
  
//  if (![[self presentedViewController] isBeingDismissed]) {
//    [self presentViewController:videoController animated:YES completion:nil];
//  }
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        UIApplication *application = [UIApplication sharedApplication];
        //      application.keyWindow.transform = CGAffineTransformMakeRotation(M_PI / 2);
        videoController.view.transform = CGAffineTransformMakeRotation(M_PI/2);
        videoController.view.frame = application.keyWindow.bounds;
        [application.keyWindow addSubview:videoController.view];
    } completion:nil];
}

-(void) openURLWithString:(NSString*)stringurl {
  NSURL *url = [NSURL URLWithString:stringurl];
  [[UIApplication sharedApplication] openURL:url];
}
@end
