//
//  Thermostat.h
//  NestTest
//
//  Created by HereTrix on 11/28/15.
//  Copyright © 2015 HereTrix. All rights reserved.
//

#import "NestDevice.h"


@interface Thermostat : NestDevice


@property (nonatomic) BOOL hasFan;
@property (nonatomic) BOOL fanTimerActive;

@property (nonatomic) NSNumber *ambientTemperatureF;

@property (nonatomic) NSNumber *targetTemperatureF;
@property (nonatomic) NSNumber *targetTemperatureHighF;
@property (nonatomic) NSNumber *targetTemperatureLowF;


@end
