//
//  InfoViewController.h
//  FF-Scharnstein
//
//  Created by Martin Kuenz on 2/8/13.
//  Copyright (c) 2013 Martin Kuenz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PayPal.h"

@interface InfoViewController : UIViewController <UIWebViewDelegate, PayPalPaymentDelegate>
//@property (strong, nonatomic) IBOutlet UIWebView *_viewWeb;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activity;
@property (strong, nonatomic) IBOutlet UIStepper *ourStepper;
@property (strong, nonatomic) IBOutlet UITextField *lblPayPalSpenden;
@property (strong, nonatomic) IBOutlet UILabel *stepperWert;
- (IBAction)stepperValueChanged:(UIStepper *)sender;

@end
