//
//  AuthorizationManager.m
//  NestTest
//
//  Created by HereTrix on 11/28/15.
//  Copyright © 2015 HereTrix. All rights reserved.
//

#import "AuthorizationManager.h"

#import "Constants.h"

#import "NSDictionary+URLEncode.h"


static NSString const * kBaseAuthURL = @"api.home.nest.com";
static NSString const * kAccessTokenStorageKey = @"kAccessTokenStorageKey";
static NSString const * kExpirationDateStorageKey = @"kExpirationDateStorageKey";


@interface AuthorizationManager()


@property (strong, nonatomic) NSDate *expirationDate;


@end


@implementation AuthorizationManager


@synthesize accessToken = _accessToken;
@synthesize expirationDate = _expirationDate;


+ (AuthorizationManager*) shared
{
    static dispatch_once_t once;
    static AuthorizationManager *instance;
    
    dispatch_once(&once, ^{
        instance = [[self alloc] init];
    });
    
    return instance;
}


- (void) setAccessToken: (NSString*) accessToken
{
    _accessToken = accessToken;
    [[NSUserDefaults standardUserDefaults] setObject: accessToken
                                              forKey: (NSString*)kAccessTokenStorageKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


- (NSString*) accessToken
{
    if (!_accessToken) {
        _accessToken = [[NSUserDefaults standardUserDefaults] objectForKey: (NSString*)kAccessTokenStorageKey];
    }
    return _accessToken;
}


- (void) setExpirationDate: (NSDate*) expirationDate
{
    _expirationDate = expirationDate;
    [[NSUserDefaults standardUserDefaults] setObject: expirationDate
                                              forKey: (NSString*)kExpirationDateStorageKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


- (NSDate*) expirationDate
{
    if (!_expirationDate)
    {
        _expirationDate = [[NSUserDefaults standardUserDefaults] objectForKey: (NSString*)kExpirationDateStorageKey];
    }
    
    return _expirationDate;
}


- (BOOL) isAccessTokenValid
{
    if (self.expirationDate && [[NSDate date] compare: self.expirationDate] == NSOrderedAscending)
    {
        return YES;
    }
    
    return NO;
}


- (void) authorizeWithCode: (NSString*) code completion: (void(^)(NSError *error))completion
{
    if (!code)
    {
        NSError *error = [NSError errorWithDomain: @"Authorization"
                                             code: 403
                                         userInfo: @{NSLocalizedDescriptionKey : @"Missing authorization code"}];
        completion(error);
        return;
    }
    
    NSString *urlString = [NSString stringWithFormat:@"https://%@/oauth2/access_token", kBaseAuthURL];
    //    ?code=%@&client_id=%@&client_secret=%@&grant_type=authorization_code
    NSDictionary *params = @{@"code"          : code,
                             @"client_secret" : NestClientSecret,
                             @"client_id"     : NestClientID,
                             @"grant_type"    : @"authorization_code"};
    
    NSURL *url = [NSURL URLWithString: urlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL: url];
    NSData *data = [[params urlEncodedString] dataUsingEncoding: NSUTF8StringEncoding];//[NSJSONSerialization dataWithJSONObject:params options:0 error:nil];
    [request setHTTPBody: data];
    [request setHTTPMethod: @"POST"];
    
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest: request
                                                                 completionHandler: ^(NSData *data, NSURLResponse *response, NSError *error) {
                                                                     if (error)
                                                                     {
                                                                         completion(error);
                                                                     }
                                                                     else
                                                                     {
                                                                         NSError *err;
                                                                         NSDictionary *json = [NSJSONSerialization JSONObjectWithData: data options: 0 error: &err];
                                                                         
                                                                         if (err)
                                                                         {
                                                                             completion(err);
                                                                         }
                                                                         else
                                                                         {
                                                                             self.accessToken = json[@"access_token"];
                                                                             
                                                                             NSNumber *expiration = json[@"expires_in"];
                                                                             self.expirationDate  = [NSDate dateWithTimeIntervalSinceNow: expiration.longValue];
                                                                             completion(nil);
                                                                         }
                                                                     }
                                                                 }];
    [task resume];
}


@end
