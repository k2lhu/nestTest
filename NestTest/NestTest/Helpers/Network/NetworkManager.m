//
//  NetworkManager.m
//  NestTest
//
//  Created by HereTrix on 11/27/15.
//  Copyright © 2015 HereTrix. All rights reserved.
//

#import "NetworkManager.h"

#import <Firebase/Firebase.h>
#import "AuthorizationManager.h"


NSString const * kAuthSuccess = @"kAuthSuccess";
static NSString const * kMetadataURL = @"metadata";


@interface NetworkManager()


@property (strong, nonatomic) Firebase *rootFirebase;
@property (strong, nonatomic) NSMutableDictionary *subscribedURLs;
@property (strong, nonatomic) NSMutableDictionary *childs;


@end


@implementation NetworkManager


+ (NetworkManager*) sharedManager
{
    static dispatch_once_t once;
    static NetworkManager *instance;
    
    dispatch_once(&once, ^{
        instance = [[self alloc] init];
    });
    
    return instance;
}


- (id) init
{
    if (self = [super init])
    {
        [Firebase setLoggingEnabled: YES];
        [Firebase defaultConfig].persistenceEnabled = YES;
        self.rootFirebase = [[Firebase alloc] initWithUrl: @"https://developer-api.nest.com/"];
        [self.rootFirebase authWithCustomToken: [[AuthorizationManager shared] accessToken]
                           withCompletionBlock: ^(NSError *error, FAuthData *authData) {
                               NSLog(@"Connected to server %@ ", error);
                           }];
        
        [self.rootFirebase observeAuthEventWithBlock: ^(FAuthData *authData) {
            if (authData)
            {
                // user authenticated
                NSLog(@"%@", authData);
                [[NSNotificationCenter defaultCenter] postNotificationName: (NSString *)kAuthSuccess
                                                                    object: nil];
            }
            else
            {
                // No user is signed in
            }
        }];
        
        // This is not good but it should solve aut issue
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self addSubscriptionToURL:(NSString *)kMetadataURL withBlock:^(FDataSnapshot *snapshot) {
                
            }];
        });
        
        self.subscribedURLs = [NSMutableDictionary new];
        self.childs = [NSMutableDictionary new];
    }
    
    return self;
}


- (void) addSubscriptionToURL: (NSString*) URL withBlock: (SubscriptionBlock) block
{
    if ([self.subscribedURLs objectForKey:URL])
    {
        // Don't add another subscription
        block([self.subscribedURLs objectForKey:URL]);
        
    }
    else
    {
        Firebase *newFirebase = [self.rootFirebase childByAppendingPath: URL];
        
        [newFirebase observeEventType: FEventTypeValue withBlock: ^(FDataSnapshot *snapshot) {
            [self.subscribedURLs setObject: snapshot forKey: URL];
            block(snapshot);
        }];
        
        [self.childs setObject: newFirebase forKey: URL];
    }
}


- (void) setValues: (NSDictionary*) values forURL: (NSString*) URL
{
    if ([self.subscribedURLs objectForKey:URL])
    {
        [[self.childs objectForKey: URL]  runTransactionBlock: ^FTransactionResult *(FMutableData *currentData) {
            [currentData setValue: values];
            return [FTransactionResult successWithValue: currentData];
        } andCompletionBlock:^(NSError *error, BOOL committed, FDataSnapshot *snapshot) {
            if (error)
            {
                NSLog(@"Error: %@", error);
            }
        } withLocalEvents: NO];
    }
}


@end
