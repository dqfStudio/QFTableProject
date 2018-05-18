//
//  HLeftImageCell.h
//  MGMobileMusic
//
//  Created by dqf on 2017/8/4.
//  Copyright © 2017年 migu. All rights reserved.
//

#import "HBaseCell.h"

@interface HLeftImageCell : HBaseCell
@property (nonatomic) UIImageView *leftImageView;
- (void)resetLeftImageViewSize:(CGSize)size leftSpace:(CGFloat)leftSpace rightSpace:(CGFloat)rightSpace;
@end
