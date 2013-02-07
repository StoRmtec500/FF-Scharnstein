//
//  EinsatzTableViewController.m
//  FF-Scharnstein
//
//  Created by Martin Kuenz on 06.02.13.
//  Copyright (c) 2013 Martin Kuenz. All rights reserved.
//

#import "EinsatzTableViewController.h"

@interface EinsatzTableViewController ()

@end

@implementation EinsatzTableViewController

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
	static NSString *MyIdentifier = @"MyIdentifier";
	
	// Try to retrieve from the table view a now-unused cell with the given identifier
	//UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
	
	
	// If no cell is available, create a new one using the given identifier
	if (cell == nil) {
		//cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:MyIdentifier] autorelease];
		
		//add some extra text on table cell .........
		cell = [[[UITableViewCell alloc] initWithStyle: UITableViewCellStyleSubtitle   reuseIdentifier:MyIdentifier] autorelease];
		
	}
	// Set up the cell
	[cell.textLabel setFont:[UIFont fontWithName:@"Verdana" size:12]];
	[cell.detailTextLabel setFont:[UIFont fontWithName:@"Verdana" size:12]];
	cell.textLabel.text=[[rssOutputData objectAtIndex:indexPath.row]xmlEinsatzNummer];
	cell.detailTextLabel.text=[[rssOutputData objectAtIndex:indexPath.row]xmlEinsatzTyp];
	
	return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
