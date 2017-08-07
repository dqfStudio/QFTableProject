//
//  ViewController.m
//  QFTableProject
//
//  Created by dqf on 2017/8/4.
//  Copyright © 2017年 dqfStudio. All rights reserved.
//

#import "ViewController.h"
#import "QFTableView.h"
#import "QFSwitchCell.h"

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
    
//    @ws
//    self.table.refreshBlock = ^{
//        @ss
//        NSArray *arr = @[@"getSection<0>&getTrackingCell",
//                         @"getSection<0>&getNetworkCell",
//                         @"getSection<1>&getViewCell",
//                         @"getSection<1>&getViewCell"];
//        sleep(2);
//        [self.table refreshView:self withArr:arr];
//    };
//    
//    self.table.loadMoreBlock = ^{
//        @ss
//        NSArray *arr = @[@"getSection<0>&getTrackingCell",
//                         @"getSection<0>&getNetworkCell",
//                         @"getSection<1>&getViewCell",
//                         @"getSection<1>&getViewCell"];
//        sleep(2);
//        [self.table loadView:self withArr:arr];
//    };
    
    //先刷新一次数据
    self.table.refreshBlock();
    
}

- (void)getSection:(NSString *)section {
    QFSectionModel *sectionModel = [self.table objectAtIndex:section.integerValue];
    if (!sectionModel) {
        sectionModel = [QFSectionModel section];
        sectionModel.headerHeight = 22;
        sectionModel.footerHeight = 1;
        [self.table addModel:sectionModel];
    }
}

- (void)getTrackingCell:(NSString *)section {
    QFCellModel *cellModel = [QFCellModel cell];
    cellModel.height = 55;
    cellModel.renderBlock = ^UITableViewCell *(NSIndexPath *indexPath, UITableView *table) {
        QFSwitchCell *cell = [QFSwitchCell registerTable:table];
        [cell setBackgroundColor:[UIColor colorWithWhite:1.0 alpha:0.35]];
        cell.textLabel.text = @"路径追踪";
        cell.callback = ^(UISwitch *sender) {
        };
        return cell;
    };
    cellModel.selectionBlock = ^(NSIndexPath *indexPath, UITableView *table) {
        [table deselectRowAtIndexPath:indexPath animated:YES];
    };
    [[self.table objectAtIndex:section.integerValue] addObject:cellModel];
}

- (void)getNetworkCell:(NSString *)section {
    QFCellModel *cellModel = [QFCellModel cell];
    cellModel.height = 55;
    cellModel.renderBlock = ^UITableViewCell *(NSIndexPath *indexPath, UITableView *table) {
        QFSwitchCell *cell = [QFSwitchCell registerTable:table];
        [cell setBackgroundColor:[UIColor colorWithWhite:1.0 alpha:0.35]];
        cell.textLabel.text = @"网络调试";
        cell.callback = ^(UISwitch *sender) {
        };
        return cell;
    };
    cellModel.selectionBlock = ^(NSIndexPath *indexPath, UITableView *table) {
        [table deselectRowAtIndexPath:indexPath animated:YES];
    };
    [[self.table objectAtIndex:section.integerValue] addObject:cellModel];
}

- (void)getViewCell:(NSString *)section {
    QFCellModel *cellModel = [QFCellModel cell];
    cellModel.height = 55;
    cellModel.renderBlock = ^UITableViewCell *(NSIndexPath *indexPath, UITableView *table) {
        QFSwitchCell *cell = [QFSwitchCell registerTable:table];
        [cell setBackgroundColor:[UIColor colorWithWhite:1.0 alpha:0.35]];
        cell.textLabel.text = @"点击追踪";
        cell.callback = ^(UISwitch *sender) {
        };
        return cell;
    };
    cellModel.selectionBlock = ^(NSIndexPath *indexPath, UITableView *table) {
        [table deselectRowAtIndexPath:indexPath animated:YES];
    };
    [[self.table objectAtIndex:section.integerValue] addObject:cellModel];
}

@end
