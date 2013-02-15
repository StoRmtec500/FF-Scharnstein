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
@property (strong, nonatomic) IBOutlet UIWebView *_viewWeb;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activity;
- (IBAction)payPay:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *payPal;
@property (strong, nonatomic) IBOutlet UITextField *lblPayPalSpenden;
@end
