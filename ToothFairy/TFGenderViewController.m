//
//  TFGenderViewController.m
//  ToothFairy
//
//  Created by John Mead on 8/1/13.
//  Copyright (c) 2013 sevendesign. All rights reserved.
//

#import "TFGenderViewController.h"
#import "TFCell.h"

@interface TFGenderViewController ()

@end

@implementation TFGenderViewController{
    NSArray *things;
}

@synthesize mainTitle;

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
    
    self.mainTitle.font = [UIFont fontWithName:@"Baskerville" size:36.0f];
    self.mainTitle.textColor = [TFConstants kMainTitleTextColor];
    self.mainTitle.text = @"Select Your\nGender";

    //jmead - table view stuff
    [self.table registerNib:[UINib nibWithNibName:@"TFCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"TFCell"];
    
    self.table.rowHeight = 60;
    self.table.backgroundColor = [UIColor clearColor];
    self.table.separatorStyle = UITableViewCellSelectionStyleNone;
    
    things = @[@"pants", @"socks", @"gstring" ];

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    return things.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    if(indexPath.row == 0){
        TFCell *cell = (TFCell *)[tableView dequeueReusableCellWithIdentifier:@"TFCell" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.label.font = [UIFont fontWithName:@"Helvetica" size:38.0f];
        cell.label.text = [things objectAtIndex:indexPath.row];
        return cell;
   // } else {
//        JohnCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        return cell;
     //   return nil;
   // }
    
    //    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // cell.textLabel.text = [things objectAtIndex:indexPath.row];
    
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // [self.parentViewController performSegueWithIdentifier:@"educationViewController" sender:self];
    if(indexPath.row > 0){
        
    }
    
}


@end
