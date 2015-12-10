//
//  DevicesTableViewController.m
//  NestTest
//
//  Created by HereTrix on 12/3/15.
//  Copyright © 2015 HereTrix. All rights reserved.
//

#import "DevicesTableViewController.h"

#import "DeviceTableViewCell.h"
#import "DeviceDetailViewController.h"


@interface DevicesTableViewController ()


@property (strong, nonatomic) NSArray *devices;


@end


@implementation DevicesTableViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver: self
                                             selector: @selector(updateData)
                                                 name: kDeviceManagerUpdatedNotification
                                               object: [self dataManagerForController]];
}


- (void) viewWillAppear: (BOOL) animated
{
    [super viewWillAppear:animated];
    
    [self updateData];
}


- (void) dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver: self];
}


#pragma mark - Public


- (DeviceDataManager*) dataManagerForController
{
    [NSException raise: NSInternalInconsistencyException
                format: @"You must override %@ in a subclass", NSStringFromSelector(_cmd)];
    return [DeviceDataManager shared];
}


- (NSString*) tableViewCellIdentifier
{
    return nil;
}


- (NSString*) deviceDetailSegueName
{
    return nil;
}


#pragma mark - Private


- (void) updateData
{
    self.devices = [[self dataManagerForController] deviceList];
    
    [self.tableView reloadData];
}


#pragma mark - Table view data source


- (NSInteger) numberOfSectionsInTableView: (UITableView*) tableView
{
    return 1;
}


- (NSInteger) tableView: (UITableView*) tableView
  numberOfRowsInSection: (NSInteger)    section
{
    return [self.devices count];
}


- (UITableViewCell*) tableView: (UITableView*) tableView
         cellForRowAtIndexPath: (NSIndexPath*) indexPath
{
    DeviceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: [self tableViewCellIdentifier]
                                                                forIndexPath: indexPath];
    
    NestDevice *device = self.devices[indexPath.row];
    
    if (device.nameLong != nil)
    {
        cell.textLabel.text = device.nameLong;
    }
    else
    {
        cell.textLabel.text = device.deviceId;
    }
    
    cell.device = device;
    
    return cell;
}


- (void) prepareForSegue: (UIStoryboardSegue*) segue sender: (id) sender
{
    if ([segue.identifier isEqualToString: [self deviceDetailSegueName]])
    {
        DeviceTableViewCell *cell = sender;
        
        DeviceDetailViewController *destination = segue.destinationViewController;
        destination.device = cell.device;
    }
}


@end
