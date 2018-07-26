//
//  DXSettingCell.h
//  DXSetting
//
//  Created by dengxiang on 2018/7/26.
//  Copyright © 2018年 DX. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DXSettingItem;

@interface DXSettingCell : UITableViewCell

@property (nonatomic, strong) DXSettingItem *item;
/** switch状态改变的block*/
@property (copy, nonatomic) void(^switchChangeBlock)(BOOL on);

+ (instancetype)settingCellWithTableView:(UITableView *)tableView;
+ (instancetype)settingCellWithTableView:(UITableView *)tableView style:(UITableViewCellStyle)style;

@end
