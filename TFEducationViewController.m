//
//  TFEducationViewController.m
//  ToothFairy
//
//  Created by John Mead on 8/2/13.
//  Copyright (c) 2013 sevendesign. All rights reserved.
//

#import "TFEducationViewController.h"
#import "TFCell.h"

@interface TFEducationViewController ()

@end

@implementation TFEducationViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // setting model data
    self.selections = @[@"High School", @"College", @"Graduate School"];
    
    // title
    self.mainTitle.text = @"What is your\nlevel of education?";
    
    // table view config
    [self.table registerNib:[UINib nibWithNibName:@"TFCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"TFCell"];
    [self.table registerNib:[UINib nibWithNibName:@"TFTopCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"TFTopCell"];
    [self.table registerNib:[UINib nibWithNibName:@"TFBottomCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"TFBottomCell"];

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
    TFCell *cell;
    if(indexPath.row == 0){ // top cell
        cell = (TFCell *)[tableView dequeueReusableCellWithIdentifier:@"TFTopCell" forIndexPath:indexPath];
    } else if(indexPath.row == (self.selections.count) - 1){ // bottom cell
        cell = (TFCell *)[tableView dequeueReusableCellWithIdentifier:@"TFBottomCell" forIndexPath:indexPath];
    } else { // body cell
        cell = (TFCell *)[tableView dequeueReusableCellWithIdentifier:@"TFCell" forIndexPath:indexPath];
    }
    cell = [self decorateCell:cell forIndex:indexPath.row];
    
    // align visual state with model
    if([[self model].education isEqualToString:cell.label.text])
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
    [self model].education = selection;
    
    // perform segue
    [self.parentViewController performSegueWithIdentifier:@"maritalStatusViewController" sender:self];
}


@end
