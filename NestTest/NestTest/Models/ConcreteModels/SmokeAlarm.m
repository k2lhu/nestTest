//
//  SmokeAlarm.m
//  NestTest
//
//  Created by HereTrix on 12/1/15.
//  Copyright © 2015 HereTrix. All rights reserved.
//

#import "SmokeAlarm.h"


static NSString * const kUiColorState = @"ui_color_state";
static NSString * const kSmokeAlarmState = @"smoke_alarm_state";


@implementation SmokeAlarm


- (void) updateWithStructure: (NSDictionary*) structure
{
    self.uiColorState    = structure[kUiColorState];
    self.smokeAlarmState = structure[kSmokeAlarmState];
}


- (NSDictionary*) valuesToSave
{
    NSMutableDictionary *values = [NSMutableDictionary new];
    
    return values;
}


@end
