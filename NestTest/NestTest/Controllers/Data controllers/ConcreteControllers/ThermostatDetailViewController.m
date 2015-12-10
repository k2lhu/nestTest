//
//  ThermostatViewController.m
//  NestTest
//
//  Created by HereTrix on 11/29/15.
//  Copyright © 2015 HereTrix. All rights reserved.
//

#import "ThermostatDetailViewController.h"
#import "Thermostat.h"
#import "ThermostatManager.h"


@interface ThermostatDetailViewController ()


@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *ambientTemperatureFLabel;
@property (strong, nonatomic) IBOutlet UILabel *targerTemperatureFLabel;
@property (strong, nonatomic) IBOutlet UILabel *hasFanLabel;
@property (strong, nonatomic) IBOutlet UILabel *fanTimerActiveLabel;
@property (strong, nonatomic) IBOutlet UISlider *targetTemperatureFSlider;


@end


@implementation ThermostatDetailViewController


- (void) viewDidLoad
{
    [super viewDidLoad];
    
    [self setDeviceInfo];
}


- (void) didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) setDeviceInfo
{
    Thermostat *thermostat = (Thermostat*)self.device;
    
    self.nameLabel.text                = thermostat.nameLong;
    self.ambientTemperatureFLabel.text = [thermostat.ambientTemperatureF stringValue];
    
    self.hasFanLabel.text              = thermostat.hasFan         ? @"YES" : @"NO";
    self.fanTimerActiveLabel.text      = thermostat.fanTimerActive ? @"YES" : @"NO";
    
    self.targerTemperatureFLabel.text  = [thermostat.targetTemperatureF stringValue];
    
    // setup target slider
    self.targetTemperatureFSlider.minimumValue = [thermostat.targetTemperatureLowF  floatValue];
    self.targetTemperatureFSlider.maximumValue = [thermostat.targetTemperatureHighF floatValue];
    self.targetTemperatureFSlider.value        = [thermostat.targetTemperatureF     floatValue];
    
    
    self.title = thermostat.nameLong;
}


- (IBAction) targetSliderValueChanged: (id) sender
{
    [self addDoneButton];
    
    self.targerTemperatureFLabel.text = [NSString stringWithFormat: @"%d", (int)self.targetTemperatureFSlider.value];
}


- (void) addDoneButton
{
    if (!self.navigationItem.rightBarButtonItem)
    {
        UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemDone
                                                                                    target: self
                                                                                    action: @selector(saveButtonAction)];
        
        self.navigationItem.rightBarButtonItem = saveButton;
    }
}


- (void) saveButtonAction
{
    Thermostat *thermostat = (Thermostat*)self.device;
    thermostat.targetTemperatureF  = [NSNumber numberWithInt: (int)self.targetTemperatureFSlider.value];
    
    [[ThermostatManager shared] saveChangesForDevice: self.device];
    
    self.navigationItem.rightBarButtonItem = nil;
}


@end
