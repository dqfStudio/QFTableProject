//
//  QFTableView.h
//  TableModel
//
//  Created by dqf on 2017/7/14.
//  Copyright © 2017年 migu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QFTableModel.h"
#import "NSObject+selector.h"
#import "QFSectionModel.h"
#import "MJRefresh.h"

typedef void (^QFRefreshBlock)(void);
typedef void (^QFLoadMoreBlock)(void);
typedef void(^QFCellInitBlock)(id cell);

/**
 *  QFTableView implements some methods in UITableViewDelegate & UITableViewDataSource.
 *  it can be used as the delegate & dataSource of a tableView.
 *  For those methods it doesn't implement, you can implement them in its subclass.
 */
@interface QFTableView : UITableView

@property (nonatomic, assign) NSUInteger pageNo;    // page number, default 1
@property (nonatomic, assign) NSUInteger pageSize;  // page size, default 20

@property (nonatomic, copy) QFRefreshBlock  refreshBlock;   // block to refresh data
@property (nonatomic, copy) QFLoadMoreBlock loadMoreBlock;  // block to load more data

- (void)reloadModel;

//clear all model
- (void)clearModel;

//begin refresh
- (void)beginRefresh;

//stop refresh
- (void)endRefresh;

#pragma --mark register cell

- (id)registerCell:(Class)cellClass indexPath:(NSIndexPath *)indexPath;


- (id)registerCell:(Class)cellClass indexPath:(NSIndexPath *)indexPath style:(UITableViewCellStyle)style;
- (id)registerCell:(Class)cellClass indexPath:(NSIndexPath *)indexPath reuseIdentifier:(NSString *)reuseIdentifier;
- (id)registerCell:(Class)cellClass indexPath:(NSIndexPath *)indexPath initBlock:(QFCellInitBlock)block;


- (id)registerCell:(Class)cellClass indexPath:(NSIndexPath *)indexPath style:(UITableViewCellStyle)style initBlock:(QFCellInitBlock)block;
- (id)registerCell:(Class)cellClass indexPath:(NSIndexPath *)indexPath reuseIdentifier:(NSString *)reuseIdentifier initBlock:(QFCellInitBlock)block;
- (id)registerCell:(Class)cellClass indexPath:(NSIndexPath *)indexPath style:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;


- (id)registerCell:(Class)cellClass indexPath:(NSIndexPath *)indexPath style:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier initBlock:(QFCellInitBlock)block;

#pragma --mark register cell

- (void)refreshView:(id)object withArr:(NSArray *)arr;

- (void)loadView:(id)object withArr:(NSArray *)arr;

- (void)cellAtIndexPath:(NSIndexPath *)indexPath resetHeight:(NSInteger)height;

@end

@interface NSArray (QFTableView)
- (NSArray *(^)(NSArray *))linkCell;
- (void (^)(NSUInteger section, NSString *sectionModel))setSectionModel;
@end
