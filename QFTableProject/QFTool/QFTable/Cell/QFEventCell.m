//
//  QFEventCell.m
//  MGMobileMusic
//
//  Created by dqf on 2017/7/22.
//  Copyright © 2017年 migu. All rights reserved.
//

#import "QFEventCell.h"

@interface QFEventCell ()
@property (nonatomic, strong) UISwitch *switchButton;
@end

@implementation QFEventCell

KGetClassImplementation

- (UISwitch *)switchButton {
    if (!_switchButton) {
        _switchButton = [[UISwitch alloc] init];
        _switchButton.center = CGPointMake(CGRectGetWidth([UIScreen mainScreen].bounds)-CGRectGetWidth(_switchButton.frame), self.center.y);
        [_switchButton addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
    }
    return _switchButton;
}

- (void)initUI {
    [self addSubview:self.switchButton];
}

- (void)switchAction:(UISwitch *)sender {  
    if (self.callback) {
        self.callback(sender);
    }
}

@end
