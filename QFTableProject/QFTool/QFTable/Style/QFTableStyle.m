//
//  QFTableStyle.m
//  MGMobileMusic
//
//  Created by dqf on 2017/8/2.
//  Copyright © 2017年 migu. All rights reserved.
//

#import "QFTableStyle.h"

@implementation QFTableStyle

+ (nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass {
    return @{@"sections" : [QFSectionStyle class]};
}

@end
