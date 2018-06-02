//
//  ViewController.m
//  HTableProject
//
//  Created by dqf on 2017/8/4.
//  Copyright © 2017年 migu. All rights reserved.
//

#import "ViewController.h"
#import "HWeakDefine.h"
#import "HTableView.h"
#import "UILabel+HUtil.h"
#import "HTableViewCell.h"

@interface ViewController ()

@property (nonatomic) HTableView *table;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor grayColor]];
    [self setTitle:@"main"];
    [self.navigationController.navigationBar setHidden:YES];
    
    CGRect frame = self.view.frame;
    frame.origin.y += 22;
    frame.size.height -= 22;
    _table = [[HTableView alloc] initWithFrame:frame];
    [_table setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:_table];

    [self initUI];
}

- (void)initUI {
    @ws
    self.table.refreshBlock = ^{
        @ss
        NSArray *arr = @[@"sectionModel<0>cellModel",
                         @"sectionModel<0>cellModel",
                         @"sectionModel<1>cellModel2",
                         @"sectionModel<1>cellModel2",
                         @"sectionModel<1>cellModel2",
                         @"sectionModel<1>cellModel2",
                         @"sectionModel<1>cellModel2",
                         @"sectionModel<2>cellModel3",
                         @"sectionModel<2>cellModel3",
                         @"sectionModel<2>cellModel3"];
        sleep(2);
        [self.table refreshView:self withArr:arr];
    };
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
    HSectionModel *sectionModel = sender;
    sectionModel.headerHeight = 0;
}

- (void)cellModel:(id)sender {
    HCellModel *cellModel = sender;
    cellModel.height = 55;
    cellModel.renderBlock = [self renderBlock];
    cellModel.selectionBlock = [self selectionBlock];
}

- (void)cellModel2:(id)sender {
    HCellModel *cellModel = sender;
    cellModel.height = 55;
    cellModel.renderBlock = [self renderBlock2];
    cellModel.selectionBlock = [self selectionBlock];
}

- (void)cellModel3:(id)sender {
    HCellModel *cellModel = sender;
    cellModel.height = 55;
    cellModel.renderBlock = [self renderBlock3];
    cellModel.selectionBlock = [self selectionBlock];
}


- (HCellRenderBlock)renderBlock {
    return ^UITableViewCell *(NSIndexPath *indexPath, HTableView *table) {
        HTableViewCell *cell = [table registerCell:HTableViewCell.class indexPath:indexPath];
        [cell setBackgroundColor:[UIColor colorWithWhite:1.0 alpha:0.35]];
        
        switch (indexPath.row) {
            case 0: {
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                cell.textLabel.text = @"示例示例示例示例示例示例示例示例示例示例示例示例示例示例示例示例示例示例示例";
            }
                break;
            case 1: {
                cell.textLabel.text = @"示例示例示例示例示例示例示例示例示例示例示例示例示例示例示例示例示例示例示例";
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
                [view setBackgroundColor:[UIColor redColor]];
                [cell setAccessoryView:view];
            }
                break;
            default:
                cell.textLabel.text = @"else";
                break;
        }
        return cell;
    };
}

