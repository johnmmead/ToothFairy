//
//  TFGenderViewController.m
//  ToothFairy
//
//  Created by John Mead on 8/1/13.
//  Copyright (c) 2013 sevendesign. All rights reserved.
//

#import "TFGenderViewController.h"

@interface TFGenderViewController ()

@end

@implementation TFGenderViewController

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
    
    self.mainTitle.font = [UIFont fontWithName:@"Baskerville-SemiBold" size:32.0f];
    self.mainTitle.textColor = [TFConstants kMainTitleTextColor];
    self.mainTitle.text = [@"select your gender" uppercaseString];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
