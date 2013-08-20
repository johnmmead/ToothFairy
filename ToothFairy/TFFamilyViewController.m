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

@implementation TFFamilyViewController{
    NSDictionary *familySize;
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
    
    // setting model data
    self.selections = @[@"Two", @"Three", @"Four", @"Five", @"More than five"];
    familySize = @{@"Two" : @2, @"Three" : @3, @"Four" : @4 ,@"Five" : @5, @"More than five" : @6,};
    
    // title
    self.mainTitle.text = @"How big is your\nimmediate family?";
    
    // table view config
    [self.table registerNib:[UINib nibWithNibName:@"TFCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"TFCell"];
    [self.table registerNib:[UINib nibWithNibName:@"TFTopCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"TFTopCell"];

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
    if(indexPath.row == 0){
        TFTopCell *topCell = (TFTopCell *)[tableView dequeueReusableCellWithIdentifier:@"TFTopCell" forIndexPath:indexPath];
        topCell = [super decorateTopCell:topCell forIndex:indexPath.row];
        // align visual state with model
        NSNumber *size = [familySize objectForKey:topCell.label.text];
        if([self model].familySize == [size integerValue]){
            topCell.image.hidden = NO;
            [self.table scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
        }
        return topCell;
    } else {
        TFCell *cell = (TFCell *)[tableView dequeueReusableCellWithIdentifier:@"TFCell" forIndexPath:indexPath];
        cell = [super decorateCell:cell forIndex:indexPath.row];
        // align visual state with model
        // align visual state with model
        NSNumber *size = [familySize objectForKey:cell.label.text];
        if([self model].familySize == [size integerValue]){
            cell.image.hidden = NO;
            [self.table scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
        }
        return cell;
    }
    return nil;
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
    NSNumber *size = [familySize objectForKey:selection];

    // set model
    [self model].familySize = [size integerValue];
    
    // perform segue
    [self.parentViewController performSegueWithIdentifier:@"incomeViewController" sender:self];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 33.0;
    } else {
        return 39.0;
    }
}

@end
