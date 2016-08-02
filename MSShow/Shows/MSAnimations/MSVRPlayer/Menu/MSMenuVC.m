//
//  MSMenuVC.m
//  MS360Player
//
//  Created by mr.scorpion on 11/8/15.
//  Copyright © 2015 mr.scorpion. All rights reserved.
//

#import "MSMenuVC.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import "MS360PlayerVC.h"

@interface MSMenuVC () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@end

@implementation MSMenuVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    
  }
  return self;
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}
#pragma mark -- 所有自动旋转暂时都注掉
//- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
//  return UIInterfaceOrientationMaskLandscape;
//}

#pragma mark button management

- (IBAction)playDemo:(id)sender {
//  [self launchVideoWithName:@"demo"];
//    [self launchVideoWithName:@"test"];
    [self launchVideoWithName:@"demo1"];
}

- (IBAction)playFile:(id)sender {
  UIImagePickerController *picker = [[UIImagePickerController alloc] init];
  picker.delegate = self;
  picker.modalPresentationStyle = UIModalPresentationCurrentContext;
  picker.mediaTypes =[UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
  picker.mediaTypes =
  [[NSArray alloc] initWithObjects: (NSString *) kUTTypeMovie, nil];
  picker.videoQuality = UIImagePickerControllerQualityTypeHigh;
  [self presentViewController:picker animated:YES completion:nil];
}

- (IBAction)backAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
  [picker dismissViewControllerAnimated:YES completion:nil];
//  NSLog(@"%@", [info objectForKey:UIImagePickerControllerMediaURL]);
  NSURL *url = [info objectForKey:UIImagePickerControllerMediaURL];
  MS360PlayerVC *videoController = [[MS360PlayerVC alloc] initWithNibName:@"MS360PlayerVC" bundle:nil url:url];
  
  //  if(![[self presentedViewController] isBeingDismissed])
  //  {
  [self presentViewController:videoController animated:YES completion:nil];
  //  }
}

@end
