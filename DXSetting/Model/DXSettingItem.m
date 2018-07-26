//
//  DXSettingItem.m
//  DXSetting
//
//  Created by dengxiang on 2018/7/26.
//  Copyright © 2018年 DX. All rights reserved.
//

#import "DXSettingItem.h"

@implementation DXSettingItem
+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title detailTitle:(NSString *)detailTitle type:(DXSettingItemType)type style:(UITableViewCellStyle)style
{
    DXSettingItem *item = [[self alloc] init];
    item.icon = icon;
    item.title = title;
    item.type = type;
    item.detailTitle = detailTitle;
    item.style = style;
    return item;
    
}
+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title type:(DXSettingItemType)type
{
    return  [self itemWithIcon:icon title:title detailTitle:nil type:type style:UITableViewCellStyleDefault];
}
+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title detailTitle:(NSString *)detailTitle type:(DXSettingItemType)type
{
    return  [self itemWithIcon:icon title:title detailTitle:detailTitle type:type style:UITableViewCellStyleValue1];
}
@end
