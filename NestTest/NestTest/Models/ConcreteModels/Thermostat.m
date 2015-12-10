//
//  Thermostat.m
//  NestTest
//
//  Created by HereTrix on 11/28/15.
//  Copyright © 2015 HereTrix. All rights reserved.
//

#import "Thermostat.h"


static NSString * const kFanTimerActive = @"fan_timer_active";
static NSString * const kHasFan = @"has_fan";
static NSString * const kAmbientTemperatureF     = @"ambient_temperature_f";

static NSString * const kTargetTemperatureF     = @"target_temperature_f";
static NSString * const kTargetTemperatureLowF  = @"target_temperature_low_f";
static NSString * const kTargetTemperatureHighF = @"target_temperature_high_f";


@implementation Thermostat


- (NSDictionary *)valuesToSave
{
    NSMutableDictionary *values = [NSMutableDictionary new];
    
    values[kTargetTemperatureF] = self.targetTemperatureF;
    values[kFanTimerActive]     = [NSNumber numberWithBool:self.fanTimerActive];
    
    return values;
}


- (void) updateWithStructure: (NSDictionary*) structure
{
    self.ambientTemperatureF    = structure[kAmbientTemperatureF];

    self.targetTemperatureLowF  = structure[kTargetTemperatureLowF];
    self.targetTemperatureHighF = structure[kTargetTemperatureHighF];
    self.targetTemperatureF     = structure[kTargetTemperatureF];
    
    self.hasFan = [structure[kHasFan] boolValue];
    
    self.fanTimerActive = [structure[kFanTimerActive] boolValue];
    
    self.nameLong = structure[kNameLong];
}


@end
