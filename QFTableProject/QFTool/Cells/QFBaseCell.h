//
//  QFBaseCell.h
//  TableModel
//
//  Created by dqf on 2017/7/14.
//  Copyright © 2017年 migu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QFBaseCell : UITableViewCell

+ (id)registerTable:(UITableView *)table;

+ (id)registerTable:(UITableView *)table style:(UITableViewCellStyle)style;

//子类覆盖
- (void)initUI;

@end
