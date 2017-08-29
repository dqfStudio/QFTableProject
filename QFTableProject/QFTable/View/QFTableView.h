//
//  QFTableView.h
//  TableModel
//
//  Created by dqf on 2017/7/14.
//  Copyright © 2017年 dqfStudio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QFTableModel.h"
#import "NSObject+selector.h"
#import "QFSectionModel.h"

typedef void (^QFRefreshBlock)();
typedef void (^QFLoadMoreBlock)();

/**
 *  QFTableView implements some methods in UITableViewDelegate & UITableViewDataSource.
 *  it can be used as the delegate & dataSource of a tableView.
 *  For those methods it doesn't implement, you can implement them in its subclass.
 */
@interface QFTableView : UITableView

@property (nonatomic, copy) QFRefreshBlock  refreshBlock;   // block to refresh data
@property (nonatomic, copy) QFLoadMoreBlock loadMoreBlock;  // block to load more data

//add QFSectionModel
- (void)addModel:(QFSectionModel*)anObject;

- (QFSectionModel *)objectAtIndex:(NSUInteger)index;

- (NSUInteger)indexOfObject:(QFSectionModel *)anObject;

- (void)reloadModel;

//clear all model
- (void)clearModel;

//stop refresh
- (void)endRefresh;

- (void)refreshView:(id)object withJson:(NSData *)json;

- (void)refreshView:(id)object withArr:(NSArray *)arr;

- (void)loadView:(id)object withArr:(NSArray *)arr;

- (void)loadView:(id)object withJson:(NSData *)json;

@end