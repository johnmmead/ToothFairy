//
//  TFStateViewController.m
//  ToothFairy
//
//  Created by John Mead on 8/11/13.
//  Copyright (c) 2013 sevendesign. All rights reserved.
//

#import "TFStateViewController.h"
#import "TFCell.h"

@interface TFStateViewController ()

@end

@implementation TFStateViewController

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
    
    // setting model data    
    self.selections = @[@"Alabama", @"Alaska", @"American Samoa", @"Arizona", @"Arkansas", @"California", @"Colorado", @"Connecticut", @"Delaware", @"District of Columbia", @"Florida", @"Georgia", @"Guam", @"Hawaii", @"Idaho", @"Illinois", @"Indiana", @"Iowa", @"Kansas", @"Kentucky", @"Louisiana", @"Maine", @"Maryland", @"Massachusetts", @"Michigan", @"Minnesota", @"Mississippi", @"Missouri", @"Montana", @"Nebraska", @"Nevada", @"New Hampshire", @"New Jersey", @"New Mexico", @"New York", @"North Carolina", @"North Dakota", @"Northern Mariana Islands", @"Ohio", @"Oklahoma", @"Oregon", @"Pennsylvania", @"Puerto Rico", @"Rhode Island", @"South Carolina", @"South Dakota", @"Tennessee", @"Texas", @"U.S. Virgin Islands", @"Utah", @"Vermont", @"Virginia", @"Washington", @"West Virginia", @"Wisconsin", @"Wyoming"];
    
    // title
    self.mainTitle.text = @"Which state\ndo you live in?";
    
    // table view config
    [self.table registerNib:[UINib nibWithNibName:@"TFCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"TFCell"];
    [self.table registerNib:[UINib nibWithNibName:@"TFTopCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"TFTopCell"];
    [self.table registerNib:[UINib nibWithNibName:@"TFBottomCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"TFBottomCell"];

    self.table = [super configureTable:self.table forController:self];
    

    //self.tableTop.frame = self.tableContainer.frame.origin;
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.table reloadData];
    
    // make sure the table top and bottom elements are correctly aligned
    CGRect tableFrame = self.tableContainer.frame;
    
    // the top
    CGRect tableTopFrame = self.tableTop.frame;
    CGRect newTop = CGRectMake(tableFrame.origin.x, tableFrame.origin.y - tableTopFrame.size.height, tableFrame.size.width, tableTopFrame.size.height);
    self.tableTop.frame = newTop;
    
    // the bottom
    CGRect tableBottomFrame = self.tableBottom.frame;
    CGRect newBottom = CGRectMake(tableFrame.origin.x, tableFrame.size.height + tableFrame.origin.y, tableFrame.size.width, tableBottomFrame.size.height);
    self.tableBottom.frame = newBottom;
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
    cell = [self decorateCell:cell forIndex:indexPath.row];

    if(indexPath.row == 0){ // top cell
        cell.dots.hidden = YES;
    } else {
        cell.dots.hidden = NO;
    }

    // align visual state with model
    if([[self model].state isEqualToString:cell.label.text])
        cell.image.hidden = NO;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [TFBaseViewController buttonPressSound];
    
    // set table view slection
    TFCell *cell = (TFCell *)[tableView dequeueReusableCellWithIdentifier:@"TFCell" forIndexPath:indexPath];
    cell.image.hidden = NO;
    [self.table reloadData];    
    
    // align model to state of selection in control
    NSString *selection = [self.selections objectAtIndex:indexPath.row];
    [self model].state = selection;
    
    // perform segue
    [self.parentViewController performSegueWithIdentifier:@"educationViewController" sender:self];
}


@end
