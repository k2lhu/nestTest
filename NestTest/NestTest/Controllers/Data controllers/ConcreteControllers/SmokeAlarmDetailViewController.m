//
//  SmokeAlarmDetailViewController.m
//  NestTest
//
//  Created by HereTrix on 12/3/15.
//  Copyright © 2015 HereTrix. All rights reserved.
//

#import "SmokeAlarmDetailViewController.h"
#import "SmokeAlarm.h"


@interface SmokeAlarmDetailViewController ()


@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *stateLabel;
@property (strong, nonatomic) IBOutlet UILabel *colorLabel;


@end


@implementation SmokeAlarmDetailViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setDeviceInfo];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) setDeviceInfo
{
    SmokeAlarm *smokeAlarm = (SmokeAlarm*)self.device;
    
    self.nameLabel.text = smokeAlarm.nameLong;
    self.stateLabel.text = smokeAlarm.smokeAlarmState;
    self.colorLabel.text = smokeAlarm.uiColorState;

    self.title = smokeAlarm.nameLong;
}


@end
