//
//  DeviceDataManager.m
//  NestTest
//
//  Created by HereTrix on 12/3/15.
//  Copyright © 2015 HereTrix. All rights reserved.
//

#import "DeviceDataManager.h"

#import "NetworkManager.h"


NSString * const kDeviceChangedNotification        = @"kDeviceChangedNotification";
NSString * const kDeviceManagerUpdatedNotification = @"kDeviceManagerUpdatedNotification";
NSString * const kDeviceKey = @"kNestDeviceKey";


@interface DeviceDataManager()


@property (strong, nonatomic) NSMutableDictionary *devices;


@end


@implementation DeviceDataManager


+ (instancetype) shared
{
    [NSException raise: NSInternalInconsistencyException
                format: @"You must override %@ in a subclass", NSStringFromSelector(_cmd)];
    return nil;
}


- (instancetype) init
{
    self = [super init];
    
    if (self)
    {
        self.devices = [NSMutableDictionary new];
    }
    
    return self;
}


- (void) subscribe
{
    [[NetworkManager sharedManager] addSubscriptionToURL: [self devicePath] withBlock: ^(FDataSnapshot *snapshot) {
        
        NSLog(@"Data loaded for %@", NSStringFromClass([self class]));
        
        for (FDataSnapshot *child in snapshot.children)
        {
            NSDictionary *childData = child.value;
            NSString *deviceID = childData[kDeviceID];
            NestDevice *device = self.devices[deviceID];
            
            if (!device)
            {
                id deviceType = [self deviceType];
                device = [deviceType createWithID:deviceID];
                device.deviceId = deviceID;
                self.devices[deviceID] = device;
                
                [[NetworkManager sharedManager] addSubscriptionToURL: [NSString stringWithFormat: @"%@/%@", [self devicePath], device.deviceId] withBlock: ^(FDataSnapshot *snapshot) {
                    
                }];
            }
            
            [device updateWithStructure:childData];
            [[NSNotificationCenter defaultCenter] postNotificationName: kDeviceChangedNotification
                                                                object: self
                                                              userInfo: @{kDeviceKey : device}];
        }
        
        [[NSNotificationCenter defaultCenter] postNotificationName: kDeviceManagerUpdatedNotification
                                                            object: self];
    }];
}


- (NSString*) devicePath
{
    [NSException raise: NSInternalInconsistencyException
                format: @"You must override %@ in a subclass", NSStringFromSelector(_cmd)];
    return nil;
}


- (Class) deviceType
{
    [NSException raise: NSInternalInconsistencyException
                format: @"You must override %@ in a subclass", NSStringFromSelector(_cmd)];
    return nil;
}


- (NSDictionary*) valuesToSave
{
    [NSException raise: NSInternalInconsistencyException
                format: @"You must override %@ in a subclass", NSStringFromSelector(_cmd)];
    return nil;
}


- (void) saveChangesForDevice: (NestDevice*) device
{
    [[NetworkManager sharedManager] setValues: [device valuesToSave]
                                       forURL: [NSString stringWithFormat:@"%@/%@", [self devicePath], device.deviceId]];
}


- (NSArray*) deviceList
{
    return [self.devices allValues];
}


@end
