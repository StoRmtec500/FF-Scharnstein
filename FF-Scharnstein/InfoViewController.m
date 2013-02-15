//
//  InfoViewController.m
//  FF-Scharnstein
//
//  Created by Martin Kuenz on 2/8/13.
//  Copyright (c) 2013 Martin Kuenz. All rights reserved.
//

#import "InfoViewController.h"

@interface InfoViewController ()

@end

@implementation InfoViewController
@synthesize _viewWeb;

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
    NSString *fullURL = @"http://feuerwehr-app.kuenz.co.at";
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_viewWeb loadRequest:request];

    self.navigationItem.title = @"Infos zur APP";
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

-(void)webViewDidStartLoad:(UIWebView *)webView
{
    [_activity startAnimating];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [_activity stopAnimating];
    _activity.hidden = YES;
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setActivity:nil];
    [super viewDidUnload];
}
@end
