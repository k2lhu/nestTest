//
//  CameraEvent.h
//  NestTest
//
//  Created by HereTrix on 11/28/15.
//  Copyright © 2015 HereTrix. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CameraEvent : NSObject


@property (assign, nonatomic) BOOL hasSound;
@property (assign, nonatomic) BOOL hasMotion;
@property (strong, nonatomic) NSDate *startTime;
@property (strong, nonatomic) NSDate *endTime;


- (instancetype) initWithStructute: (NSDictionary*) structure;


@end
