//
//  EinsatzDetailViewController.m
//  FF-Scharnstein
//
//  Created by Martin Kuenz on 2/6/13.
//  Copyright (c) 2013 Martin Kuenz. All rights reserved.
//

#import "EinsatzDetailViewController.h"

@interface EinsatzDetailViewController ()

@end

@implementation EinsatzDetailViewController

@synthesize einsatzAuswahl;
@synthesize einsatzAuswahlName;

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
	// Do any additional setup after loading the view.
    
    einsatzAuswahl.text = einsatzAuswahlName;
    
    self.navigationItem.title = @"das test";
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end