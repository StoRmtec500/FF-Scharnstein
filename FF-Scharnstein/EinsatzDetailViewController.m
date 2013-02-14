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

@synthesize lblEinsatzNummer, strEinsatzNummer, lblEinsatzSubTyp, strEinsatzSubTyp, lblEinsatzAdresse, strEinsatzAdresse, lblEinsatzAdresse2, strEinsartAdresse2, lblEinsatzEnde, strEinsartEnde, lblEinsatzStartzeit, strEinsatzStartzeit, lblEinsatzStatus, strEinsatzStatus;

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
    
    lblEinsatzNummer.text = strEinsatzNummer;
    lblEinsatzSubTyp.text = strEinsatzSubTyp;
    lblEinsatzAdresse.text = strEinsatzAdresse;
    lblEinsatzAdresse2.text = strEinsartAdresse2;
    NSString *str = strEinsatzStartzeit;
    NSString *newstr = [str substringWithRange:NSMakeRange(5, [str length]-10)];
    lblEinsatzStartzeit.text = newstr;
    NSString *str1 = strEinsartEnde;
    NSString *newstr1 = [str1 substringWithRange:NSMakeRange(5, [str length]-10)];
    lblEinsatzEnde.text = newstr1;
    lblEinsatzStatus.text = strEinsatzStatus;
    
    self.navigationItem.title = lblEinsatzNummer.text;
    //self.tabBarController.selectedIndex = 1;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(print_Message)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewDidUnload {
    [self setLblEinsatzSubTyp:nil];
    [self setLblEinsatzAdresse:nil];
    [self setLblEinsatzAdresse2:nil];
    [self setLblEinsatzStartzeit:nil];
    [self setLblEinsatzEnde:nil];
    [self setLblEinsatzStatus:nil];
    [super viewDidUnload];
}
@end
