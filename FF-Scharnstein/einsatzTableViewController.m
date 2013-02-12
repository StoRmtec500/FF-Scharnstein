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
#import "UebersichtTableViewController.h"

@interface EinsatzTableViewController ()

@end

@implementation EinsatzTableViewController

@synthesize tableView2;
@synthesize einsatzSubTyp, lblaktuellerEinsatz, einsatzurl;


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
    NSLog(@"node content = %@",nodeContent);
}

//bellow delegate method specify when it encounter end tag of specific that tag

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
	//I am saving my nodecontent data inside the property of XMLString File class
	
	if([elementName isEqualToString:@"num1"]){
		xmlStringFileObject.xmlEinsatzNummer=nodeContent;
	}
	if([elementName isEqualToString:@"einsatzsubtyp"]){
		xmlStringFileObject.xmlEinsatzTyp=nodeContent;
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
	//finally when we reaches the end of tag i am adding data inside the NSMutableArray
	if([elementName isEqualToString:@"einsatz"]){
        
		[rssOutputData addObject:xmlStringFileObject];
		[xmlStringFileObject release];
        xmlStringFileObject = nil;
	}
	//release the data from mutable string variable
	[nodeContent release];
    
	//reallocate the memory to get new content data from file
	nodeContent=[[NSMutableString alloc]init];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.isAscending = YES;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    // self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(print_Message)];
    
    
#pragma mark - Refresh für die Tabelle
    //****** Refresh eingebaut bei den Einsätzen *****//
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc]init];
    refreshControl.tintColor = [UIColor redColor];
    [refreshControl addTarget:self action:@selector(refresh:) forControlEvents:UIControlEventValueChanged];
    [self setRefreshControl:refreshControl];
    
   [self XMLURL];
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
		cell = [[[EinsatzTableCell alloc] initWithStyle: UITableViewCellStyleSubtitle   reuseIdentifier:MyIdentifier] autorelease];
	}
    NSLog(@"EinsatzTableViewgekloclt2");
	// Set up the cell
	//[cell.textLabel setFont:[UIFont fontWithName:@"Verdana" size:12]];
	//[cell.detailTextLabel setFont:[UIFont fontWithName:@"Verdana" size:12]];
    
	//cell.textLabel.text=[[rssOutputData objectAtIndex:indexPath.row]xmlEinsatzNummer];
	//cell.detailTextLabel.text=[[rssOutputData objectAtIndex:indexPath.row]xmlEinsatzTyp];
    cell.einsatzSubTyp.text=[[rssOutputData objectAtIndex:indexPath.row]xmlEinsatzTyp];
	cell.einsatzAlarmstufe.text=[[rssOutputData objectAtIndex:indexPath.row]xmlEinsatzAlarmstufe];
    cell.einsatzAdresse.text=[[rssOutputData objectAtIndex:indexPath.row]xmlEinsatzAdresse];
    cell.einsatzAdresse2.text=[[rssOutputData objectAtIndex:indexPath.row]xmlEinsatzAdresse2];
    cell.einsatzBezirk.text=[[rssOutputData objectAtIndex:indexPath.row]xmlEinsatzBezirk];
	return cell;
}

/*-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *sectionHeader = nil;
    if(section == 0)
    {
        sectionHeader = @"Aktuelle Einsätze";
    }
    return sectionHeader;
}*/

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"showEinsatzDetails"])
    {
        UINavigationController *detailEinsatz = [segue destinationViewController];
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        EinsatzDetailViewController *destEinsatz = [detailEinsatz.viewControllers objectAtIndex:0];
        destEinsatz.strEinsatzNummer = [[rssOutputData objectAtIndex:indexPath.row]xmlEinsatzTyp];
    }
}

-(void)XMLURL
{
    rssOutputData = [[NSMutableArray alloc]init];
    NSString *tempurl = [[NSString alloc] initWithFormat:@"%@",einsatzurl];
   // NSURL *url = [NSURL URLWithString:tempurl];
    NSURL *url = [[NSURL alloc] initWithString:[NSString stringWithFormat:@"%@", tempurl]];
        NSLog(@"EinsatzTable: %@", einsatzurl);
    //declare the object of allocated variable
    NSData *xmlData=[[NSData alloc]initWithContentsOfURL:url];
    NSLog(@"%@", url);
    //allocate memory for parser as well as
    xmlParserObject =[[NSXMLParser alloc]initWithData:xmlData];
    [xmlParserObject setDelegate:self];
    
    //asking the xmlparser object to beggin with its parsing
    [xmlParserObject parse];
    
    //releasing the object of NSData as a part of memory management
    [xmlData release];
}

-(void)refresh:(UIRefreshControl*)refreshControl
{
    NSLog(@"refreshing");
    [self XMLURL];
    [self.tableView reloadData];
    //[self.activityIndicator setHidden:FALSE];
    //[self.activityIndicator startAnimating];
    [refreshControl endRefreshing];
}

@end
