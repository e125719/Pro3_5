//
//  ListTableViewController.m
//  PowerArea_2
//
//  Created by e125719 on 2014/05/27.
//  Copyright (c) 2014年 e125719. All rights reserved.
//

#import "ListTableViewController.h"
#import "AppDelegate.h"
#import "MapDataEntity.h"

@interface ListTableViewController ()

@property (nonatomic, strong) NSArray *fetchedRecordsArray;

@end

@implementation ListTableViewController

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
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    
    self.fetchedRecordsArray = [delegate getAllMap];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.fetchedRecordsArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"MapCellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    MapDataEntity *map = [self.fetchedRecordsArray objectAtIndex:indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@",map.title];
    
    return cell;
}

@end