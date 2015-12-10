//
//  LastEventDetailViewController.m
//  NestTest
//
//  Created by HereTrix on 12/3/15.
//  Copyright © 2015 HereTrix. All rights reserved.
//

#import "LastEventDetailViewController.h"


@interface LastEventDetailViewController ()


@property (strong, nonatomic) IBOutlet UILabel *hasSoundLabel;
@property (strong, nonatomic) IBOutlet UILabel *hasMotionLabel;
@property (strong, nonatomic) IBOutlet UILabel *startTimeLabel;
@property (strong, nonatomic) IBOutlet UILabel *endTimeLabel;


@end


@implementation LastEventDetailViewController


- (void) viewDidLoad
{
    [super viewDidLoad];
    
    [self setupEventInfo];
}


- (void) setupEventInfo
{
    self.hasSoundLabel.text  = self.lastEvent.hasSound  ? @"YES" : @"NO";
    self.hasMotionLabel.text = self.lastEvent.hasMotion ? @"YES" : @"NO";
    self.startTimeLabel.text = [self dateToSpecificFormat: self.lastEvent.startTime];
    self.endTimeLabel.text   = [self dateToSpecificFormat: self.lastEvent.endTime];
}


- (NSString*) dateToSpecificFormat: (NSDate*) date
{
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat: @"HH:mm:ss dd.MM.yyyy"];
    
    return [dateFormat stringFromDate: date];
}


@end
