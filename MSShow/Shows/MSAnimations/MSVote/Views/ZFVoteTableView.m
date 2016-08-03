//
//  ZFVoteTableView.m
//  ZFVoteViewDemo
//
//  Created by mr.scorpion on 16/8/22.
//  Copyright © 2016年 mr.scorpion. All rights reserved.
//

#import "ZFVoteTableView.h"

@implementation ZFVoteTableView

-(instancetype)initWithFrame:(CGRect)frame
                       style:(UITableViewStyle)style{
    
    self = [super initWithFrame:frame
                          style:style];
    if (self) {
        
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        self.bounces = NO;
    }
    return self;
}
@end
