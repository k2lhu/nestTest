//
//  NestDevice.m
//  NestTest
//
//  Created by HereTrix on 12/3/15.
//  Copyright © 2015 HereTrix. All rights reserved.
//

#import "NestDevice.h"


NSString * const kDeviceID = @"device_id";
NSString * const kNameLong = @"name_long";


@implementation NestDevice


+ (instancetype) createWithID: (NSString*) deviceID
{
    NestDevice *device = [self new];
    device.deviceId    = deviceID;
    
    return device;
}


- (void) updateWithStructure: (NSDictionary*) structure
{
    
}


- (NSDictionary*) valuesToSave
{
    return nil;
}


@end
