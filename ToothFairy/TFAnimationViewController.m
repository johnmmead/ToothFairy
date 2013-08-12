//
//  TFAnimationViewController.m
//  ToothFairy
//
//  Created by John Mead on 8/11/13.
//  Copyright (c) 2013 sevendesign. All rights reserved.
//

#import "TFAnimationViewController.h"

@interface TFAnimationViewController ()

@end

@implementation TFAnimationViewController

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
	// Do any additional setup after loading the view.
    
    // Don't want to see the navigation bar from here on
    self.navigationController.navigationBar.hidden = YES;
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    
    // The animation completes, we automatically move on after the timer ends.
    [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(segue) userInfo:nil repeats:NO];
    
}

- (void)segue{
    // perform segue
    [self performSegueWithIdentifier:@"resultsViewController" sender:self];
}

@end
