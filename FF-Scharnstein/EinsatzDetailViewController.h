//
//  EinsatzDetailViewController.h
//  FF-Scharnstein
//
//  Created by Martin Kuenz on 2/6/13.
//  Copyright (c) 2013 Martin Kuenz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EinsatzDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *einsatzAuswahl;
@property (nonatomic, strong) NSString *einsatzAuswahlName;
@end
