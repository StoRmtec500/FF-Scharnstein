//
//  UebersichtTableViewController.m
//  FF-Scharnstein
//
//  Created by Martin Kuenz on 2/6/13.
//  Copyright (c) 2013 Martin Kuenz. All rights reserved.
//

#import "UebersichtTableViewController.h"
#import "InfoViewController.h"
#import "EinsatzTableViewController.h"

@interface UebersichtTableViewController ()
{
    InfoViewController *infoView;
}

@end

@implementation UebersichtTableViewController

{
    NSArray *einsatzArray;
    NSArray *aktuellerEinsatzArray;
    
    NSMutableArray *dataArray;
    NSArray *einsatz;
}

@synthesize einsatzurl1;


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
    
    dataArray = [[NSMutableArray alloc]init];
    
    NSArray *firstItem = [[NSArray alloc] initWithObjects:@"aktuelle Alarmierungen", nil];
    NSDictionary *firstItemArrayDict = [NSDictionary dictionaryWithObject:firstItem forKey:@"data"];
    [dataArray addObject:firstItemArrayDict];
    
    NSArray *secondItem = [[NSArray alloc] initWithObjects:@"6 Stunden", @"aktueller Tag", @"2 Tage", @"aktuelle Woche", @"letztes Monat", nil];
    NSDictionary *secondItemArrayDict = [NSDictionary dictionaryWithObject:secondItem forKey:@"data"];
    [dataArray addObject:secondItemArrayDict];
    
  //  self.einsatzurl1 = [[NSString alloc]init];
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

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"url"])
    {
        NSIndexPath *indexPath = [[self tableView]indexPathForSelectedRow];
        if (indexPath.section == 0 &&
            indexPath.row == 0) {
            self.einsatzurl1 = @"http://intranet.ooelfv.at/webext2/rss/webext2_laufend.xml";
           // NSURL *url = [[NSURL alloc] initWithString:[NSString stringWithFormat:@"%@", einsatzurl1]];
          //  NSLog(@"%@", url);
        }
        if (indexPath.section == 1 &&
            indexPath.row == 0) {
            self.einsatzurl1 = @"http://intranet.ooelfv.at/webext2/rss/webext2_6stunden.xml";
           // NSURL *url = [[NSURL alloc] initWithString:[NSString stringWithFormat:@"%@", einsatzurl1]];
            //NSLog(@"%@", url);
        }
        if (indexPath.section == 1 &&
            indexPath.row == 1) {
            self.einsatzurl1 = @"http://intranet.ooelfv.at/webext2/rss/webext2_taeglich.xml";
        }
        if (indexPath.section == 1 &&
            indexPath.row == 2) {
            self.einsatzurl1 = @"http://intranet.ooelfv.at/webext2/rss/webext2_2tage.xml";
        }
        if (indexPath.section == 1 &&
            indexPath.row == 3) {
            self.einsatzurl1 = @"http://intranet.ooelfv.at/webext2/rss/webext2_woche.xml";
        }
        if (indexPath.section == 1 &&
            indexPath.row == 4) {
            self.einsatzurl1 = @"http://intranet.ooelfv.at/webext2/rss/webext2_monat.xml";
        }
        EinsatzTableViewController *destEinsatz = [segue destinationViewController];
        destEinsatz.einsatzurl2 = self.einsatzurl1;
    }
}

- (IBAction)InfoView:(id)sender
{
    [self.navigationController pushViewController:infoView animated:UIModalPresentationPageSheet];
}
@end
