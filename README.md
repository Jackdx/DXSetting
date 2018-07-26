# DXSetting

[![Build Status](https://camo.githubusercontent.com/474a2feaf657f12a6d2f1109a07886ba92fe3d31/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f6275696c642d70617373696e672d627269676874677265656e2e737667)](https://camo.githubusercontent.com/474a2feaf657f12a6d2f1109a07886ba92fe3d31/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f6275696c642d70617373696e672d627269676874677265656e2e737667)
[![Cocoapods Compatible](https://img.shields.io/cocoapods/v/ZFSetting.svg)](https://img.shields.io/cocoapods/v/ZFSetting.svg)
[![Build Status](https://camo.githubusercontent.com/c0e82513e10f9760e334cbed2799b3c86adf08d5/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f6c616e67756167652d6f626a632d3537383765352e737667)](https://camo.githubusercontent.com/c0e82513e10f9760e334cbed2799b3c86adf08d5/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f6c616e67756167652d6f626a632d3537383765352e737667)
[![Build Status](https://camo.githubusercontent.com/e7302c620b3589a361fc5503732f3505347205d4/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f6c6963656e73652d4d49542d627269676874677265656e2e737667)](https://camo.githubusercontent.com/e7302c620b3589a361fc5503732f3505347205d4/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f6c6963656e73652d4d49542d627269676874677265656e2e737667)

大部分应用都有设置模块，每次写都差不多，就封装了下，应该可以适配绝大部分的设置界面的需求了。

### 效果演示：
![image](https://github.com/Jackdx/DXSetting/raw/master/photo.jpg=200x)

### Installation with CocoaPods
```
    pod 'DXSetting'
```

### How To Use
直接继承DXBaseSettingViewController，实现以下方法就可以实现设置页面的显示。

#### 简单的cell
```
__weak typeof(self) weakSelf = self;
// 1.1.新消息通知
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
group.sectionHeaderTitle = @"简单设置";
group.items = @[push, shake];
[self.allGroups addObject:group];

```
#### 复杂的cell

```
__weak typeof(self) weakSelf = self;
// 1.1.手机号
DXSettingItem *phone = [DXSettingItem itemWithIcon:@"MorePush" title:@"手机号" detailTitle:@"18671717171" type:DXSystemSettingItemTypeArrow];
//cell点击事件
phone.operation = ^{
UIViewController *phoneVC = [[UIViewController alloc] init];
phoneVC.view.backgroundColor = [UIColor brownColor];
phoneVC.title = @"手机号";
[weakSelf.navigationController pushViewController:phoneVC animated:YES];
};

// 1.2.复杂cell
DXSettingItem *shake = [DXSettingItem itemWithIcon:@"sound_Effect" title:@"特别" detailTitle:@"我是描述文字" type:DXSystemSettingItemTypeSwitch style:UITableViewCellStyleSubtitle];
//开关事件
shake.switchBlock = ^(BOOL on) {
NSLog(@"声音提示%zd",on);
};

DXSettingGroup *group = [[DXSettingGroup alloc] init];
group.sectionHeaderTitle = @"复杂设置";
group.items = @[phone, shake];
[self.allGroups addObject:group];

```
