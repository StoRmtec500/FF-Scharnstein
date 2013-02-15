//
//  InfoViewController.h
//  FF-Scharnstein
//
//  Created by Martin Kuenz on 2/8/13.
//  Copyright (c) 2013 Martin Kuenz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InfoViewController : UIViewController <UIWebViewDelegate>
@property (strong, nonatomic) IBOutlet UIWebView *_viewWeb;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activity;

@end
