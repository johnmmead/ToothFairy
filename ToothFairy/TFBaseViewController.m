//
//  TFBaseViewController.m
//  ToothFairy
//
//  Created by John Mead on 8/1/13.
//  Copyright (c) 2013 sevendesign. All rights reserved.
//

#import "TFBaseViewController.h"
#import "TFAppDelegate.h"
#import <QuartzCore/QuartzCore.h>

@interface TFBaseViewController ()

@end

@implementation TFBaseViewController{
    UIImageView *_tfCheckmark;
}

@synthesize selections;

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

@end
