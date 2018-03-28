//
//  ViewController.m
//  QFTableProject
//
//  Created by dqf on 2017/8/4.
//  Copyright © 2017年 migu. All rights reserved.
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
    [self setTitle:@"main"];
    [self.navigationController.navigationBar setHidden:YES];
    
//    _table = [[QFTableView alloc] initWithFrame:self.view.frame];
//    [_table setBackgroundColor:[UIColor clearColor]];
//    [self.view addSubview:_table];
//
//    [self initUI];
    
    UILabel *label = [[UILabel alloc] init];
    [label setFrame:CGRectMake(0, 100, 200, 190)];
    [label setBackgroundColor:[UIColor redColor]];
//    [label setText:@"hjk放假啊冷风机奥拉夫啊；放假啊；房价啊；啊；放假啊；加；案件发夹安抚就；就发发简历安抚；阿附近啊；峰就阿发"];
    [label setText:@"hjk放假啊冷风机放假啊冷风机"];
    [label setImgUrl:@"popup-title-pic-update"];
    [label setImgIndex:160];
    [label setImgSize:CGSizeMake(100, 90)];
    [label setWordAlign:NSWordAlignTop];
//    [label setWordAlign:NSWordAlignCenter];
//    [label setWordAlign:NSWordAlignBottom];
//    [label setFitImg:YES];
    [label setNumberOfLines:0];
    [label formatThatFits];
//    [label setTextAlignment:NSTextAlignmentCenter];
    
    [self.view addSubview:label];
}

- (void)initUI {
    
//    @ws
    self.table.refreshBlock = ^{
//        @ss
//        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"jsonFile" ofType:@"geojson"];
//        NSData *data = [NSData dataWithContentsOfFile:filePath];
//        sleep(2);
//        [self.table refreshView:self withJson:data];
    };
    
//    self.table.loadMoreBlock = ^{
//        @ss
//        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"jsonFile" ofType:@"geojson"];
//        NSData *data = [NSData dataWithContentsOfFile:filePath];
//        sleep(2);
//        [self.table loadView:self withJson:data];
//    };
    
//    @ws
//    self.table.refreshBlock = ^{
//        @ss
//        NSArray *arr = @[@"sectionModel<0>cellModel",
//                         @"sectionModel<0>cellModel",
//                         @"sectionModel<0>cellModel",
//                         @"sectionModel<1>cellModel2"];
//        sleep(2);
//        [self.table refreshView:self withArr:arr];
//    };
//    
//    self.table.loadMoreBlock = ^{
//        @ss
//        NSArray *arr = @[@"sectionModel<0>cellModel",
//                         @"sectionModel<0>cellModel",
//                         @"sectionModel<0>cellModel",
//                         @"sectionModel<1>cellModel2"];
//        sleep(2);
//        [self.table loadView:self withArr:arr];
//    };
    
    //先刷新一次数据
    [self.table beginRefresh];
    
}

- (void)sectionModel:(id)sender {
    QFSectionModel *sectionModel = sender;
    sectionModel.headerHeight = 22;
}

- (void)cellModel:(id)sender {
    QFCellModel *cellModel = sender;
    cellModel.height = 55;
    cellModel.renderBlock = [self renderBlock];
    cellModel.selectionBlock = [self selectionBlock];
}

- (void)cellModel2:(id)sender {
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
                cell.textLabel.text = @"路径追踪";
                cell.callback = ^(UISwitch *sender) {};
                break;
            case 1:
                cell.textLabel.text = @"网络调试";
                cell.callback = ^(UISwitch *sender) {};
                break;
            case 2:
                cell.textLabel.text = @"点击追踪";
                cell.callback = ^(UISwitch *sender) {};
                break;
                
            default:
                cell.textLabel.text = @"else";
                break;
        }
        return cell;
    };
}

- (QFCellRenderBlock)renderBlock2 {
    return ^UITableViewCell *(NSIndexPath *indexPath, UITableView *table) {
        
        QFSwitchCell *cell = [QFSwitchCell registerTable:table];
        [cell setBackgroundColor:[UIColor colorWithWhite:1.0 alpha:0.35]];
        cell.textLabel.text = @"路径追踪2";
        cell.callback = ^(UISwitch *sender) {};
        return cell;
    };
}

- (QFCellSelectionBlock)selectionBlock {
    return ^(NSIndexPath *indexPath, UITableView *table) {
        [table deselectRowAtIndexPath:indexPath animated:YES];
    };
}

@end
