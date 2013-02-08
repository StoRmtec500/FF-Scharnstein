//
//  EinsatzTableCell.m
//  FF-Scharnstein
//
//  Created by Martin Kuenz on 2/7/13.
//  Copyright (c) 2013 Martin Kuenz. All rights reserved.
//

#import "EinsatzTableCell.h"

@implementation EinsatzTableCell

@synthesize einsatzSubTyp, einsatzAlarmstufe, einsatzAdresse, einsatzAdresse2, einsatzBezirk;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
