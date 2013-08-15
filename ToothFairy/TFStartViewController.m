//
//  TFStartViewController.m
//  ToothFairy
//
//  Created by John Mead on 8/2/13.
//  Copyright (c) 2013 sevendesign. All rights reserved.
//

#import "TFStartViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface TFStartViewController ()
- (IBAction)click:(id)sender;
@property (strong, nonatomic) IBOutlet UIImageView *fairy;
@property (strong, nonatomic) IBOutlet UIImageView *toothFairy;
@property (strong, nonatomic) IBOutlet UIImageView *starLarge;
@property (strong, nonatomic) IBOutlet UIImageView *starLeft;
@property (strong, nonatomic) IBOutlet UIImageView *planetSmall;
@property (strong, nonatomic) IBOutlet UIImageView *starMedium;
@property (strong, nonatomic) IBOutlet UIImageView *starFaint;
@property (strong, nonatomic) IBOutlet UIImageView *wink;

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
    
    // clear the model- could be returnin from last view controller
    [super clearModel];
    [self.wink setAlpha:0.0];

}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    
    [self startAnimations];
    
}

- (void)startAnimations{
    [self twinkleTwinkle:self.starLarge];
    [self twinkleQuickly:self.starLeft];
    [self pulsateSlowly:self.planetSmall];
    [self pulsateSlowly:self.starMedium];
    [self faintGlow:self.starFaint];
    [self winkInfrequently:self.wink];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)click:(id)sender {
    [TFBaseViewController buttonPressSound];
}


@end
