//
//  HLeftImageCell2.m
//  QFTableProject
//
//  Created by dqf on 2018/5/22.
//  Copyright © 2018年 dqfStudio. All rights reserved.
//

#import "HLeftImageCell2.h"

@interface HCellView ()

@end

@implementation HCellView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat height = CGRectGetHeight(frame);
        self.leftView = [UIImageView new];
        self.leftEdgeInsets = HEdgeInsetsMake(height-10, height-10, 10, 10);
        self.rightView = [UIView new];
        self.rightEdgeInsets = HEdgeInsetsMake(15, 15, 10, 10);
        self.topView = [UILabel new];
        self.topEdgeInsets = HSideEdgeInsetsMake(height/3-30/3, 10, 5);
        self.bottomView = [UILabel new];
        self.bottomEdgeInsets = HSideEdgeInsetsMake(height/3-30/3, 5, 10);
    }
    return self;
}

@end


@implementation HLeftImageCell2

- (HCellView *)cellView {
    if (!_cellView) {
        CGRect frame = self.bounds;
        frame.size.width -= 35;
        _cellView = [[HCellView alloc] initWithFrame:self.frame];
    }
    return _cellView;
}

- (void)initUI {
    [self addSubview:self.cellView];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}
@end
