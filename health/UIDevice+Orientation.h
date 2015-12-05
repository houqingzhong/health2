//
//  UIDevice+Orientation.h
//  YKMediaPlayer
//
//  Created by flexih on 11/22/12.
//  Copyright (c) 2012 youku. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (Orientation)

- (void)setOrientation:(UIDeviceOrientation)orientation;
- (NSInteger)interfaceOrientation;

@end
