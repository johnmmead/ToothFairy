//
//  TFGenderTableViewController.m
//  ToothFairy
//
//  Created by John Mead on 8/1/13.
//  Copyright (c) 2013 sevendesign. All rights reserved.
//

#import "TFGenderTableViewController.h"
#import "TFEducationViewController.h"

#import "TFCell.h"

#import <QuartzCore/QuartzCore.h>


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
    
    // table set up
    [self.tableView registerNib:[UINib nibWithNibName:@"TFCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:[TFConstants kCellIdentifier]];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    // populate the possible choices
    self.selections = @[@"Male", @"Female"];
    [self.tableView reloadData];
    
    // table stuff
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.backgroundView = nil;

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
    
    TFCell *cell = [tableView dequeueReusableCellWithIdentifier:[TFConstants kCellIdentifier] forIndexPath:indexPath];
    cell.textLabel.text = selection;
    
//    if(indexPath.row < selections.count -1){
//        UIColor *backgroundPatternColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"backgroundTileBlueDotted"]];
//        cell.backgroundColor = backgroundPatternColor;
////    } else {
////        UIColor *backgroundPatternColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"backgroundTileBlue"]];
////        cell.backgroundColor = backgroundPatternColor;
//    }

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
    TFCell *cell = [tableView dequeueReusableCellWithIdentifier:[TFConstants kCellIdentifier] forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    cell.accessoryView = [TFConstants kCellCheckmarkImage];
    [tableView reloadData];

    // perform segue
    [self.parentViewController performSegueWithIdentifier:@"educationViewController" sender:self];

}

@end
