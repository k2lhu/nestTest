//
//  CameraEvent.m
//  NestTest
//
//  Created by HereTrix on 11/28/15.
//  Copyright © 2015 HereTrix. All rights reserved.
//

#import "CameraEvent.h"


static NSString * const kHasSound  = @"has_sound";
static NSString * const kHasMotion = @"has_motion";
static NSString * const kStartTime = @"start_time";
static NSString * const kEndTime   = @"end_time";


@implementation CameraEvent


- (instancetype) initWithStructute: (NSDictionary*) structure
{
    self = [super init];
    
    if (self)
    {
        self.hasSound  = [structure[kHasSound]  boolValue];
        self.hasMotion = [structure[kHasMotion] boolValue];
        self.startTime = [self convertDate: structure[kStartTime]];
        self.endTime   = [self convertDate: structure[kEndTime]];
    }
    
    return self;
}


- (NSDate*) convertDate: (NSString*) dateString
{
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat: @"yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"];
    
    return [dateFormat dateFromString: dateString];
}


@end
