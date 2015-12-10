//
//  ThermostatsTableViewController.m
//  NestTest
//
//  Created by HereTrix on 12/1/15.
//  Copyright © 2015 HereTrix. All rights reserved.
//

#import "ThermostatsTableViewController.h"

#import "ThermostatManager.h"


@interface ThermostatsTableViewController ()

@end


@implementation ThermostatsTableViewController


- (DeviceDataManager*) dataManagerForController
{
    return [ThermostatManager shared];
}


- (NSString*) tableViewCellIdentifier
{
    return @"ThermostatCell";
}


- (NSString*) deviceDetailSegueName
{
    return @"ThermostatDetail";
}


@end
