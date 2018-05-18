//
//  HLeftImageCell.m
//  MGMobileMusic
//
//  Created by dqf on 2017/8/4.
//  Copyright © 2017年 migu. All rights reserved.
//

#import "HLeftImageCell.h"

@interface HLeftImageCell ()
@property (nonatomic) CGSize  leftImageSize;
@property (nonatomic) CGFloat leftSpace;
@property (nonatomic) CGFloat rightSpace;
@end

@implementation HLeftImageCell

- (UIImageView *)leftImageView {
    if (!_leftImageView) {
        _leftImageView = [[UIImageView alloc] init];
        _leftImageView.backgroundColor = [UIColor clearColor];
    }
    return _leftImageView;
}

- (void)setLeftImageSize:(CGSize)leftImageSize {
    _leftImageSize = leftImageSize;
    CGRect frame = CGRectZero;
    frame.size = leftImageSize;
    [self.imageView setFrame:frame];
    [self.leftImageView setFrame:frame];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    //调整imageView的坐标
    CGRect tmpFrame = self.imageView.frame;
    tmpFrame.origin.x = self.leftSpace;
    tmpFrame.origin.y = self.frame.size.height/2-tmpFrame.size.height/2;
    self.leftImageView.frame = tmpFrame;
    //self.leftImageView.layer.masksToBounds = YES;
    //self.leftImageView.layer.cornerRadius = self.leftImageView.frame.size.width/2;
    
    //隐藏系统的imageView
    [self.imageView setImage:nil];
    [self.imageView setHidden:YES];
    
    //调整textLabel的坐标
    tmpFrame = self.textLabel.frame;
    tmpFrame.origin.x = self.leftSpace+self.leftImageSize.width+self.rightSpace;
    self.textLabel.frame = tmpFrame;
    
    //调整detailTextLabel的坐标
    tmpFrame = self.detailTextLabel.frame;
    tmpFrame.origin.x = self.leftSpace+self.leftImageSize.width+self.rightSpace;
    self.detailTextLabel.frame = tmpFrame;
}

- (void)initUI {
    [self addSubview:self.leftImageView];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)resetLeftImageViewSize:(CGSize)size leftSpace:(CGFloat)leftSpace rightSpace:(CGFloat)rightSpace {
    [self setLeftImageSize:size];
    [self setLeftSpace:leftSpace];
    [self setRightSpace:rightSpace];
    [self layoutSubviews];
}

@end

