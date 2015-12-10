//
//  CamerasTableViewController.m
//  NestTest
//
//  Created by HereTrix on 12/1/15.
//  Copyright © 2015 HereTrix. All rights reserved.
//

#import "CamerasTableViewController.h"

#import "CameraManager.h"


@interface CamerasTableViewController ()

@end


@implementation CamerasTableViewController


- (DeviceDataManager*) dataManagerForController
{
    return [CameraManager shared];
}

- (NSString*) tableViewCellIdentifier
{
    return @"CameraCell";
}

- (NSString*) deviceDetailSegueName
{
    return @"CameraDetail";
}


@end
