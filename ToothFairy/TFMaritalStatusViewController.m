//
//  TFMaritalStatusViewController.m
//  ToothFairy
//
//  Created by John Mead on 8/11/13.
//  Copyright (c) 2013 sevendesign. All rights reserved.
//

#import "TFMaritalStatusViewController.h"
#import "TFCell.h"

@interface TFMaritalStatusViewController ()

@end

@implementation TFMaritalStatusViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // setting model data
    self.selections = @[@"Married", @"Not married"];
    
    // title
    self.mainTitle.text = @"What is your\nmarital status?";
    
    // table view config
    [self.table registerNib:[UINib nibWithNibName:@"TFCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"TFCell"];
    self.table = [super configureTable:self.table forController:self];

    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.table reloadData];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.selections.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TFCell *cell = (TFCell *)[tableView dequeueReusableCellWithIdentifier:@"TFCell" forIndexPath:indexPath];
    cell = [super decorateCell:cell forIndex:indexPath.row];
    
    // align visual state with model
    if([[self model].maritalStatus isEqualToString:cell.label.text])
        cell.image.hidden = NO;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [TFBaseViewController nukSound];
    
    // set table view slection
    TFCell *cell = (TFCell *)[tableView dequeueReusableCellWithIdentifier:@"TFCell" forIndexPath:indexPath];
    cell.image.hidden = NO;
    [self.table reloadData];
    
    // align model to state of selection in control
    NSString *selection = [self.selections objectAtIndex:indexPath.row];
    [self model].maritalStatus = selection;
    
    // perform segue
    [self.parentViewController performSegueWithIdentifier:@"familyViewController" sender:self];
}



@end
