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
- (IBAction)shareClick:(id)sender;
@property (strong, nonatomic) IBOutlet UIImageView *starUpperLeft;
@property (strong, nonatomic) IBOutlet UIImageView *fairy;
@property (strong, nonatomic) IBOutlet UILabel *toothValue;
@property (strong, nonatomic) IBOutlet UIImageView *disclaimer;
@property (strong, nonatomic) IBOutlet UIImageView *planet;
@property (strong, nonatomic) IBOutlet UIImageView *starLarge;
@property (strong, nonatomic) IBOutlet UIImageView *starMedium;
@property (strong, nonatomic) IBOutlet UIImageView *starLowerLeft;
@property (strong, nonatomic) IBOutlet UIButton *whyButton;
@property (strong, nonatomic) IBOutlet UIButton *shareButton;
@property (strong, nonatomic) IBOutlet UIImageView *toothFairyWording;
@property (strong, nonatomic) IBOutlet UIImageView *bewm;

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
    
    // final value presentation
    self.toothValue.font = [UIFont fontWithName:@"Baskerville-Bold" size:28.0];
    self.toothValue.textColor = [UIColor whiteColor];
    self.toothValue.text = [NSString stringWithFormat:@"$%d.00", [self model].finalAmount];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

- (void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    
    // set most everything invisible except for the disclaimer to start
    self.fairy.alpha = 0.0;
    self.starLarge.alpha = 0.0;
    self.starMedium.alpha = 0.0;
    self.starUpperLeft.alpha = 0.0;
    self.whyButton.alpha = 0.0;
    self.shareButton.alpha = 0.0;
    self.toothValue.alpha = 0.0;
    self.planet.alpha = 0.0;
    self.toothFairyWording.alpha= 0.0;
    self.bewm.alpha= 0.0;
    
    // little planet pulses from the get go, little star in lower left twinkles
    [self pulsateSlowly:self.planet];
    [self twinkleQuickly:self.starLowerLeft];
    
    // the tooth fairy starts flying around the screen
    
    // set a timer for ten seconds - when it's done, start showing and animating
    // the assets that were turned off for first ten seconds
    [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(startAnimations) userInfo:nil repeats:NO];
}

- (void)startAnimations{
    
    // fade out the disclaimer
    [UIView animateWithDuration:1.0 animations:^{
        [self.disclaimer setAlpha:0.0];
    }];
    
    // turn on some stars
    [UIView animateWithDuration:2.0 animations:^{
        [self.starMedium setAlpha:1.0];
    }];
    [UIView animateWithDuration:0.5 animations:^{
        [self.starUpperLeft setAlpha:1.0];
    }];
    
    // animating stars
    [self twinkleTwinkle:self.starLarge];
    [self pulsateSlowly:self.starMedium];
    [self faintGlow:self.starUpperLeft];
    
    // fairy goes from tiny to huge - when that ends show the ammount,
    // then fade in the buttons at the bottom
    [self animateFairy];
    
}

- (void)animateFairy {
    [self scaleFairy];
}

- (void)scaleFairy {
    [self.fairy setAlpha:0.0];
    [UIView animateWithDuration:1.37 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        [self.fairy setTransform:CGAffineTransformMakeScale(13.0 , 13.0)];
        self.fairy.alpha = 0.65;
    } completion:^(BOOL finished) {
        if (finished) {
            [TFBaseViewController fairyAppearsSound];
            [self scaleBack];
        }
    }];
}

- (void)scaleBack {
    [UIView animateWithDuration:0.33
                          delay:0
                        options:UIViewAnimationOptionCurveLinear animations:^{
        [self.fairy setTransform:CGAffineTransformMakeScale(7.3 , 7.3)];
    } completion:^(BOOL finished) {
        if (finished) {
            self.fairy.alpha = 1.0;
            [self showMeTheMoney];
        }
    }];
}

- (void)showMeTheMoney{
    [UIView animateWithDuration:1.5 animations:^{
        [self.toothValue setAlpha: 1.0];
        [self blowMeUp];
    } completion:^(BOOL finished) {
        [self pulsateStrong:self.toothValue];
        [TFBaseViewController dingSound];
        [self fadeButtonsBack];
    }];
}

- (void)blowMeUp{
    [UIView animateWithDuration:1.0
                          delay:0.13
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         [self.bewm setAlpha:1.0];
                     } completion:^(BOOL finished) {
                        [UIView animateWithDuration:.33 animations:^{
                            [self.bewm setAlpha:0.0];
                        }];
                     }];
}

- (void)fadeButtonsBack{
    [UIView animateWithDuration:1.5 animations:^{
        [self.whyButton setAlpha:1.0];
        [self.shareButton setAlpha:1.0];
        [self.toothFairyWording setAlpha:1.0];
    }];
}

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
