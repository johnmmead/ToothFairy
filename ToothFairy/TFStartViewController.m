//
//  TFStartViewController.m
//  ToothFairy
//
//  Created by John Mead on 8/2/13.
//  Copyright (c) 2013 sevendesign. All rights reserved.
//

#import "TFStartViewController.h"

@interface TFStartViewController ()

@end

@implementation TFStartViewController

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
    
    float fontSize = [self hasRetinaDisplay] ? 32.f : 16.0f;
    self.whatIsTheGoingRateLabel.font = [UIFont fontWithName:@"HelveticaRoundedLTStd-Bd" size:fontSize];
    self.whatIsTheGoingRateLabel.textColor = [TFConstants kLavenderTextColor]; //jmead
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
