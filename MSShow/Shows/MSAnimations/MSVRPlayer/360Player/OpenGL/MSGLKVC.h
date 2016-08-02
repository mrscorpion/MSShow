//
//  MSGLKVC.h
//  MS360Player
//
//  Created by mr.scorpion on 11/8/15.
//  Copyright © 2015 mr.scorpion. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GLKit/GLKit.h>
@class MS360PlayerVC;

@interface MSGLKVC : GLKViewController<UIGestureRecognizerDelegate>

@property (strong, nonatomic, readwrite) MS360PlayerVC* videoPlayerController;
@property (assign, nonatomic, readonly) BOOL isUsingMotion;

- (void)startDeviceMotion;
- (void)stopDeviceMotion;

@end
