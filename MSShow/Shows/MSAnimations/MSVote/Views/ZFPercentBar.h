//
//  ZFPercentBar.h
//  ZFVoteViewDemo
//
//  Created by mr.scorpion on 16/8/18.
//  Copyright © 2016年 mr.scorpion. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZFPercentBar : UIView


@property (nonatomic, assign) CGFloat percentage;

@property (nonatomic, strong) UIColor *foregroundColor;

- (void)reset;

@end
