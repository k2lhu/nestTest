//
//  NestDevice.h
//  NestTest
//
//  Created by HereTrix on 12/3/15.
//  Copyright © 2015 HereTrix. All rights reserved.
//

#import <Foundation/Foundation.h>


extern NSString * const kDeviceID;
extern NSString * const kNameLong;


@interface NestDevice : NSObject


@property (nonatomic, strong) NSString *deviceId;
@property (nonatomic, strong) NSString *nameLong;


+ (instancetype) createWithID: (NSString *)deviceID;

- (void) updateWithStructure: (NSDictionary *)structure;
- (NSDictionary*) valuesToSave;


@end


