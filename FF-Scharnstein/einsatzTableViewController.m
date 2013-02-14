//
//  EinsatzTableViewController.m
//  FF-Scharnstein
//
//  Created by Martin Kuenz on 06.02.13.
//  Copyright (c) 2013 Martin Kuenz. All rights reserved.
//

#import "EinsatzTableViewController.h"
#import "XMLStringFile.h"
#import "EinsatzTableCell.h"
#import "EinsatzDetailViewController.h"

@interface EinsatzTableViewController ()

@end

@implementation EinsatzTableViewController

@synthesize lblaktuellerEinsatz, einsatzurl2;


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    rssOutputData = [[NSMutableArray alloc]init];
       
#pragma mark - Refresh für die Tabelle
    //****** Refresh eingebaut bei den Einsätzen *****//
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc]init];
    refreshControl.tintColor = [UIColor redColor];
    [refreshControl addTarget:self action:@selector(refresh:) forControlEvents:UIControlEventValueChanged];
    [self setRefreshControl:refreshControl];
    
    [self XMLURL];
}


#pragma mark NSXMLParser delegate

//below delegate method is sent by a parser object to provide its delegate when it encounters a start tag

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict
{
	//if element name is equat to item then only i am assingning memory to the NSObject class
    
	if([elementName isEqualToString:@"einsatz"]){
		xmlStringFileObject =[[XMLStringFile alloc]init];
        lblaktuellerEinsatz.hidden = YES;
	}else if ([elementName isEqualToString:@"einsaetze"])
    {
        lblaktuellerEinsatz.hidden = NO;
	}
	
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
	//whatever data i am getting from node i am appending it to the nodecontent variable
	[nodeContent appendString:[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]];
    //NSLog(@"node content = %@",nodeContent);
}

//bellow delegate method specify when it encounter end tag of specific that tag

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
	//I am saving my nodecontent data inside the property of XMLString File class
	
	if([elementName isEqualToString:@"num1"]){
		xmlStringFileObject.xmlEinsatzNummer=nodeContent;
	}
	if([elementName isEqualToString:@"einsatzsubtyp"]){
		xmlStringFileObject.xmlEinsatzSubTyp=nodeContent;
	}
    if([elementName isEqualToString:@"alarmstufe"]){
		xmlStringFileObject.xmlEinsatzAlarmstufe=nodeContent;
	}
    if([elementName isEqualToString:@"default"]){
		xmlStringFileObject.xmlEinsatzAdresse=nodeContent;
	}
    if([elementName isEqualToString:@"emun"]){
		xmlStringFileObject.xmlEinsatzAdresse2=nodeContent;
	}
    if([elementName isEqualToString:@"bezirk"]){
		xmlStringFileObject.xmlEinsatzBezirk=nodeContent;
	}
    if([elementName isEqualToString:@"startzeit"]){
		xmlStringFileObject.xmlEinsatzStartzeit=nodeContent;
	}
    if([elementName isEqualToString:@"inzeit"]){
		xmlStringFileObject.xmlEinsatzEnde=nodeContent;
	}
    if([elementName isEqualToString:@"status"]){
		xmlStringFileObject.xmlEinsatzStatus=nodeContent;
	}
	//finally when we reaches the end of tag i am adding data inside the NSMutableArray
	if([elementName isEqualToString:@"einsatz"]){
        
		[rssOutputData addObject:xmlStringFileObject];
		//[xmlStringFileObject release];
        xmlStringFileObject = nil;
	}
	//reallocate the memory to get new content data from file
	nodeContent=[[NSMutableString alloc]init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [rssOutputData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *MyIdentifier = @"einsatzDetail";
	
	// Try to retrieve from the table view a now-unused cell with the given identifier
	//UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
	
	 EinsatzTableCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
	
	
	// If no cell is available, create a new one using the given identifier
	if (cell == nil) {
		//add some extra text on table cell .........
		cell = [[EinsatzTableCell alloc] initWithStyle: UITableViewCellStyleSubtitle   reuseIdentifier:MyIdentifier];
	}

    cell.einsatzSubTyp.text=[[rssOutputData objectAtIndex:indexPath.row]xmlEinsatzSubTyp];
	cell.einsatzAlarmstufe.text=[[rssOutputData objectAtIndex:indexPath.row]xmlEinsatzAlarmstufe];
    cell.einsatzAdresse.text=[[rssOutputData objectAtIndex:indexPath.row]xmlEinsatzAdresse];
    cell.einsatzAdresse2.text=[[rssOutputData objectAtIndex:indexPath.row]xmlEinsatzAdresse2];
    cell.einsatzBezirk.text=[[rssOutputData objectAtIndex:indexPath.row]xmlEinsatzBezirk];
	return cell;
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"showEinsatzDetails"])
    {
        UINavigationController *detailEinsatz = [segue destinationViewController];
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        EinsatzDetailViewController *destEinsatz = [detailEinsatz.viewControllers objectAtIndex:0];
        destEinsatz.strEinsatzSubTyp = [[rssOutputData objectAtIndex:indexPath.row]xmlEinsatzSubTyp];
        destEinsatz.strEinsatzNummer = [[rssOutputData objectAtIndex:indexPath.row]xmlEinsatzNummer];
        destEinsatz.strEinsatzAdresse = [[rssOutputData objectAtIndex:indexPath.row]xmlEinsatzAdresse];
        destEinsatz.strEinsartAdresse2 = [[rssOutputData objectAtIndex:indexPath.row]xmlEinsatzAdresse2];
        destEinsatz.strEinsatzStartzeit = [[rssOutputData objectAtIndex:indexPath.row]xmlEinsatzStartzeit];
        destEinsatz.strEinsartEnde = [[rssOutputData objectAtIndex:indexPath.row]xmlEinsatzEnde];
        destEinsatz.strEinsatzStatus = [[rssOutputData objectAtIndex:indexPath.row]xmlEinsatzStatus];
    }
}

-(void)XMLURL
{
    NSString *tempurl = [[NSString alloc] initWithFormat:@"%@",einsatzurl2];
    NSURL *url = [[NSURL alloc] initWithString:[NSString stringWithFormat:@"%@", tempurl]];
    NSData *xmlData=[[NSData alloc]initWithContentsOfURL:url];
    //allocate memory for parser as well as
    xmlParserObject =[[NSXMLParser alloc]initWithData:xmlData];
    [xmlParserObject setDelegate:self];
    
    //asking the xmlparser object to beggin with its parsing
    [xmlParserObject parse];
    
    //releasing the object of NSData as a part of memory management
   // [xmlData release];
}

-(void)refresh:(UIRefreshControl*)refreshControl
{
    NSLog(@"refreshing");

    [self.tableView clearsContextBeforeDrawing];
    [self.tableView reloadData];
        [self XMLURL];
    //[self.activityIndicator setHidden:FALSE];
    //[self.activityIndicator startAnimating];
    [refreshControl endRefreshing];
}

@end
