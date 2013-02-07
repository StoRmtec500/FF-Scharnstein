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

@synthesize tableView1;
@synthesize einsatzSubTyp;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark NSXMLParser delegate

//below delegate method is sent by a parser object to provide its delegate when it encounters a start tag

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict
{
	//if element name is equat to item then only i am assingning memory to the NSObject class
    
	if([elementName isEqualToString:@"einsatz"]){
		xmlStringFileObject =[[XMLStringFile alloc]init];
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
 //   if([elementName isEqualToString:@"alarmstufe"]){
	//	xmlStringFileObject.xmltest=nodecontent;
//	}
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

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    rssOutputData = [[NSMutableArray alloc]init];
    
    //declare the object of allocated variable
    NSData *xmlData=[[NSData alloc]initWithContentsOfURL:[NSURL URLWithString:@"http://intranet.ooelfv.at/webext2/rss/webext2_laufend.xml"]];
    
    //allocate memory for parser as well as
    xmlParserObject =[[NSXMLParser alloc]initWithData:xmlData];
    [xmlParserObject setDelegate:self];
    
    //asking the xmlparser object to beggin with its parsing
    [xmlParserObject parse];
    
    //releasing the object of NSData as a part of memory management
    [xmlData release];
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
    
	// Set up the cell
	//[cell.textLabel setFont:[UIFont fontWithName:@"Verdana" size:12]];
	//[cell.detailTextLabel setFont:[UIFont fontWithName:@"Verdana" size:12]];
    
	//cell.textLabel.text=[[rssOutputData objectAtIndex:indexPath.row]xmlEinsatzNummer];
	//cell.detailTextLabel.text=[[rssOutputData objectAtIndex:indexPath.row]xmlEinsatzTyp];
    cell.einsatzSubTyp.text=[[rssOutputData objectAtIndex:indexPath.row]xmlEinsatzTyp];
	
	return cell;
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"showEinsatzDetails"])
    {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        EinsatzDetailViewController *destViewController = segue.destinationViewController;
        //destViewController.strEinsartzNummer = [rssOutputData objectAtIndex:indexPath.row];
        destViewController.strEinsartzNummer = [[rssOutputData objectAtIndex:indexPath.row]xmlEinsatzTyp];
    }
}

@end
