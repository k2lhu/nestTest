//
//  PINViewController.m
//  NestTest
//
//  Created by HereTrix on 11/28/15.
//  Copyright © 2015 HereTrix. All rights reserved.
//

#import "PINViewController.h"

#import "AuthorizationManager.h"


@interface PINViewController ()


@property (weak, nonatomic) IBOutlet UITextField *pinField;


@end


@implementation PINViewController


- (void) viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction) authorizeAction: (id) sender
{
    if (self.pinField.text.length == 0)
    {
        [self showErrorMessage:@"Please enter PIN code"];
        return;
    }
    
    [[AuthorizationManager shared] authorizeWithCode: self.pinField.text completion: ^(NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (error)
            {
                [self showErrorMessage: error.localizedDescription];
            }
            else
            {
                [self performSegueWithIdentifier: @"DeviceTypes" sender: self];
            }
        });
    }];
}


- (void) showErrorMessage: (NSString *)message
{
    UIAlertController *ac = [UIAlertController alertControllerWithTitle: @""
                                                                message: message
                                                         preferredStyle: UIAlertControllerStyleAlert];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle: @"OK"
                                                     style: UIAlertActionStyleDefault
                                                   handler: nil];
    
    [ac addAction: cancel];
    
    [self presentViewController: ac animated: YES completion: nil];
}


@end
