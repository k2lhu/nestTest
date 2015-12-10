//
//  DevicesTableViewController.h
//  NestTest
//
//  Created by HereTrix on 12/3/15.
//  Copyright © 2015 HereTrix. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DeviceDataManager.h"


@interface DevicesTableViewController : UITableViewController


// Abstract methods
- (DeviceDataManager *)dataManagerForController;
- (NSString *)tableViewCellIdentifier;
- (NSString *)deviceDetailSegueName;


@end
