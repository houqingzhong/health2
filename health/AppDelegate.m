//
//  AppDelegate.m
//  health
//
//  Created by lizhuzhu on 15/10/25.
//  Copyright © 2015年 lizhuzhu. All rights reserved.
//

#import "AppDelegate.h"
#import "HPublic.h"
#import "LeftSlideViewController.h"
#import "LeftSortsViewController.h"
#import "MainViewController.h"

@interface AppDelegate ()
@end

@implementation AppDelegate

- (void)setup
{
    
    [SHDocumentsFile setUp];
    
    self.localStore = [[YTKKeyValueStore alloc] initDBWithName:@"local-key-value"];
    NSString *tableName = server_data_cahce;
    [_localStore createTableWithName:tableName];
    
    tableName = setting_data_cache;
    [_localStore createTableWithName:tableName];

}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self setup];
    
    
    [[UINavigationBar appearance] setBarTintColor:[UIColor greenMunsell]];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    //[[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"nav_bg.png"] forBarMetrics:UIBarMetricsDefault];
    //4. 该item上边的文字样式
    NSDictionary *fontDic=@{
                            NSForegroundColorAttributeName:[UIColor whiteColor],
                            NSFontAttributeName:[UIFont systemFontOfSize:30*XA],  //粗体
                            };
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
    UIBarButtonItem *barItem=[UIBarButtonItem appearance];
    [barItem setTitleTextAttributes:fontDic
                           forState:UIControlStateNormal];
    [barItem setTitleTextAttributes:fontDic
                           forState:UIControlStateHighlighted];
    // 5.设置状态栏样式
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;

    
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];   //设置通用背景颜色
    //[self.window makeKeyAndVisible];
    
    MainViewController *mainVC = [[MainViewController alloc] init];
    self.nav = [[UINavigationController alloc] initWithRootViewController:mainVC];
    LeftSortsViewController *leftVC = [[LeftSortsViewController alloc] init];
    self.leftSlideVC = [[LeftSlideViewController alloc] initWithLeftView:leftVC andMainView:self.nav];
    
    self.window.rootViewController = self.nav;
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end