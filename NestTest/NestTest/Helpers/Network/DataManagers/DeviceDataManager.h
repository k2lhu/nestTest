//
//  DeviceDataManager.h
//  NestTest
//
//  Created by HereTrix on 12/3/15.
//  Copyright © 2015 HereTrix. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NestDevice.h"


extern NSString * const kDeviceChangedNotification;
extern NSString * const kDeviceManagerUpdatedNotification;
extern NSString * const kDeviceKey;


@interface DeviceDataManager : NSObject


+ (instancetype) shared;

- (void) saveChangesForDevice: (NestDevice*) device;

// Override to use subscrption
- (NSString*) devicePath;

// Override to create appropriate objects
- (Class) deviceType;

- (void) subscribe;

- (NSArray*) deviceList;


@end
