//
//  TFBaseTableViewController.m
//  ToothFairy
//
//  Created by John Mead on 8/1/13.
//  Copyright (c) 2013 sevendesign. All rights reserved.
//

#import "TFBaseTableViewController.h"
#import "TFAppDelegate.h"
#import "TFCell.h"

@interface TFBaseTableViewController ()

@end

@implementation TFBaseTableViewController{
    UIImageView *_tfCheckmark;
}

@synthesize selections;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // table set up
//    [self.tableView registerNib:[UINib nibWithNibName:@"TFCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:[TFConstants kCellIdentifier]];

    self.clearsSelectionOnViewWillAppear = NO;
    self.tableView.rowHeight = 60.0;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//    self.tableView.separatorColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"cellSeparatorDotted2"]];
//    self.tableView.separatorColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"plane"]];
//    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (TFModel *)model
{
	return [(TFAppDelegate *)[[UIApplication sharedApplication] delegate] model];
}


-(UIImageView *)checkmark
{
    if(_tfCheckmark == nil)
    	_tfCheckmark = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cellCheckmark"]];
    
    return _tfCheckmark;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {

    TFCell *tfCell = (TFCell *)cell;
    
//    tfCell.contentView.hidden = YES;
    
//    UIColor *backgroundPatternColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"backgroundTileBlue"]];
//    tfCell.backgroundColor = backgroundPatternColor; //jmead
//
    
   // cell.frame=CGRectMake(44,0,tableView.bounds.size.width,44); //jmead
    
    NSString *selection = [self.selections objectAtIndex:indexPath.row];
    tfCell.label.text = selection;
    //tfCell.textLabel.text = selection;
    
//    if(indexPath.row < selections.count -1){
//        UIColor *backgroundPatternColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"backgroundTileBlueDotted"]];
//        cell.backgroundColor = backgroundPatternColor;
//    } else {
//        UIColor *backgroundPatternColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"backgroundTileBlue"]];
//        cell.backgroundColor = backgroundPatternColor;
//    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *selection = [self.selections objectAtIndex:indexPath.row];
    TFCell *cell = (TFCell *)[tableView dequeueReusableCellWithIdentifier:[TFConstants kCellIdentifier] forIndexPath:indexPath];
 
//    cell.cellText.text = selection;
 cell.textLabel.text = selection;

//    cell.textLabel.text = selection;

    // align state to model
//    if([[self model].gender isEqualToString:selection]){
//        cell.cellImage.image = [UIImage imageNamed:@"cellCheckmark"];
////        cell.accessoryType = UITableViewCellAccessoryCheckmark;
////        cell.accessoryView = [TFConstants kCellCheckmarkImage];
//    } else {
//        cell.cellImage.image = nil;
//
////        cell.accessoryType = UITableViewCellAccessoryNone;
////        cell.accessoryView = nil;
//    }

    
    
    
//    if([[self model].gender isEqualToString:selection]){
//        cell.accessoryType = UITableViewCellAccessoryCheckmark;
//        cell.accessoryView = [TFConstants kCellCheckmarkImage];
//    } else {
//        cell.accessoryType = UITableViewCellAccessoryNone;
//        cell.accessoryView = nil;
//    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{    
    // set selection checkmark on selected row
    TFCell *cell = [tableView dequeueReusableCellWithIdentifier:[TFConstants kCellIdentifier] forIndexPath:indexPath];

    cell.image.image = [UIImage imageNamed:@"cellCheckmark"];

//    cell.accessoryType = UITableViewCellAccessoryCheckmark;
//    cell.accessoryView = [TFConstants kCellCheckmarkImage];
    [tableView reloadData];
    
}


@end
