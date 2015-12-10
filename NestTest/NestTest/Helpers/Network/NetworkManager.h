//
//  NetworkManager.h
//  NestTest
//
//  Created by HereTrix on 11/27/15.
//  Copyright © 2015 HereTrix. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <Firebase/Firebase.h>


extern NSString const * kAuthSuccess;

typedef void (^ SubscriptionBlock)(FDataSnapshot *snapshot);


@interface NetworkManager : NSObject


+ (NetworkManager*) sharedManager;

- (void) addSubscriptionToURL: (NSString*) URL withBlock: (SubscriptionBlock)block;
- (void) setValues: (NSDictionary*) values forURL: (NSString*) URL;


@end
