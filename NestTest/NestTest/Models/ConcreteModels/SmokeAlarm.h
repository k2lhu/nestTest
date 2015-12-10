//
//  SmokeAlarm.h
//  NestTest
//
//  Created by HereTrix on 12/1/15.
//  Copyright © 2015 HereTrix. All rights reserved.
//

#import "NestDevice.h"


@interface SmokeAlarm : NestDevice


@property (nonatomic) BOOL isOnline;
@property (strong, nonatomic) NSString *uiColorState;
@property (strong, nonatomic) NSString *smokeAlarmState;


@end
