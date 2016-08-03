//
//  MSVoteCell.h
//  MSVoteViewDemo
//
//  Created by mr.scorpion on 16/8/18.
//  Copyright © 2016年 mr.scorpion. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MSVoteModel.h"
@interface MSVoteCell : UITableViewCell

/**voteModel*/
@property (nonatomic, strong) MSVoteModel *voteModel;

-(void)thumbUpstartAnimation;

@end
