//
//  UebersichtViewController.m
//  FF-Scharnstein
//
//  Created by Martin Kuenz on 2/6/13.
//  Copyright (c) 2013 Martin Kuenz. All rights reserved.
//

#import "UebersichtViewController.h"

@interface UebersichtViewController ()

@end

@implementation UebersichtViewController
{
    NSArray *einsatzArray;
    NSArray *aktuellerEinsatzArray;
    
    NSMutableArray *dataArray;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    //einsatzArray = [NSArray arrayWithObjects:@"laufende Einsätze", @"letzen 6 Stunden", nil];
    //aktuellerEinsatzArray = [NSArray arrayWithObjects:@"aktueller Einsatz", nil];
    
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

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSDictionary *dict = [dataArray objectAtIndex:section];
    NSArray *array = [dict objectForKey:@"data"];
    return [array count];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
   return [dataArray count];
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIndentifier = @"EinsatzCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIndentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIndentifier];
    }
    
    NSDictionary *dict = [dataArray objectAtIndex:indexPath.section];
    NSArray *array = [dict objectForKey:@"data"];
    NSString *cellValue = [array objectAtIndex:indexPath.row];
    cell.textLabel.text = cellValue;
    
    return cell;
    
    /*if (indexPath.section == 0) {
    cell.textLabel.text = [einsatzArray objectAtIndex:indexPath.row];
    }
    if (indexPath.section == 0) {
        cell.textLabel.text = [aktuellerEinsatzArray objectAtIndex:indexPath.row];
    }
    
        return cell;
    //return cell;*/
    
    
    
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


@end