- (HCellRenderBlock)renderBlock2 {
    return ^UITableViewCell *(NSIndexPath *indexPath, HTableView *table) {
        HTableViewCell *cell = [table registerCell:HTableViewCell.class indexPath:indexPath style:UITableViewCellStyleValue1];
        switch (indexPath.row) {
            case 0: {
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                [cell setBackgroundColor:[UIColor colorWithWhite:1.0 alpha:0.35]];
                cell.textLabel.text = @"示例";
                cell.detailTextLabel.text = @"";
                [cell.leftImageView setImage:[UIImage imageNamed:@"testImage"]];
                cell.leftImageEdgeInsets = HCellEdgeInsetsMake(45, 45, 15, 15);
                [cell.detailTextLabel setImgIndex:0];
                [cell.detailTextLabel setRightSpace:5];
                [cell.detailTextLabel setWordAlign:NSWordAlignTop];
                [cell.detailTextLabel setImgSize:CGSizeMake(30, 30)];
                [cell.detailTextLabel setImgUrl:@"testImage"];
                [cell.detailTextLabel formatThatFits];
            }
                break;
            case 1: {
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                [cell setBackgroundColor:[UIColor colorWithWhite:1.0 alpha:0.35]];
                cell.textLabel.text = @"示例";
                cell.detailTextLabel.text = @"示例";
                [cell.detailTextLabel setImgIndex:0];
                [cell.detailTextLabel setWordAlign:NSWordAlignTop];
                [cell.detailTextLabel setImgSize:CGSizeMake(30, 30)];
                [cell.detailTextLabel setImgUrl:@"testImage"];
                [cell.detailTextLabel formatThatFits];
            }
                break;
            case 2: {
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                [cell setBackgroundColor:[UIColor colorWithWhite:1.0 alpha:0.35]];
                cell.textLabel.text = @"示例示例示例示例示例示例示例示例示例示例示例示例示例示例示例示例示例示例示例";
                cell.detailTextLabel.text = @"示例";
                [cell.leftImageView setImage:[UIImage imageNamed:@"testImage"]];
                cell.leftImageEdgeInsets = HCellEdgeInsetsMake(40, 40, 15, 15);
                [cell.detailTextLabel setImgIndex:2];
                [cell.detailTextLabel setWordAlign:NSWordAlignTop];
                [cell.detailTextLabel setImgSize:CGSizeMake(30, 30)];
                [cell.detailTextLabel setImgUrl:@"testImage"];
                [cell.detailTextLabel formatThatFits];
            }
                break;
            case 3: {
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                [cell setBackgroundColor:[UIColor colorWithWhite:1.0 alpha:0.35]];
                cell.textLabel.text = @"示例";
                cell.detailTextLabel.text = @"示例";
                [cell.leftImageView setImage:[UIImage imageNamed:@"testImage"]];
                cell.leftImageEdgeInsets = HCellEdgeInsetsMake(40, 40, 15, 15);
                [cell.detailTextLabel setImgIndex:2];
                [cell.detailTextLabel setWordAlign:NSWordAlignTop];
                [cell.detailTextLabel setImgSize:CGSizeMake(30, 30)];
                [cell.detailTextLabel setImgUrl:@"testImage"];
                [cell.detailTextLabel formatThatFits];
            }
                break;
            case 4: {
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                [cell setBackgroundColor:[UIColor colorWithWhite:1.0 alpha:0.35]];
                cell.textLabel.text = @"示例";
                cell.detailTextLabel.text = @"示例";
                [cell.imageView setImage:[UIImage imageNamed:@"testImage"]];
                [cell.detailTextLabel setImgIndex:2];
                [cell.detailTextLabel setLeftSpace:2];
                [cell.detailTextLabel setWordAlign:NSWordAlignTop];
                [cell.detailTextLabel setImgSize:CGSizeMake(30, 30)];
                [cell.detailTextLabel setImgUrl:@"testImage"];
                [cell.detailTextLabel formatThatFits];
            }
                break;
                
            default:
                break;
        }
        return cell;
    };
}

- (HCellRenderBlock)renderBlock3 {
    return ^UITableViewCell *(NSIndexPath *indexPath, HTableView *table) {
        HTableViewCell *cell = [table registerCell:HTableViewCell.class indexPath:indexPath style:UITableViewCellStyleSubtitle];
        [cell setBackgroundColor:[UIColor colorWithWhite:1.0 alpha:0.35]];
        
        switch (indexPath.row) {
            case 0: {
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                [cell.leftImageView setImage:[UIImage imageNamed:@"testImage"]];
                cell.leftImageEdgeInsets = HCellEdgeInsetsMake(40, 40, 15, 15);
                cell.textLabel.text = @"示例示例示例示例示例示例示例示例示例示例示例示例示例示例示例示例示例示例示例";
                cell.detailTextLabel.text = @"示例示例示例示例示例示例示例示例示例示例示例示例示例示例示例示例示例示例示例";
            }
                break;
            case 1: {
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
                [view setBackgroundColor:[UIColor redColor]];
                [cell setAccessoryView:view];
                [cell.leftImageView setImage:[UIImage imageNamed:@"testImage"]];
                cell.leftImageEdgeInsets = HCellEdgeInsetsMake(45, 45, 15, 15);
                cell.textLabel.text = @"示例示例示例示例示例示例示例示例示例示例示例示例示例示例示例示例示例示例示例";
                cell.detailTextLabel.text = @"示例示例示例示例示例示例示例示例示例示例示例示例示例示例示例示例示例示例示例";
            }
                break;
            default:
                cell.textLabel.text = @"else";
                break;
        }
        return cell;
    };
}

- (HCellSelectionBlock)selectionBlock {
    return ^(NSIndexPath *indexPath, HTableView *table) {
        [table deselectRowAtIndexPath:indexPath animated:YES];
    };
}

@end
