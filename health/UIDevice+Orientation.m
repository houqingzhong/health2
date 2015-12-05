//
//  UIDevice+Orientation.m
//  YKMediaPlayer
//
//  Created by flexih on 11/22/12.
//  Copyright (c) 2012 youku. All rights reserved.
//

#import <UIKit/UIKit.h>

@implementation UIDevice (Orientation)

- (NSInteger)interfaceOrientation
{
    switch (self.orientation) {
        case UIDeviceOrientationPortrait:
            return UIInterfaceOrientationPortrait;
        case UIDeviceOrientationLandscapeLeft:
            return UIInterfaceOrientationLandscapeRight;
        case UIDeviceOrientationLandscapeRight:
            return UIInterfaceOrientationLandscapeLeft;
        default:
            return -1;
    }
}

@end
