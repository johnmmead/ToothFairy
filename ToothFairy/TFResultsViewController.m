//
//  TFResultsViewController.m
//  ToothFairy
//
//  Created by John Mead on 8/11/13.
//  Copyright (c) 2013 sevendesign. All rights reserved.
//

#import "TFResultsViewController.h"

@interface TFResultsViewController ()
- (IBAction)click:(id)sender;

@end

@implementation TFResultsViewController

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
    
    // sound
    [TFBaseViewController fairyAppearsSound];
    
    // Don't want to see the navigation bar from here on
    self.navigationController.navigationBar.hidden = YES;
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    
    // final value
    self.toothValue.font = [UIFont fontWithName:@"Baskerville-Bold" size:28.0];
    self.toothValue.textColor = [UIColor whiteColor];
    self.toothValue.text = [NSString stringWithFormat:@"$%d.00", [self model].finalAmount];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [TFBaseViewController pingSound];}

- (IBAction)shareClick:(id)sender {
    NSString *shareString = @"I just learned the going rate for a tooth in America! Download this Tooth Fairy app and find out now.";
    UIImage *shareImage = [UIImage imageNamed:@"buttonFairyBarButton.png"];
    NSURL *shareUrl = [NSURL URLWithString:@"http://appstore.com/toothfairycalculator"];
    NSArray *activityItems = [NSArray arrayWithObjects:shareString, shareImage, shareUrl, nil];
    UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:nil];
    activityViewController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self presentViewController:activityViewController animated:YES completion:nil];}

- (IBAction)click:(id)sender {
    [TFBaseViewController buttonPressSound];
}

@end
