//
//  TFGenderViewController.m
//  ToothFairy
//
//  Created by John Mead on 8/1/13.
//  Copyright (c) 2013 sevendesign. All rights reserved.
//

#import "TFGenderViewController2.h"
#import "TFCell.h"

@interface TFGenderViewController2 ()

@end

@implementation TFGenderViewController2{
    NSArray *things;
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
    
    // table view config
    [self.table registerNib:[UINib nibWithNibName:@"TFCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"TFCell"];
    self.table.delegate = self;
    self.table.dataSource = self;
    self.table.rowHeight = 39;
    self.table.backgroundColor = [UIColor clearColor];
    self.table.separatorStyle = UITableViewCellSelectionStyleNone;
    
    // setting model data
    self.selections = @[@"Male", @"Female"];
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
    // Return the number of sections.
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

    // if this is the first cell there is no border
    if(indexPath.row == 0){
        cell.dots.hidden = YES;
    } else {
        cell.dots.hidden = NO;
    }
    
    // align the view checkmark with the model
    if([self.model.gender isEqualToString:[self.selections objectAtIndex:indexPath.row]]){
        cell.image.hidden = NO;
    } else {
        cell.image.hidden = YES;
    }
    
    cell.label.font = [UIFont fontWithName:@"HelveticaRoundedLTStd-Bd" size:21.0f];
    cell.label.text = [self.selections objectAtIndex:indexPath.row];
    cell.label.textColor = [UIColor whiteColor];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  //  [super tableView:tableView didSelectRowAtIndexPath:indexPath];
    
    // set table view slection
    TFCell *cell = (TFCell *)[tableView dequeueReusableCellWithIdentifier:@"TFCell" forIndexPath:indexPath];
    cell.image.alpha = 1.0;
    
    // align model to state of selection in control
    NSString *selection = [self.selections objectAtIndex:indexPath.row];
    [self model].gender = selection;
    
    // perform segue
    [self.parentViewController performSegueWithIdentifier:@"educationViewController" sender:self];
    
}



@end
