//
//  UebersichtTableViewController.m
//  FF-Scharnstein
//
//  Created by Martin Kuenz on 2/6/13.
//  Copyright (c) 2013 Martin Kuenz. All rights reserved.
//

#import "UebersichtTableViewController.h"

@interface UebersichtTableViewController ()

@end

@implementation UebersichtTableViewController

{
    NSArray *einsatzArray;
    NSArray *aktuellerEinsatzArray;
    
    NSMutableArray *dataArray;
    NSArray *einsatz;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    //self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonItemStylePlain target:self action:@selector(print_Message)];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    dataArray = [[NSMutableArray alloc]init];
    
    NSArray *firstItem = [[NSArray alloc] initWithObjects:@"aktuelle Alarmierungen", nil];
    NSDictionary *firstItemArrayDict = [NSDictionary dictionaryWithObject:firstItem forKey:@"data"];
    [dataArray addObject:firstItemArrayDict];
    
    NSArray *secondItem = [[NSArray alloc] initWithObjects:@"6 Stunden", @"aktueller Tag", @"2 Tage", @"aktuelle Woche", @"letztes Monat", nil];
    NSDictionary *secondItemArrayDict = [NSDictionary dictionaryWithObject:secondItem forKey:@"data"];
    [dataArray addObject:secondItemArrayDict];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
   return [dataArray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSDictionary *dict = [dataArray objectAtIndex:section];
    NSArray *array = [dict objectForKey:@"data"];
    return [array count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"einsatzCell"];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"einsatzCell"];
    }
    
    NSDictionary *dict = [dataArray objectAtIndex:indexPath.section];
    NSArray *array = [dict objectForKey:@"data"];
    NSString *cellValue = [array objectAtIndex:indexPath.row];
    cell.textLabel.text = cellValue;
    
    return cell;
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *sectionHeader = nil;
    
    if(section == 0)
    {
        sectionHeader = @"Aktuelle Einsätze";
    }
    
    if(section == 1)
    {
        sectionHeader = @"Zeitraum der Einsätze";
    }
    
    return sectionHeader;
}


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
