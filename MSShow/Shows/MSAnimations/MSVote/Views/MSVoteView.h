//
//  MSVoteView.h
//  MSVoteViewDemo
//
//  Created by mr.scorpion on 16/8/19.
//  Copyright © 2016年 mr.scorpion. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MSVoteModel.h"
@interface MSVoteView : UIView

-(instancetype)initWithFrame:(CGRect)frame voteView:(MSVoteModel *)voteModel;

@property (nonatomic, strong) MSVoteModel *voteModel;

- (void)thumbUpstartAnimation;
@end
