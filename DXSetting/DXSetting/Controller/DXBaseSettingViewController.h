//
//  DXBaseSettingViewController.h
//  DXSetting
//
//  Created by dengxiang on 2018/7/26.
//  Copyright © 2018年 DX. All rights reserved.
//  

#import <UIKit/UIKit.h>
#import "DXSettingGroup.h"
#import "DXSettingItem.h"

@interface DXBaseSettingViewController : UIViewController

@property (nonatomic, strong, readonly) NSMutableArray *allGroups; // 所有的组模型

@end
