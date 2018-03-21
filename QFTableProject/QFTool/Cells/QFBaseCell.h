//
//  QFBaseCell.h
//  TableModel
//
//  Created by dqf on 2017/7/14.
//  Copyright © 2017年 migu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^QFCellInitBlock)(id cell);

@interface QFBaseCell : UITableViewCell

+ (id)registerTable:(UITableView *)table;



+ (id)registerTable:(UITableView *)table style:(UITableViewCellStyle)style;
+ (id)registerTable:(UITableView *)table reuseIdentifier:(NSString *)reuseIdentifier;
+ (id)registerTable:(UITableView *)table initBlock:(QFCellInitBlock)block;



+ (id)registerTable:(UITableView *)table style:(UITableViewCellStyle)style initBlock:(QFCellInitBlock)block;
+ (id)registerTable:(UITableView *)table reuseIdentifier:(NSString *)reuseIdentifier initBlock:(QFCellInitBlock)block;
+ (id)registerTable:(UITableView *)table style:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;



+ (id)registerTable:(UITableView *)table style:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier initBlock:(QFCellInitBlock)block;

//子类覆盖
- (void)initUI;

@end
