//
//  QFMiddleTitleCell.m
//  MGMobileMusic
//
//  Created by dqf on 2017/8/4.
//  Copyright © 2017年 migu. All rights reserved.
//

#import "QFMiddleTitleCell.h"

@implementation QFMiddleTitleCell

- (UILabel *)middlelabel {
    if (!_middlelabel) {
        _middlelabel = [[UILabel alloc] init];
        [_middlelabel setBackgroundColor:[UIColor clearColor]];
        [_middlelabel setTextColor:[UIColor colorWithRed:174/255.0 green:174/255.0 blue:174/255.0 alpha:1.0]];
        [_middlelabel setTextAlignment:(NSTextAlignmentCenter)];
        [_middlelabel setFont:[UIFont systemFontOfSize:14]];
    }
    return _middlelabel;
}

- (void)initUI {
    
    [self addSubview:self.middlelabel];
    
    self.accessoryType = UITableViewCellAccessoryNone;
    self.selectionStyle = UITableViewCellSelectionStyleDefault;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.middlelabel setFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame))];
}

@end

