//
//  AGAnnotation.h
//  LocationDispatch
//
//  Created by Vermillion on 12.02.15.
//  Copyright (c) 2015 Agilie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "AGLocation.h"

typedef enum {
    AGAnnotationType0Start,
    AGAnnotationType0Finish,
    AGAnnotationType1Start,
    AGAnnotationType1Finish,
    AGAnnotationType2Start,
    AGAnnotationType2Finish
} AGAnnotationType;

@interface AGAnnotation : NSObject<MKAnnotation>

@property (assign, nonatomic) AGAnnotationType type;

- (id)initWithType:(AGAnnotationType)type location:(AGLocation *)location;

- (NSString *)annotationImageName;

- (void)setCoordinate:(CLLocationCoordinate2D)newCoordinate;

@end
