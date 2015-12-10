//
//  Camera.m
//  NestTest
//
//  Created by HereTrix on 12/1/15.
//  Copyright © 2015 HereTrix. All rights reserved.
//

#import "Camera.h"


static NSString * const kIsOnline = @"is_online";
static NSString * const kIsStreaming = @"is_streaming";
static NSString * const kWebURL = @"web_url";
static NSString * const kAppURL = @"app_url";
static NSString * const kLastEvent = @"last_event";


@implementation Camera


- (void) updateWithStructure: (NSDictionary*) structure
{
    self.isOnline    = [structure[kIsOnline] boolValue];
    self.isStreaming = [structure[kIsStreaming] boolValue];
    self.webURL = structure[kWebURL];
    self.appURL = structure[kAppURL];
    
    if (structure[kLastEvent])
    {
        self.lastEvent = [[CameraEvent alloc] initWithStructute:structure[kLastEvent]];
    }
}

- (NSDictionary *)valuesToSave
{
    NSMutableDictionary *values = [NSMutableDictionary new];
    
    return values;
}
@end