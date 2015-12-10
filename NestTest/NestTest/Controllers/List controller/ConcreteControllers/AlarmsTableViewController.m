//
//  AlarmsTableViewController.m
//  NestTest
//
//  Created by HereTrix on 12/1/15.
//  Copyright © 2015 HereTrix. All rights reserved.
//

#import "AlarmsTableViewController.h"

#import "AlarmManager.h"


@interface AlarmsTableViewController ()

@end


@implementation AlarmsTableViewController


- (DeviceDataManager*) dataManagerForController
{
    return [AlarmManager shared];
}


- (NSString*) tableViewCellIdentifier
{
    return @"AlarmCell";
}


- (NSString*) deviceDetailSegueName
{
    return @"AlarmDetail";
}


@end
