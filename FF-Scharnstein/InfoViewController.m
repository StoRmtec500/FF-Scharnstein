//
//  InfoViewController.m
//  FF-Scharnstein
//
//  Created by Martin Kuenz on 2/8/13.
//  Copyright (c) 2013 Martin Kuenz. All rights reserved.
//

#import "InfoViewController.h"
#import "PayPalAdvancedPayment.h"
#import "PayPalAmounts.h"
#import "PayPalPayment.h"
#import "PayPalReceiverPaymentDetails.h"
#import "PayPalReceiverAmounts.h"
#import "PayPalInvoiceData.h"
#import "PayPalInvoiceItem.h"
#import "PayPalAddress.h"

#define sub = 10;

@interface InfoViewController ()

@end

@implementation InfoViewController
@synthesize lblPayPalSpenden, ourStepper, stepperWert;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [PayPal initializeWithAppID:@"APP-80W284485P519543T"
                 forEnvironment:ENV_SANDBOX];
    
    self.stepperWert.text = [NSString stringWithFormat:@"%.f", ourStepper.value];
    
	// Do any additional setup after loading the view.
 //   NSString *fullURL = @"http://www.kuenz.co.at/feuerwehrapp/";
 //   NSURL *url = [NSURL URLWithString:fullURL];
 //   NSURLRequest *request = [NSURLRequest requestWithURL:url];
 //   [_viewWeb loadRequest:request];

    self.navigationItem.title = @"Info";

    
    PayPal *p = [PayPal getPayPalInst];
    p.lang = @"de_DE";
    
    UIButton *paypal = [[PayPal getPayPalInst]getPayButtonWithTarget:self andAction:@selector(payWithPayPal) andButtonType:BUTTON_194x37 andButtonText:BUTTON_TEXT_DONATE];
    paypal.frame = CGRectMake(63,200, 194, 37);
    [self.view addSubview:paypal];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)payWithPayPal
{
 PayPal *ppMEP = [PayPal getPayPalInst];
 ppMEP.lang = @"de_DE";
 
 PayPalPayment *payment = [[PayPalPayment alloc]init];
 payment.paymentCurrency = @"EUR";
 payment.paymentType = TYPE_PERSONAL;
 payment.paymentSubType = SUBTYPE_DONATIONS;
 payment.subTotal = [NSDecimalNumber decimalNumberWithString:@"1.00"];
 payment.recipient =@"seller_1360925097_biz@kuenz.co.at";
 payment.merchantName =@"Feuerwehr APP";
 
 //  payment.receiverPaymentDetails = [NSMutableArray array];
 //  NSArray *emails = [NSArray arrayWithObject:@"martin@kuenz.co.at"];
 //  for (int i = 0; i < emails.count; i++) {
 //      PayPalReceiverPaymentDetails *details = [[PayPalReceiverPaymentDetails alloc]init];
 //      details.recipient = [emails objectAtIndex:i];
 //      [payment.receiverPaymentDetails addObject:details];
 //  }
 
 [ppMEP checkoutWithPayment:payment];
}

-(void)paymentCanceled
{
    
}

-(void)paymentSuccessWithKey:(NSString *)payKey andStatus:(PayPalPaymentStatus)paymentStatus
{
    
}

-(void)paymentLibraryExit
{
    
}

-(void)paymentFailedWithCorrelationID:(NSString *)correlationID
{
    
}

- (void)viewDidUnload {
    [self setActivity:nil];
    [super viewDidUnload];
}
- (IBAction)stepperValueChanged:(id)sender
{
    self.stepperWert.text = [NSString stringWithFormat:@"%ld", (long)ourStepper];
}
@end
