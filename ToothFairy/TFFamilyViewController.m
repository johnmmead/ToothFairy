//
//  TFFamilyViewController.m
//  ToothFairy
//
//  Created by John Mead on 8/11/13.
//  Copyright (c) 2013 sevendesign. All rights reserved.
//

#import "TFFamilyViewController.h"

@interface TFFamilyViewController ()

@end

@implementation TFFamilyViewController

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
    self.selections = @[@"2", @"3", @"4", @"5", @"6", @"7+"];
    
    // title
    self.mainTitle.text = @"How big is your\nimmediate family?";
    
    // table view config
    [self.table registerNib:[UINib nibWithNibName:@"TFCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"TFCell"];
    self.table = [super configureTable:self.table forController:self];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.table reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    if([self model].familySize == [cell.label.text integerValue]){
        cell.image.hidden = NO;
        [self.table scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
    }
    
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
    
    // corner case of 7+
    if ([selection isEqualToString:@"7+"])
        selection = @"7";
    
    // set model
    [self model].familySize = [selection integerValue];
    
    // perform segue
    [self.parentViewController performSegueWithIdentifier:@"incomeViewController" sender:self];
}



@end
