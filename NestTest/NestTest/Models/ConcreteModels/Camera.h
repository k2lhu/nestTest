//
//  Camera.h
//  NestTest
//
//  Created by HereTrix on 12/1/15.
//  Copyright © 2015 HereTrix. All rights reserved.
//

#import "NestDevice.h"
#import "CameraEvent.h"


@interface Camera : NestDevice


@property (nonatomic) BOOL isOnline;
@property (nonatomic) BOOL isStreaming;
@property (strong, nonatomic) NSString *webURL;
@property (strong, nonatomic) NSString *appURL;
@property (strong, nonatomic) CameraEvent *lastEvent;


@end
