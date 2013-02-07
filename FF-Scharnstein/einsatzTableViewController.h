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

@end
