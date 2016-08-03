//
//  MSVoteModel.m
//  MSVoteViewDemo
//
//  Created by mr.scorpion on 16/8/18.
//  Copyright © 2016年 mr.scorpion. All rights reserved.
//

#import "MSVoteModel.h"
//#import "MSConfig.h"

@implementation MSVoteModel


-(void)setTitle:(NSString *)title{//根据数据算出每行cell的实际高度

    _title = title;
    
    CGFloat title_H = [title boundingRectWithSize:CGSizeMake(MSVoteTableViewMax_W - percentLable_W - thumbUpView_WH - 85, 100)
                                          options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin
                                       attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15.0]}
                                          context:nil].size.height;

    self.voteCell_H = title_H + 30;
}

@end
