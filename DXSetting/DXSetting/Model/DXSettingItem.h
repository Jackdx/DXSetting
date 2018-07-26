//
//  DXSettingItem.h
//  DXSetting
//
//  Created by dengxiang on 2018/7/26.
//  Copyright © 2018年 DX. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger,DXSettingItemType){
    DXSystemSettingItemTypeNone = 0, // 什么也没有
    DXSystemSettingItemTypeArrow, // 箭头
    DXSystemSettingItemTypeSwitch // 开关
//    DXCustomSettingItemTypeSwitch,//右上角UISwitch // 自定义的类型
//    DXCustomSettingItemTypeButton//按钮
};
@interface DXSettingItem : NSObject

@property (nonatomic, assign) DXSettingItemType type;// Cell的样式
@property (nonatomic, assign) UITableViewCellStyle style;//Cell的类型
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *detailTitle;
@property (nonatomic, assign) CGFloat itemHeight;

/** cell上开关的操作事件 */
@property (nonatomic, copy) void (^switchBlock)(BOOL on) ;
@property (nonatomic, copy) void (^operation)(void) ; // 点击cell后要执行的操作
+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title detailTitle:(NSString *)detailTitle type:(DXSettingItemType)type style:(UITableViewCellStyle)style;

// cell样式默认是UITableViewCellStyleDefault
+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title type:(DXSettingItemType)type;

// 带detailTitle的cell样式默认是UITableViewCellStyleValue1
+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title detailTitle:(NSString *)detailTitle type:(DXSettingItemType)type;
@end
