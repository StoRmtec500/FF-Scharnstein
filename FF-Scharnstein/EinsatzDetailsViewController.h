//
//  EinsatzDetailsViewController.h
//  FF-Scharnstein
//
//  Created by Martin Kuenz on 13.02.13.
//  Copyright (c) 2013 Martin Kuenz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EinsatzDetailsViewController : UITableViewController
@property (strong, nonatomic) IBOutlet UILabel *lblEinsatzSubTyp;
@property(strong, nonatomic) NSString *strEinsatzSubTyp;

@end
