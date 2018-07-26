//
//  DXSettingGroup.h
//  DXSetting
//
//  Created by dengxiang on 2018/7/26.
//  Copyright © 2018年 DX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DXSettingGroup : NSObject

@property (nonatomic, copy) NSString *sectionHeaderTitle; /**< 头部标题*/
@property (nonatomic, copy) NSString *sectionFooterTitle; /**< 尾部标题*/

@property (nonatomic, assign) CGFloat sectionHeaderHeight;
@property (nonatomic, assign) CGFloat sectionFooterHeight;

@property (nonatomic, strong) NSArray *items; // 中间的条目

@end
