//
//  DXSettingViewController.m
//  DXSetting
//
//  Created by dengxiang on 2018/7/26.
//  Copyright © 2018年 DX. All rights reserved.
//

#import "DXSettingViewController.h"
#import "DXPushNoticeViewController.h"

@interface DXSettingViewController ()

@end

@implementation DXSettingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1];
    self.title = @"设置";
    
    // 1.第0组：3个
    [self add0SectionItems];
    
    // 2.第1组：6个
    [self add1SectionItems];
  
}
#pragma mark 添加第0组的模型数据
- (void)add0SectionItems
{
    __weak typeof(self) weakSelf = self;
    // 1.1.推送和提醒
    DXSettingItem *push = [DXSettingItem itemWithIcon:@"MorePush" title:@"新消息通知" type:DXSystemSettingItemTypeArrow];
    //cell点击事件
    push.operation = ^{
        DXPushNoticeViewController *notice = [[DXPushNoticeViewController alloc] init];
        [weakSelf.navigationController pushViewController:notice animated:YES];
    };
    
    // 1.2.声音提示
    DXSettingItem *shake = [DXSettingItem itemWithIcon:@"sound_Effect" title:@"声音提示" type:DXSystemSettingItemTypeSwitch];
    //开关事件
    shake.switchBlock = ^(BOOL on) {
        NSLog(@"声音提示%zd",on);
    };
    
    DXSettingGroup *group = [[DXSettingGroup alloc] init];
    group.sectionHeaderTitle = @"基本设置";
    group.items = @[push, shake];
    [self.allGroups addObject:group];
}

#pragma mark 添加第1组的模型数据
- (void)add1SectionItems
{
    __weak typeof(self) weakSelf = self;
    // 帮助
    DXSettingItem *help = [DXSettingItem itemWithIcon:@"MoreHelp" title:@"帮助" type:DXSystemSettingItemTypeArrow];
    help.operation = ^{
        UIViewController *helpVC = [[UIViewController alloc] init];
        helpVC.view.backgroundColor = [UIColor grayColor];
        helpVC.title = @"帮助";
        [weakSelf.navigationController pushViewController:helpVC animated:YES];
    };
    
    // 分享
    DXSettingItem *share = [DXSettingItem itemWithIcon:@"MoreShare" title:@"分享" type:DXSystemSettingItemTypeArrow];
    share.operation = ^{
        UIViewController *helpVC = [[UIViewController alloc] init];
        helpVC.view.backgroundColor = [UIColor lightGrayColor];
        helpVC.title = @"分享";
        [weakSelf.navigationController pushViewController:helpVC animated:YES];
    };
    
    // 关于
    DXSettingItem *about = [DXSettingItem itemWithIcon:@"MoreAbout" title:@"关于" type:DXSystemSettingItemTypeArrow];
    about.operation = ^{
        UIViewController *helpVC = [[UIViewController alloc] init];
        helpVC.view.backgroundColor = [UIColor brownColor];
        helpVC.title = @"关于";
        [weakSelf.navigationController pushViewController:helpVC animated:YES];
    };
    
    DXSettingGroup *group = [[DXSettingGroup alloc] init];
    group.sectionHeaderTitle = @"高级设置";
    group.sectionFooterTitle = @"这是footer";
    group.items = @[ help, share , about];
    [self.allGroups addObject:group];
}

@end
