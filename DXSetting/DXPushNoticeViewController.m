//
//  DXPushNoticeViewController.m
//  DXSetting
//
//  Created by dengxiang on 2018/7/26.
//  Copyright © 2018年 DX. All rights reserved.
//

#import "DXPushNoticeViewController.h"

@interface DXPushNoticeViewController ()

@end

@implementation DXPushNoticeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1];
    self.title = @"新消息通知";
    [self setData];
}
- (void)setData
{
    // 1.1
    DXSettingItem *item1 = [DXSettingItem itemWithIcon:nil title:@"接收新消息通知" type:DXSystemSettingItemTypeNone];
    //开关事件
    item1.switchBlock = ^(BOOL on) {
        NSLog(@"接收新消息通知%zd",on);
    };
    
    // 1.2
    DXSettingItem *item2 = [DXSettingItem itemWithIcon:nil title:@"通知显示消息详情" type:DXSystemSettingItemTypeSwitch];
    item2.switchBlock = ^(BOOL on) {
        NSLog(@"通知显示消息详情%zd",on);
    };
    
    // 1.3
    DXSettingItem *item3 = [DXSettingItem itemWithIcon:nil title:@"功能消息免打扰" type:DXSystemSettingItemTypeArrow];
    item3.switchBlock = ^(BOOL on) {
        NSLog(@"功能消息免打扰%zd",on);
    };
    
    // 1.4
    DXSettingItem *item4 = [DXSettingItem itemWithIcon:nil title:@"声音" type:DXSystemSettingItemTypeSwitch];
    item4.switchBlock = ^(BOOL on) {
        NSLog(@"声音%zd",on);
    };
    
    // 1.5
    DXSettingItem *item5 = [DXSettingItem itemWithIcon:nil title:@"振动" type:DXSystemSettingItemTypeSwitch];
    item5.switchBlock = ^(BOOL on) {
        NSLog(@"振动%zd",on);
    };
    
    // 1.6
    DXSettingItem *item6 = [DXSettingItem itemWithIcon:nil title:@"朋友圈照片更新" type:DXSystemSettingItemTypeSwitch];
    item6.switchBlock = ^(BOOL on) {
        NSLog(@"朋友圈照片更新%zd",on);
    };
    
    DXSettingGroup *group1 = [[DXSettingGroup alloc] init];
    group1.items = @[item1];
    group1.sectionFooterTitle = @"如果你要关闭或者开启微信的新消息通知，请在iPhone的“设置”-“通知”功能中，找到应用程序“XX”更改如果你要关闭或者开启微信的新消息通知，请在iPhone的“设置”-“通知”功能中，找到应用程序“XX”更改如果你要关闭或者开启微信的新消息通知，请在iPhone的“设置”-“通知”功能中，找到应用程序“XX”更改";
    [self.allGroups addObject:group1];
    
    DXSettingGroup *group2 = [[DXSettingGroup alloc] init];
    group2.items = @[item2];
    group2.sectionFooterTitle = @"关闭后，当收到微信呢消息时，通知提示将不显示发现人和内容摘要";
    [self.allGroups addObject:group2];
    
    DXSettingGroup *group3 = [[DXSettingGroup alloc] init];
    group3.items = @[item3];
    group3.sectionFooterTitle = @"设置系统功能消息提示声音和振动的时段";
    [self.allGroups addObject:group3];
    
    DXSettingGroup *group4 = [[DXSettingGroup alloc] init];
    group4.items = @[item4,item5];
    group4.sectionFooterTitle = @"当XX运行时，你可以设置是否需要声音或振动";
    [self.allGroups addObject:group4];
    
    DXSettingGroup *group5 = [[DXSettingGroup alloc] init];
    group5.items = @[item6];
    group5.sectionFooterTitle = @"关闭后，有朋友更新照片时，界面将不会出现提示";
    [self.allGroups addObject:group5];
}

@end
