//
//  CamerasDetailViewController.m
//  NestTest
//
//  Created by HereTrix on 12/3/15.
//  Copyright © 2015 HereTrix. All rights reserved.
//

#import "CamerasDetailViewController.h"
#import "Camera.h"
#import "LastEventDetailViewController.h"


@interface CamerasDetailViewController ()


@property (strong, nonatomic) IBOutlet UILabel *isOnlineLabel;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *isStreamingLabel;

@property (strong, nonatomic) IBOutlet UITextView *webLinkTextView;
@property (strong, nonatomic) IBOutlet UITextView *appLinkTextView;

@property (strong, nonatomic) IBOutlet UIButton *showLastEventButton;


@end


@implementation CamerasDetailViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setDeviceInfo];
}


- (void) setDeviceInfo
{
    Camera *camera = (Camera*)self.device;
    
    self.nameLabel.text     = camera.nameLong;
    self.isOnlineLabel.text = camera.isOnline ? @"YES" : @"NO";
    self.isStreamingLabel.text = camera.isStreaming ? @"YES" : @"NO";
    self.webLinkTextView.text  = camera.webURL ? camera.webURL : @"not available";
    self.appLinkTextView.text  = camera.appURL ? camera.appURL : @"not available";
    
    if (!camera.lastEvent)
    {
        self.showLastEventButton.hidden = YES;
    }
    
    self.title = camera.nameLong;
}


- (IBAction) appLinkTapAction: (id) sender
{
    if (self.appLinkTextView.text.length)
    {
        if ([[UIApplication sharedApplication]
             canOpenURL:[NSURL URLWithString:self.appLinkTextView.text]])
        {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:self.appLinkTextView.text]];
        }
    }
}


- (void) prepareForSegue: (UIStoryboardSegue*) segue sender: (id) sender
{
    if ([segue.identifier isEqualToString: @"lastEventSegue"])
    {
        LastEventDetailViewController *destination = segue.destinationViewController;
        Camera *camera = (Camera*)self.device;
        destination.lastEvent = camera.lastEvent;
    }
}


@end
