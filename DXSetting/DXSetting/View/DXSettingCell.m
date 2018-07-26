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
    static NSString *ID = @"DXSettingCell";
    // 1.拿到一个标识先去缓存池中查找对应的Cell
    DXSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    // 2.如果缓存池中没有，才需要传入一个标识创建新的Cell
    if (cell == nil) {
        //        cell = [[ZFSettingCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        cell = [[DXSettingCell alloc] initWithStyle:style reuseIdentifier:ID];
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
    self.imageView.image = [UIImage imageNamed:item.icon];
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
