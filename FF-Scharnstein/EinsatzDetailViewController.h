//
//  EinsatzDetailViewController.h
//  FF-Scharnstein
//
//  Created by Martin Kuenz on 2/6/13.
//  Copyright (c) 2013 Martin Kuenz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EinsatzDetailViewController : UIViewController 

@property (strong, nonatomic) IBOutlet UIView *EinsatzDetailsView;
@property (strong, nonatomic) IBOutlet UINavigationItem *navItemEinsatzDetails;

@property (strong, nonatomic) IBOutlet UILabel *lblEinsatzNummer;
@property (nonatomic, strong) NSString *strEinsatzNummer;
@end
