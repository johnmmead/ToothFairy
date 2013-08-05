//
//  TFGenderTableViewController.m
//  ToothFairy
//
//  Created by John Mead on 8/1/13.
//  Copyright (c) 2013 sevendesign. All rights reserved.
//

#import "TFGenderTableViewController.h"
#import "TFEducationViewController.h"

@interface TFGenderTableViewController ()

@property (strong, nonatomic) NSArray *selections;

@end

@implementation TFGenderTableViewController

@synthesize selections;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // populate the possible choices
    self.selections = @[@"male", @"female"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
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
    if([[self model].gender isEqualToString:selection]){
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
    [self model].gender = selection;
    
    // set selection checkmark on selected row
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[TFConstants kCellIdentifier] forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    cell.accessoryView = [TFConstants kCellCheckmarkImage];
    [tableView reloadData];

    // perform segue
    [self.parentViewController performSegueWithIdentifier:@"educationViewController" sender:self];

}

@end
