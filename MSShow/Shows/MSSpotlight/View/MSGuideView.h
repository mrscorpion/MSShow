//
//  MSGuideView.h
//  MSShow
//
//  Created by mr.scorpion on 16/8/22.
//  Copyright © 2016年 mr.scorpion. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, GuideViewCleanMode) {
    GuideViewCleanModeRect, //矩形
    GuideViewCleanModeRoundRect,      // 圆角矩形
    GuideViewCleanModeOval     //椭圆
};

@interface MSGuideView : UIView
{
    UITextView *markTextView;
    UIImageView *markImageView;
    BOOL isClean;
}
@property (nonatomic, assign) CGRect showRect;    //透明范围
@property (nonatomic, assign) BOOL fullShow;  //透明范围全部显示
@property (nonatomic, strong) UIColor *guideColor; //覆盖颜色
@property (nonatomic, assign) BOOL showMark;  //是否显示提示
@property (nonatomic, strong) NSString *markText;    //提示文本
@property (nonatomic, assign) GuideViewCleanMode model;   //透明区域范围
@property (nonatomic, strong) NSMutableArray *rectArray;
@property (nonatomic, strong) NSMutableArray *titleArray;

- (void)setMessageArray:(NSArray *)messageArray rectArray:(NSArray *)rectArray;
@end
