//
//  EinsatzTableCell.h
//  FF-Scharnstein
//
//  Created by Martin Kuenz on 2/7/13.
//  Copyright (c) 2013 Martin Kuenz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EinsatzTableCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *einsatzSubTyp;
@property (strong, nonatomic) IBOutlet UILabel *einsatzAlarmstufe;
@property (strong, nonatomic) IBOutlet UILabel *einsatzAdresse;
@property (strong, nonatomic) IBOutlet UILabel *einsatzAdresse2;
@property (strong, nonatomic) IBOutlet UILabel *einsatzBezirk;
@end
