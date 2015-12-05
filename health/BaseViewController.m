//
//  BaseViewController.m
//  health
//
//  Created by lizhuzhu on 15/10/28.
//  Copyright © 2015年 lizhuzhu. All rights reserved.
//

#import "BaseViewController.h"
#import "HPublic.h"
#import "LeftSlideViewController.h"
@implementation BaseViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(statusBarOrientationChange:) name:UIApplicationDidChangeStatusBarOrientationNotification object:nil];

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
    
    App(app);
    [app.leftSlideVC setPanEnabled:NO];
    

}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    NSLog(@"viewWillDisappear");
    
    App(app);
    [app.leftSlideVC setPanEnabled:NO];
    
}
- (void) openOrCloseLeftList
{
    App(app);
    
    if (app.leftSlideVC.closed)
    {
        [app.leftSlideVC openLeftView];
    }
    else
    {
        [app.leftSlideVC closeLeftView];
    }
}

- (void)introView
{
    
}

- (void)changeOrientation
{
    
}

- (void)statusBarOrientationChange:(NSNotification *)notif
{
    [self changeOrientation];
}
@end
