//
//  ThermostatManager.m
//  NestTest
//
//  Created by HereTrix on 11/29/15.
//  Copyright © 2015 HereTrix. All rights reserved.
//

#import "ThermostatManager.h"


@interface ThermostatManager()

@end


@implementation ThermostatManager


+ (instancetype) shared
{
    static dispatch_once_t once;
    static ThermostatManager *instance;
    
    dispatch_once(&once, ^{
        instance = [[self alloc] init];
    });
    
    return instance;
}


- (Class) deviceType
{
    return [Thermostat class];
}


- (NSString*) devicePath
{
    return @"devices/thermostats";
}


@end
