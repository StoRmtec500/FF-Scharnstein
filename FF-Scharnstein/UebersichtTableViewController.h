//
//  UebersichtTableViewController.h
//  FF-Scharnstein
//
//  Created by Martin Kuenz on 2/6/13.
//  Copyright (c) 2013 Martin Kuenz. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UebersichtTableViewController : UITableViewController
{
    NSString *einsatzurl1;
}

- (IBAction)InfoView:(id)sender;

@property (nonatomic, copy) NSString *einsatzurl1;


@end
