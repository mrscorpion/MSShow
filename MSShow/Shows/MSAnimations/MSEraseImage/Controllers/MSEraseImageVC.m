//
//  MSEraseImageVC.m
//  eraseImage
//
//  Created by mr.scorpion on 2016/1/6.
//  Copyright 2016 mr.scorpion. All rights reserved.
//

#import "MSEraseImageVC.h"

@implementation MSEraseImageVC
@synthesize imageView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UITapGestureRecognizer *singleFingerTwo = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleFingerEvent:)];
    singleFingerTwo.numberOfTapsRequired = 2;
    [self.view addGestureRecognizer:singleFingerTwo];
}
#pragma mark -Diamiss
- (void)handleSingleFingerEvent:(UITapGestureRecognizer *)sender
{
    if(sender.numberOfTapsRequired == 2)
    {
         [self dismissViewControllerAnimated:YES completion:^{
             [self.imageView removeFromSuperview];
             self.imageView = nil;
         }];
    }
}
                                               
#pragma mark - Touches
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	UITouch *touch = [touches anyObject];
	if([touch view] == imageView)
	{
		canEarse = YES;
	}
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
	UITouch *touch = [touches anyObject];
	if (canEarse)
	{
		CGPoint currentPoint = [touch locationInView:imageView];
		UIGraphicsBeginImageContext(self.imageView.frame.size);
		[imageView.image drawInRect:imageView.bounds];
		CGContextClearRect (UIGraphicsGetCurrentContext(), CGRectMake(currentPoint.x, currentPoint.y, 35, 35));
		imageView.image = UIGraphicsGetImageFromCurrentImageContext(); 
		UIGraphicsEndImageContext();
	}
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	canEarse = NO;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)dealloc
{
	[imageView removeFromSuperview];
}
@end
