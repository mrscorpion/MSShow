//
//  MS360PlayerVC.h
//  MS360Player
//
//  Created by mr.scorpion on 11/8/15.
//  Copyright © 2015 mr.scorpion. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface MS360PlayerVC : UIViewController<AVPlayerItemOutputPullDelegate>

@property (strong, nonatomic) NSURL *videoURL;
@property (strong, nonatomic) IBOutlet UIView *debugView;
@property (strong, nonatomic) IBOutlet UILabel *rollValueLabel;
@property (strong, nonatomic) IBOutlet UILabel *yawValueLabel;
@property (strong, nonatomic) IBOutlet UILabel *pitchValueLabel;
@property (strong, nonatomic) IBOutlet UILabel *orientationValueLabel;

-(id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil url:(NSURL*)url;
-(CVPixelBufferRef) retrievePixelBufferToDraw;
-(void) toggleControls;

@end
