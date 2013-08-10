//
//  TFDisclaimerViewController.m
//  ToothFairy
//
//  Created by John Mead on 8/10/13.
//  Copyright (c) 2013 sevendesign. All rights reserved.
//

#import "TFDisclaimerViewController.h"

@interface TFDisclaimerViewController ()

@end

@implementation TFDisclaimerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
