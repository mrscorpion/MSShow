//
//  ZFVoteCell.h
//  ZFVoteViewDemo
//
//  Created by mr.scorpion on 16/8/18.
//  Copyright © 2016年 mr.scorpion. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZFVoteModel.h"
@interface ZFVoteCell : UITableViewCell

/**voteModel*/
@property (nonatomic, strong) ZFVoteModel *voteModel;

-(void)thumbUpstartAnimation;

@end
