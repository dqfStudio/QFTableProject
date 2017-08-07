//
//  QFBaseCell.m
//  TableModel
//
//  Created by dqf on 2017/7/14.
//  Copyright © 2017年 dqfStudio. All rights reserved.
//

#import "QFBaseCell.h"

@implementation QFBaseCell

KGetClassImplementation

+ (id)registerTable:(UITableView *)table {

    UITableViewCell *cell = [table dequeueReusableCellWithIdentifier:NSStringFromClass([self getClass])];
    if (!cell) {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleDefault
                             reuseIdentifier:NSStringFromClass([self getClass])];
    }
    return cell;
}

+ (id)registerTable:(UITableView *)table style:(UITableViewCellStyle)style {
    
    UITableViewCell *cell = [table dequeueReusableCellWithIdentifier:NSStringFromClass([self getClass])];
    if (!cell) {
        cell = [[self alloc] initWithStyle:style
                             reuseIdentifier:NSStringFromClass([self getClass])];
    }
    return cell;
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        [self initUI];
    }
    return self;
}

//子类覆盖
- (void)initUI {
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
