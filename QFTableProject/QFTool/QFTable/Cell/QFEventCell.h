//
//  QFEventCell.h
//  MGMobileMusic
//
//  Created by dqf on 2017/7/22.
//  Copyright © 2017年 migu. All rights reserved.
//

#import "QFBaseCell.h"

typedef void(^Callback)(UISwitch *sender);

@interface QFEventCell : QFBaseCell
@property (nonatomic, strong) Callback callback;
@end
