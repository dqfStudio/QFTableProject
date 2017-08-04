//
//  QFTableView.m
//  TableModel
//
//  Created by dqf on 2017/7/14.
//  Copyright © 2017年 dqfStudio. All rights reserved.
//

#import "QFTableView.h"
#import <MJRefresh.h>

@interface QFTableView ()

@property (nonatomic, strong) QFTableModel *tableModel;

@end

@implementation QFTableView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.tableModel = [[QFTableModel alloc] init];
        self.delegate = self.tableModel;
        self.dataSource = self.tableModel;
    }
    return self;
}

//add QFSectionModel
- (void)addModel:(QFSectionModel*)anObject {
    [self.tableModel addObject:anObject];
}

- (QFSectionModel *)objectAtIndex:(NSUInteger)index {
    return [self.tableModel objectAtIndex:index];
}

- (NSUInteger)indexOfObject:(QFSectionModel *)anObject {
    return [self.tableModel indexOfObject:anObject];
}

- (void)reloadModel {
    [self reloadData];;
}

//clear all model
- (void)clearModel {
    [self.tableModel clearModel];
}

//stop refresh
-(void)endRefresh {
    [self.mj_header endRefreshing];
    [self.mj_footer endRefreshing];
}

- (void)refreshView:(id)object withJson:(NSData *)json {
    if (json) {
        //先清除数据
        [self clearModel];
        [self loadView:object withJson:json];
    }
}

- (void)loadView:(id)object withJson:(NSData *)json {
    QFTableStyle *tableStyle = [QFTableStyle yy_modelWithJSON:json];
    for (QFSectionStyle *sectionStyle in tableStyle.sections) {
        NSUInteger section = [tableStyle.sections indexOfObject:sectionStyle];
        [object performSelector:NSSelectorFromString(sectionStyle.selector) withObjects:nil];
        for (NSString *cellStyle in sectionStyle.cells) {
            NSString *selector = [NSString stringWithFormat:@"%@:",cellStyle];
            [object performSelector:NSSelectorFromString(selector) withObjects:@[@(section)]];
        }
    }
    //刷新列表
    [self reloadModel];
    [self endRefresh];
}

- (void)setRefreshBlock:(QFRefreshBlock)refreshBlock {
    _refreshBlock = refreshBlock;
    if (_refreshBlock) {
        self.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            _refreshBlock();
        }];
    }else {
        self.mj_header = nil;
    }
}

- (void)setLoadMoreBlock:(QFLoadMoreBlock)loadMoreBlock {
    _loadMoreBlock = loadMoreBlock;
    if (_loadMoreBlock) {
        self.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
           _loadMoreBlock();
        }];
    }else {
        self.mj_footer = nil;
    }
}

@end

