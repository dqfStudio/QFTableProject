//
//  QFRightTitleCell.m
//  MGMobileMusic
//
//  Created by dqf on 2017/8/4.
//  Copyright © 2017年 migu. All rights reserved.
//

#import "QFRightTitleCell.h"

@implementation QFRightTitleCell

KGetClassImplementation

- (UILabel *)rightlabel {
    if (!_rightlabel) {
        _rightlabel = [[UILabel alloc] init];
        [_rightlabel setBackgroundColor:[UIColor clearColor]];
        [_rightlabel setTextColor:[UIColor colorWithRed:174/255.0 green:174/255.0 blue:174/255.0 alpha:1.0]];
        [_rightlabel setTextAlignment:(NSTextAlignmentRight)];
        [_rightlabel setFont:[UIFont systemFontOfSize:14]];
    }
    return _rightlabel;
}

- (void)initUI {
    
    [self addSubview:self.rightlabel];

    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    self.selectionStyle = UITableViewCellSelectionStyleDefault;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.rightlabel setFrame:CGRectMake(CGRectGetWidth(self.frame)-180-27, 0, 180, CGRectGetHeight(self.frame))];
}

@end

