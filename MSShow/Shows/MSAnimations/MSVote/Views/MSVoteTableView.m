//
//  MSVoteTableView.m
//  MSVoteViewDemo
//
//  Created by mr.scorpion on 16/8/22.
//  Copyright © 2016年 mr.scorpion. All rights reserved.
//

#import "MSVoteTableView.h"

@implementation MSVoteTableView
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    
    if (self = [super initWithFrame:frame style:style])
    {
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.bounces = NO;
    }
    return self;
}
@end
