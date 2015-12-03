//
//  AppDelegate.h
//  health
//
//  Created by lizhuzhu on 15/10/25.
//  Copyright © 2015年 lizhuzhu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HPublic.h"

@class Track;
@class YTKKeyValueStore;
@class LeftSlideViewController;
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) YTKKeyValueStore  *localStore;

@property (strong, nonatomic) UINavigationController            *nav;
@property (strong, nonatomic) LeftSlideViewController           *leftSlideVC;
@end

