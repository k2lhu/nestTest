//
//  AlarmManager.m
//  NestTest
//
//  Created by HereTrix on 12/1/15.
//  Copyright © 2015 HereTrix. All rights reserved.
//

#import "AlarmManager.h"


@interface AlarmManager()


@property (strong, nonatomic) NSMutableDictionary *alarms;


@end


@implementation AlarmManager


+ (instancetype) shared
{
    static dispatch_once_t once;
    static AlarmManager *instance;
    
    dispatch_once(&once, ^{
        instance = [[self alloc] init];
    });
    
    return instance;
}


- (Class) deviceType
{
    return [SmokeAlarm class];
}


- (NSString*) devicePath
{
    return @"devices/smoke_co_alarms";
}


@end
