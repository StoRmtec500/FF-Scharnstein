//
//  XMLStringFile.h
//  FF-Scharnstein
//
//  Created by Martin Kuenz on 2/7/13.
//  Copyright (c) 2013 Martin Kuenz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XMLStringFile : NSObject

{
    NSString *xmlEinsatzNummer, *xmlEinsatzTyp, *xmlEinsatzAlarmstufe;
}

@property(nonatomic, retain)NSString *xmlEinsatzNummer,*xmlEinsatzTyp,*xmlEinsatzAlarmstufe;

@end
