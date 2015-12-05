//
//  HPublic.h
//  health
//
//  Created by lizhuzhu on 15/10/25.
//  Copyright © 2015年 lizhuzhu. All rights reserved.
//

#ifndef HPublic_h
#define HPublic_h
#define XA ScreenSize.width/640
#define ScreenSize [[UIScreen mainScreen] bounds].size
#define XA ScreenSize.width/640
#define WS(s) __weak typeof (self) s = self

#define server_data_cahce  @"server_data_cahce"
#define setting_data_cache @"setting_data_cache"

#define Host       @"http://www.zhiyurencai.cn/music/api/"
#define JingLuoTag @"jingluo"

#import "AFNetworking.h"
#import "UIView+Facade.h"
#import "UIColor+MoreColors.h"
#import "UILabel+ContentSize.h"
#import "AGLocationDispatcher.h"
//#import "TTTAttributedLabel.h"
//#import "RichStyleLabel.h"
//#import "ZCAnimatedLabel.h"
#import "YTKKeyValueStore.h"
#import "JSONKit.h"
#import "AESCrypt.h"
#import "UIScrollView+SVPullToRefresh.h"
#import "UIScrollView+SVInfiniteScrolling.h"
#import <MD5Digest/NSString+MD5.h>
#import "NSString+TBEncryption.h"
#import "EPSWebViewController.h"
#import <ChameleonFramework/Chameleon.h>
#import "UIDevice+Orientation.h"
//#import "UINavigationItem+iOS7Spacing.h"
//#import "WTAZoomNavigationController.h"
//#import "UIViewC"
#import "UIViewController+ODStatusBar.h"
#import "NJKScrollFullScreen.h"
#import "UIViewController+NJKFullScreenSupport.h"
#import "MBProgressHUD.h"

#import "NSString+Extension.h"
#import "UIColor+Hex.h"
#import "HPublicMethod.h"
#import "HttpClient.h"
#import "SHFile.h"
#import "SHFile/SHDocumentsFile.h"

#import "BaseViewController.h"
#import "WebViewDetailController.h"
#import "IntroViewController.h"
#import "MainViewController.h"
#import "AppDelegate.h"


#define App(s) AppDelegate * s = (AppDelegate *)[[UIApplication sharedApplication] delegate]

#endif /* HPublic_h */
