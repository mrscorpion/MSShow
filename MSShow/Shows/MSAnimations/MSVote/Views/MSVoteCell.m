//
//  MSVoteCell.m
//  MSVoteViewDemo
//
//  Created by mr.scorpion on 16/8/18.
//  Copyright © 2016年 mr.scorpion. All rights reserved.
//

#import "MSVoteCell.h"
//#import "MSConfig.h"
#import "UIView+Extension.h"
#import "MSVoteView.h"

@interface MSVoteCell ()

@property (nonatomic,weak) MSVoteView *voteView;

@end

@implementation MSVoteCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style
             reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style
                reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.layer.borderColor = [UIColor lightGrayColor].CGColor;
        self.layer.borderWidth = 0.5;
        self.layer.cornerRadius = MSCornerRadius;
        self.layer.masksToBounds = YES;
        
        
        [self setupVoteView];//初始化投票主控件

    }
    return self;
}

-(void)setupVoteView{
    
    MSVoteView *voteView = [[MSVoteView alloc]initWithFrame:self.bounds
                                                   voteView:nil];
    self.voteView = voteView;
    
    [self addSubview:voteView];
}

-(void)layoutSubviews{

    [super layoutSubviews];
    
    self.voteView.frame = self.bounds;
}


-(void)setVoteModel:(MSVoteModel *)voteModel{

    _voteModel = voteModel;
    
    self.voteView.voteModel = _voteModel;
    
}

-(void)thumbUpstartAnimation{
    
    [self.voteView thumbUpstartAnimation];
    
}

-(void)setFrame:(CGRect)frame{
    
        if (frame.size.width == MSVoteTableViewMax_W) {//初始化就设置cell的内边距
            
            frame = UIEdgeInsetsInsetRect(frame,
                                          UIEdgeInsetsMake(MSVoteCellTopBottomInset,
                                                           MSVoteCellLeftRightInset,
                                                           MSVoteCellTopBottomInset,
                                                           MSVoteCellLeftRightInset));
        }else{//重复利用的时候改变它的x值
            
            frame.origin.x += MSVoteCellLeftRightInset;
        }
    [super setFrame:frame];
}



@end
