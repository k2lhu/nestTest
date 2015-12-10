//
//  AuthorizationController.m
//  NestTest
//
//  Created by HereTrix on 11/27/15.
//  Copyright © 2015 HereTrix. All rights reserved.
//

#import "AuthorizationController.h"

#import "Constants.h"
#import "NSDictionary+URLEncode.h"


static NSString const * kAuthorizationURL = @"https://home.nest.com/login/oauth2";


@interface AuthorizationController()<UIWebViewDelegate>


@property (weak, nonatomic) IBOutlet UIWebView *loginView;


@end


@implementation AuthorizationController


- (void) viewDidLoad
{
    [super viewDidLoad];
    
    NSString     *state     = [NSUUID UUID].UUIDString;
    
    NSDictionary *params    = @{@"client_id" : NestClientID, @"state" : state};
    
    NSString     *urlString = [NSString stringWithFormat: @"%@?%@", kAuthorizationURL, [params urlEncodedString]];
    
    NSURL        *url       = [NSURL URLWithString: urlString];
    NSURLRequest *request   = [NSURLRequest requestWithURL: url];
    
    [self.loginView loadRequest:request];
}


- (IBAction) closeAction: (id) sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
