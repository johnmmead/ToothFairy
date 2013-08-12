//
//  TFResultsViewController.m
//  ToothFairy
//
//  Created by John Mead on 8/11/13.
//  Copyright (c) 2013 sevendesign. All rights reserved.
//

#import "TFResultsViewController.h"

@interface TFResultsViewController ()

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
    
    // Don't want to see the navigation bar from here on
    self.navigationController.navigationBar.hidden = YES;
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [TFBaseViewController pingSound];}

- (IBAction)shareClick:(id)sender {
    NSString *shareString = @"I'm playing with the Tooth Fairy app!";
    UIImage *shareImage = [UIImage imageNamed:@"buttonFairyBarButton.png"];
    NSURL *shareUrl = [NSURL URLWithString:@"https://itunes.apple.com/us/app/tooth-fairy-calculator"];
    NSArray *activityItems = [NSArray arrayWithObjects:shareString, shareImage, shareUrl, nil];
    UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:nil];
    activityViewController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self presentViewController:activityViewController animated:YES completion:nil];}

@end
