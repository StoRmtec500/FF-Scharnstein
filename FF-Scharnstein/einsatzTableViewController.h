//
//  EinsatzTableViewController.h
//  FF-Scharnstein
//
//  Created by Martin Kuenz on 06.02.13.
//  Copyright (c) 2013 Martin Kuenz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XMLStringFile.h"

@interface EinsatzTableViewController : UITableViewController <NSXMLParserDelegate>
{
    NSMutableArray *rssOutputData;
    NSMutableString * nodeContent;
    NSXMLParser *xmlParserObject;
    
    XMLStringFile *xmlStringFileObject;
}

@property (retain, nonatomic) IBOutlet UILabel *einsatzSubTyp;
@property(strong, nonatomic) NSString *einsatzurl;
@property (nonatomic, strong) IBOutlet UITableView *tableView2;
@property (strong, nonatomic) IBOutlet UILabel *lblaktuellerEinsatz;
@property (nonatomic) BOOL isAscending;

@property (nonatomic,strong) XMLStringFile *einsatz;

-(void) XMLURL;
@end
