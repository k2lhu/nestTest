//
//  CameraManager.m
//  NestTest
//
//  Created by HereTrix on 12/1/15.
//  Copyright © 2015 HereTrix. All rights reserved.
//

#import "CameraManager.h"


@implementation CameraManager


+ (instancetype) shared
{
    static dispatch_once_t once;
    static CameraManager *instance;
    
    dispatch_once(&once, ^{
        instance = [[self alloc] init];
    });
    
    return instance;
}


- (Class) deviceType
{
    return [Camera class];
}


- (NSString*) devicePath
{
    return @"devices/cameras";
}


@end
