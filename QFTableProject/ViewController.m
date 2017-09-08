//
//  ViewController.m
//  QFTableProject
//
//  Created by dqf on 2017/8/4.
//  Copyright © 2017年 dqfStudio. All rights reserved.
//

#import "ViewController.h"
#import "QFWeakDefine.h"
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
//        NSArray *arr = @[@"getSection<0>&getViewCell",
//                         @"getSection<0>&getViewCell",
//                         @"getSection<0>&getViewCell",
//                         @"getSection<1>&getViewCell2"];
//        sleep(2);
//        [self.table refreshView:self withArr:arr];
//    };
//    
//    self.table.loadMoreBlock = ^{
//        @ss
//        NSArray *arr = @[@"getSection<0>&getViewCell",
//                         @"getSection<0>&getViewCell",
//                         @"getSection<0>&getViewCell",
//                         @"getSection<1>&getViewCell2"];
//        sleep(2);
//        [self.table loadView:self withArr:arr];
//    };
    
    //先刷新一次数据
    self.table.refreshBlock();
    
}

- (void)getSection:(id)sender {
    QFSectionModel *sectionModel = sender;
    sectionModel.headerHeight = 22;
    sectionModel.footerHeight = 1;
}

- (void)getViewCell:(id)sender {
    QFCellModel *cellModel = sender;
    cellModel.height = 55;
    cellModel.renderBlock = [self renderBlock];
    cellModel.selectionBlock = [self selectionBlock];
}

- (void)getViewCell2:(id)sender {
    QFCellModel *cellModel = sender;
    cellModel.height = 55;
    cellModel.renderBlock = [self renderBlock2];
    cellModel.selectionBlock = [self selectionBlock];
}

- (QFCellRenderBlock)renderBlock {
    return ^UITableViewCell *(NSIndexPath *indexPath, UITableView *table) {
        
        QFSwitchCell *cell = [QFSwitchCell registerTable:table];
        [cell setBackgroundColor:[UIColor colorWithWhite:1.0 alpha:0.35]];
        
        switch (indexPath.row) {
            case 0:
            {
                cell.textLabel.text = @"路径追踪";
                cell.callback = ^(UISwitch *sender) {
                };
                return cell;
            }
                break;
            case 1:
            {
                cell.textLabel.text = @"网络调试";
                cell.callback = ^(UISwitch *sender) {
                };
                return cell;
            }
                break;
            case 2:
            {
                cell.textLabel.text = @"点击追踪";
                cell.callback = ^(UISwitch *sender) {
                };
                return cell;
            }
                break;
                
            default:
                cell.textLabel.text = @"else";
                return cell;
                break;
        }
    };
}

- (QFCellRenderBlock)renderBlock2 {
    return ^UITableViewCell *(NSIndexPath *indexPath, UITableView *table) {
        
        QFSwitchCell *cell = [QFSwitchCell registerTable:table];
        [cell setBackgroundColor:[UIColor colorWithWhite:1.0 alpha:0.35]];
        cell.textLabel.text = @"路径追踪2";
        cell.callback = ^(UISwitch *sender) {
        };
        return cell;
    };
}

- (QFCellSelectionBlock)selectionBlock {
    return ^(NSIndexPath *indexPath, UITableView *table) {
        [table deselectRowAtIndexPath:indexPath animated:YES];
    };
}

@end
