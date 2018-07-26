//
//  DXBaseSettingViewController.m
//  DXSetting
//
//  Created by dengxiang on 2018/7/26.
//  Copyright © 2018年 DX. All rights reserved.
//

#import "DXBaseSettingViewController.h"
#import "DXSettingCell.h"

@interface DXBaseSettingViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong ,readwrite) NSMutableArray *allGroups; // 所有的组模型
@end

@implementation DXBaseSettingViewController
- (void)loadView
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    self.view = tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.allGroups = [NSMutableArray array];
}
#pragma mark - Table view data source
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DXSettingGroup *group = self.allGroups[indexPath.section];
    DXSettingItem *item = group.items[indexPath.row];
    if (item.itemHeight) {
        return item.itemHeight;
    }
    return 44;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.allGroups.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    DXSettingGroup *group = self.allGroups[section];
    return group.items.count;
}
#pragma mark 每当有一个cell进入视野范围内就会调用，返回当前这行显示的cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    // 1.取出这行对应的模型（DXSettingItem）
    DXSettingGroup *group = self.allGroups[indexPath.section];
    DXSettingItem *item = group.items[indexPath.row];
    
    // 2.创建一个ZFSettingCell
    DXSettingCell *dxCell = [DXSettingCell settingCellWithTableView:tableView style:item.style];
    dxCell.item = item;
    __weak DXSettingCell *weakCell = dxCell;
    dxCell.switchChangeBlock = ^ (BOOL on){
        if (weakCell.item.switchBlock) {
            weakCell.item.switchBlock(on);
        }
    };
    cell = weakCell;
    return cell;
}
#pragma mark 点击了cell后的操作
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    // 0.取出这行对应的模型
    DXSettingGroup *group = self.allGroups[indexPath.section];
    DXSettingItem *item = group.items[indexPath.row];
    // 1.取出这行对应模型中的block代码
    if (item.operation) {
        // 执行block
        item.operation();
    }
}

#pragma mark 返回每一组的header标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    DXSettingGroup *group = self.allGroups[section];
    return group.sectionHeaderTitle;
}
#pragma mark 返回每一组的footer标题
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    DXSettingGroup *group = self.allGroups[section];
    return group.sectionFooterTitle;
}
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    DXSettingGroup *group = self.allGroups[section];
//    return group.sectionHeaderHeight;
//}
//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
//{
//    DXSettingGroup *group = self.allGroups[section];
//    return group.sectionFooterHeight;
//}
- (void)dealloc
{
    NSLog(@"%s",__func__);
}
@end
