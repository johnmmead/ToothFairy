//
//  TFBaseViewController.m
//  ToothFairy
//
//  Created by John Mead on 8/1/13.
//  Copyright (c) 2013 sevendesign. All rights reserved.
//

#import "TFBaseViewController.h"
#import "TFAppDelegate.h"

@interface TFBaseViewController ()

@end

@implementation TFBaseViewController

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
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    UIColor *navbarColor = [UIColor colorWithRed:0.118 green:0.482 blue:0.639 alpha:1.000];
    self.navigationController.navigationBar.tintColor = navbarColor;
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

- (BOOL)hasRetinaDisplay
{
    if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)] && [[UIScreen mainScreen] scale] == 2)
        return YES;
    else
        return NO;
}

@end
