//
//  TFBaseViewController.m
//  ToothFairy
//
//  Created by John Mead on 8/1/13.
//  Copyright (c) 2013 sevendesign. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <AudioToolbox/AudioToolbox.h>
#import "TFBaseViewController.h"
#import "TFAppDelegate.h"
#import "TFCell.h"

@interface TFBaseViewController ()
@end

static SystemSoundID _nuk;
static SystemSoundID _ping;
static SystemSoundID _schwit;
static SystemSoundID _chimesSound;
static SystemSoundID _fairyAppearsSound;
static SystemSoundID _dingSound;


@implementation TFBaseViewController{
    UIImageView *_tfCheckmark;
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
    
    self.title = @"TOOTH FAIRY";
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    // nav bar customization
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    UIColor *navbarColor = [UIColor colorWithRed:0.118 green:0.482 blue:0.639 alpha:1.000];

    // nav bar button customization
    self.navigationController.navigationBar.tintColor = navbarColor;
    self.navigationController.navigationBar.backItem.backBarButtonItem.tintColor = navbarColor;
        
}

- (TFModel *)model
{
	return [(TFAppDelegate *)[[UIApplication sharedApplication] delegate] model];
}

- (void)clearModel{
    [self model].age = 40;
    [self model].education = nil;
    [self model].familySize = 0;
    [self model].gender = nil;
    [self model].income = 60;
    [self model].state = nil;
    [self model].maritalStatus = nil;
    [self model].finalAmount = 0;
}

- (BOOL)hasRetinaDisplay
{
    if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)] && [[UIScreen mainScreen] scale] == 2)
        return YES;
    else
        return NO;
}

-(UIImageView *)checkmark
{
    if(_tfCheckmark == nil)
    	_tfCheckmark = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cellCheckmark"]];
    
    return _tfCheckmark;
}

// table view common stuff
- (TFCell *)decorateCell:(TFCell *)cell forIndex:(int)index {
    
    // if this is the first cell there is no border
    if(index == 0){
        cell.dots.hidden = YES;
    } else {
        cell.dots.hidden = NO;
    }
    
    // align the view checkmark with the model
    if([self.model.gender isEqualToString:[self.selections objectAtIndex:index]]){
        cell.image.hidden = NO;
    } else {
        cell.image.hidden = YES;
    }
    
    cell.label.font = [UIFont fontWithName:@"HelveticaRoundedLTStd-Bd" size:21.0f];
    cell.label.text = [self.selections objectAtIndex:index];
    cell.label.textColor = [UIColor whiteColor];

    return cell;
}

- (UITableView *)configureTable:(UITableView *)table forController:(id)controller{
    table.delegate = controller;
    table.dataSource = controller;
    table.rowHeight = 39;
    table.backgroundColor = [UIColor clearColor];
    table.separatorStyle = UITableViewCellSeparatorStyleNone;
    table.bounces = NO;
    return table;
}

+ (void)nukSound
{
    if(!_nuk){
        NSString *path = [[NSBundle mainBundle] pathForResource:@"nuk" ofType:@"aiff"];
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath: path], &_nuk);
    }
    AudioServicesPlaySystemSound(_nuk);
}

+ (void)pingSound
{
    if(!_ping){
        NSString *path = [[NSBundle mainBundle] pathForResource:@"ping" ofType:@"aiff"];
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath: path], &_ping);
    }
    AudioServicesPlaySystemSound(_ping);
}

+ (void)schwitSound
{
    if(!_schwit){
        NSString *path = [[NSBundle mainBundle] pathForResource:@"schwit" ofType:@"aiff"];
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath: path], &_schwit);
    }
    AudioServicesPlaySystemSound(_schwit);
}

+ (void)dingSound
{
    if(!_dingSound){
        NSString *path = [[NSBundle mainBundle] pathForResource:@"ding" ofType:@"wav"];
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath: path], &_dingSound);
    }
    AudioServicesPlaySystemSound(_dingSound );
}

+ (void)chimesSound
{
    if(!_chimesSound){
        NSString *path = [[NSBundle mainBundle] pathForResource:@"chimes" ofType:@"aiff"];
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath: path], &_chimesSound);
    }
    AudioServicesPlaySystemSound(_chimesSound);
}

+ (void)buttonPressSound
{
    [self pingSound];
}

+ (void)fairyAppearsSound
{
    if(!_fairyAppearsSound){
        NSString *path = [[NSBundle mainBundle] pathForResource:@"fairyAppears" ofType:@"wav"];
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath: path], &_fairyAppearsSound);
    }
    AudioServicesPlaySystemSound(_fairyAppearsSound);
}


@end
