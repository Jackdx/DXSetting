//
//  DXSettingCell.m
//  DXSetting
//
//  Created by dengxiang on 2018/7/26.
//  Copyright © 2018年 DX. All rights reserved.
//

#import "DXSettingCell.h"
#import "DXSettingItem.h"

@interface DXSettingCell()

@property (nonatomic, strong) UISwitch *cellSwitch;

@end

@implementation DXSettingCell
- (UISwitch *)cellSwitch
{
    if (!_cellSwitch) {
        _cellSwitch = [[UISwitch alloc] init];
        [_cellSwitch addTarget:self action:@selector(switchStatusChanged:) forControlEvents:UIControlEventValueChanged];
    }
    return _cellSwitch;
}
#pragma mark - SwitchValueChanged

- (void)switchStatusChanged:(UISwitch *)sender
{
    if (self.switchChangeBlock) {
        self.switchChangeBlock(sender.on);
    }
}

+ (instancetype)settingCellWithTableView:(UITableView *)tableView
{
    return [self settingCellWithTableView:tableView style:UITableViewCellStyleDefault];
}
+ (instancetype)settingCellWithTableView:(UITableView *)tableView style:(UITableViewCellStyle)style
{
    // 0.用static修饰的局部变量，只会初始化一次
    static NSString *DefaultID = @"DXUITableViewCellStyleDefault";
    static NSString *Value1ID = @"DXUITableViewCellStyleValue1";
    static NSString *SubtitleID = @"DXUITableViewCellStyleSubtitle";
    DXSettingCell *cell = nil;
    // 1.拿到一个标识先去缓存池中查找对应的Cell
    if (style == UITableViewCellStyleValue1) {
        cell = [tableView dequeueReusableCellWithIdentifier:Value1ID];
    }
    else if (style == UITableViewCellStyleSubtitle)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:SubtitleID];
    }
    else
    {
        cell = [tableView dequeueReusableCellWithIdentifier:DefaultID];
    }
    // 2.如果缓存池中没有，才需要传入一个标识创建新的Cell
    if (cell == nil) {
        if (style == UITableViewCellStyleValue1) {
            cell = [[DXSettingCell alloc] initWithStyle:style reuseIdentifier:Value1ID];
        }
        else if (style == UITableViewCellStyleSubtitle)
        {
            cell = [[DXSettingCell alloc] initWithStyle:style reuseIdentifier:SubtitleID];
        }
        else
        {
            cell = [[DXSettingCell alloc] initWithStyle:style reuseIdentifier:DefaultID];
        }
    }
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
//        self.textLabel.font = [UIFont systemFontOfSize:15];
//        self.textLabel.textColor = [UIColor blueColor];
//        self.detailTextLabel.font = [UIFont systemFontOfSize:15];
    }
    return self;
}

- (void)setItem:(DXSettingItem *)item
{
    _item = item;
    // 设置数据
    self.imageView.image = item.icon.length ? [UIImage imageNamed:item.icon] : nil;
    self.textLabel.text = item.title;
    self.detailTextLabel.text = item.detailTitle;
    
    if (item.type == DXSystemSettingItemTypeArrow) {
        
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        // 用默认的选中样式
        self.selectionStyle = UITableViewCellSelectionStyleBlue;
        
    } else if (item.type == DXSystemSettingItemTypeSwitch) {
      
        // 右边显示开关
        self.accessoryView = self.cellSwitch;
        // 禁止选中
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
    } else {
        // 什么也没有，清空右边显示的view
        self.accessoryView = nil;
        // 用默认的选中样式
        self.selectionStyle = UITableViewCellSelectionStyleBlue;
        
    }
}

@end
