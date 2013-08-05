//
//  TFEducationTableViewController.m
//  ToothFairy
//
//  Created by John Mead on 8/2/13.
//  Copyright (c) 2013 sevendesign. All rights reserved.
//

#import "TFEducationTableViewController.h"

@interface TFEducationTableViewController ()

@property (strong, nonatomic) NSArray *selections;

@end

@implementation TFEducationTableViewController

@synthesize selections;

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
    
    // populate the possible choices
    self.selections = @[@"high school", @"college", @"grad school"];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.selections.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *selection = [self.selections objectAtIndex:indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[TFConstants kCellIdentifier] forIndexPath:indexPath];
    cell.textLabel.text = selection;
    cell.backgroundColor = [UIColor clearColor];
    
    // align state to model
    if([[self model].education isEqualToString:selection]){
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        cell.accessoryView = [TFConstants kCellCheckmarkImage];
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.accessoryView = nil;
    }
    
    return cell;
}

#pragma mark - Table view delegate


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // align model to state of selection in control
    NSString *selection = [self.selections objectAtIndex:indexPath.row];
    [self model].education = selection;
    
    // set selection checkmark on selected row
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[TFConstants kCellIdentifier] forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    cell.accessoryView = [TFConstants kCellCheckmarkImage];
    [tableView reloadData];
    
    // perform segue
    [self.parentViewController performSegueWithIdentifier:@"ageViewController" sender:self];
    
}

@end
