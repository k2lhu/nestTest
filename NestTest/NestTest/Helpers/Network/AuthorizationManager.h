//
//  AuthorizationManager.h
//  NestTest
//
//  Created by HereTrix on 11/28/15.
//  Copyright © 2015 HereTrix. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface AuthorizationManager : NSObject


@property (strong, nonatomic) NSString *accessToken;


+ (AuthorizationManager*) shared;

- (BOOL) isAccessTokenValid;

- (void) authorizeWithCode: (NSString*) code completion: (void(^)(NSError *error))completion;


@end
