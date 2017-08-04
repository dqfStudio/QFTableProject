//
//  ViewController.m
//  QFTableProject
//
//  Created by dqf on 2017/8/4.
//  Copyright © 2017年 dqfStudio. All rights reserved.
//

#import "ViewController.h"
#import "QFTableView.h"
#import "QFEventCell.h"

@interface ViewController ()

@property (nonatomic) QFTableView *table;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor grayColor]];
    
    _table = [[QFTableView alloc] initWithFrame:self.view.frame];
    [_table setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:_table];
    
    [self initUI];
}

- (void)initUI {
    
    @ws
    self.table.refreshBlock = ^{
        @ss
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"jsonFile" ofType:@"geojson"];
        NSData *data = [NSData dataWithContentsOfFile:filePath];
        sleep(2);
        [self.table refreshView:self withJson:data];
    };
    
    self.table.loadMoreBlock = ^{
        @ss
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"jsonFile" ofType:@"geojson"];
        NSData *data = [NSData dataWithContentsOfFile:filePath];
        sleep(2);
        [self.table loadView:self withJson:data];
    };
    
    //先刷新一次数据
    self.table.refreshBlock();
    
}

- (void)getSection {
    QFSectionModel *sectionModel = [QFSectionModel section];
    [self.table addModel:sectionModel];
    
    sectionModel.headerHeight = 22;
    sectionModel.footerHeight = 1;
}

- (void)getTrackingCell:(NSNumber *)index {
    QFCellModel *cellModel = [QFCellModel cell];
    cellModel.height = 55;
    cellModel.renderBlock = ^UITableViewCell *(NSIndexPath *indexPath, UITableView *table) {
        QFEventCell *cell = [QFEventCell registerTable:table];
        [cell setBackgroundColor:[UIColor colorWithWhite:1.0 alpha:0.35]];
        cell.textLabel.text = @"路径追踪";
        cell.callback = ^(UISwitch *sender) {
        };
        return cell;
    };
    cellModel.selectionBlock = ^(NSIndexPath *indexPath, UITableView *table) {
        [table deselectRowAtIndexPath:indexPath animated:YES];
    };
    [[self.table objectAtIndex:index.integerValue] addObject:cellModel];
}

- (void)getNetworkCell:(NSNumber *)index {
    QFCellModel *cellModel = [QFCellModel cell];
    cellModel.height = 55;
    cellModel.renderBlock = ^UITableViewCell *(NSIndexPath *indexPath, UITableView *table) {
        QFEventCell *cell = [QFEventCell registerTable:table];
        [cell setBackgroundColor:[UIColor colorWithWhite:1.0 alpha:0.35]];
        cell.textLabel.text = @"网络调试";
        cell.callback = ^(UISwitch *sender) {
        };
        return cell;
    };
    cellModel.selectionBlock = ^(NSIndexPath *indexPath, UITableView *table) {
        [table deselectRowAtIndexPath:indexPath animated:YES];
    };
    [[self.table objectAtIndex:index.integerValue] addObject:cellModel];
}

- (void)getViewCell:(NSNumber *)index {
    QFCellModel *cellModel = [QFCellModel cell];
    cellModel.height = 55;
    cellModel.renderBlock = ^UITableViewCell *(NSIndexPath *indexPath, UITableView *table) {
        QFEventCell *cell = [QFEventCell registerTable:table];
        [cell setBackgroundColor:[UIColor colorWithWhite:1.0 alpha:0.35]];
        cell.textLabel.text = @"点击追踪";
        cell.callback = ^(UISwitch *sender) {
        };
        return cell;
    };
    cellModel.selectionBlock = ^(NSIndexPath *indexPath, UITableView *table) {
        [table deselectRowAtIndexPath:indexPath animated:YES];
    };
    [[self.table objectAtIndex:index.integerValue] addObject:cellModel];
}

@end
