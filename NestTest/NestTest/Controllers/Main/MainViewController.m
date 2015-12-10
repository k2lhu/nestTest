//
//  MainViewController.m
//  NestTest
//
//  Created by HereTrix on 12/4/15.
//  Copyright © 2015 HereTrix. All rights reserved.
//

#import "MainViewController.h"

#import "NetworkManager.h"
#import "DevicesTableViewController.h"


@interface MainViewController ()

@end


@implementation MainViewController


- (void) viewDidLoad
{
    [super viewDidLoad];
    
    [NetworkManager sharedManager];
    
    self.navigationItem.hidesBackButton = YES;
    [[NSNotificationCenter defaultCenter] addObserver: self
                                             selector: @selector(authorzied)
                                                 name: (NSString *)kAuthSuccess
                                               object: nil];
}


- (void)authorzied
{
    for (DevicesTableViewController *vc in self.viewControllers)
    {
        [vc.dataManagerForController subscribe];
    }
}


@end
