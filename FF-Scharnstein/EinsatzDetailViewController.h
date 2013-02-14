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

@property (strong, nonatomic) IBOutlet UILabel *lblEinsatzNummer;
@property (strong, nonatomic) IBOutlet UILabel *lblEinsatzSubTyp;
@property (strong, nonatomic) IBOutlet UILabel *lblEinsatzAdresse;
@property (strong, nonatomic) IBOutlet UILabel *lblEinsatzAdresse2;
@property (strong, nonatomic) IBOutlet UILabel *lblEinsatzStartzeit;
@property (strong, nonatomic) IBOutlet UILabel *lblEinsatzEnde;
@property (strong, nonatomic) IBOutlet UILabel *lblEinsatzStatus;
@property (nonatomic, strong) NSString *strEinsatzNummer;
@property (nonatomic, strong) NSString *strEinsatzSubTyp;
@property (nonatomic, strong) NSString *strEinsatzAdresse;
@property (nonatomic, strong) NSString *strEinsartAdresse2;
@property (nonatomic, strong) NSString *strEinsatzStartzeit;
@property (nonatomic, strong) NSString *strEinsartEnde;
@property (nonatomic, strong) NSString *strEinsatzStatus;
@end
