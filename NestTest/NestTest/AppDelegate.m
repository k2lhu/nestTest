//
//  AppDelegate.m
//  NestTest
//
//  Created by HereTrix on 11/26/15.
//  Copyright © 2015 HereTrix. All rights reserved.
//

#import "AppDelegate.h"

#import "AuthorizationManager.h"

#import "NetworkManager.h"


@interface AppDelegate ()

@end


@implementation AppDelegate


- (BOOL) application: (UIApplication*) application didFinishLaunchingWithOptions: (NSDictionary*) launchOptions
{
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame: [UIScreen mainScreen].bounds];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName: @"Main" bundle: nil];
    UIViewController *root   = nil;
    
    if ([[AuthorizationManager shared] isAccessTokenValid])
    {
        UIViewController *main = [storyboard instantiateViewControllerWithIdentifier: @"MainController"];
        root = [[UINavigationController alloc] initWithRootViewController: main];
    }
    else
    {
        root = [storyboard instantiateViewControllerWithIdentifier: @"LoginController"];
    }
    
    self.window.rootViewController = root;
    [self.window makeKeyAndVisible];
    
    return YES;
}


@end
