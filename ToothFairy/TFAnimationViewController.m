//
//  TFAnimationViewController.m
//  ToothFairy
//
//  Created by John Mead on 8/11/13.
//  Copyright (c) 2013 sevendesign. All rights reserved.
//

#import "TFAnimationViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface TFAnimationViewController ()

@property (strong, nonatomic) IBOutlet UIImageView *fairy;

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
    
}

#pragma - public animation methods


- (void)twinkleTwinkle:(UIView *)littleStar {
    [self rockSlowly:littleStar];
    [self flash:littleStar];
}

- (void)twinkleQuickly:(UIView *)littleStar {
    [self rockQuickly:littleStar];
    [self flashQuickly:littleStar];
}

- (void)pulsateSlowly:(UIView *)graphic {
    [self alphaCycle:graphic];
}

- (void)pulsateStrong:(UIView *)graphic {
    [self alphaCycleStrong:graphic];
}

- (void)faintGlow:(UIView *)graphic {
    [self glowDimly:graphic];
}

- (void)winkInfrequently:(UIView *)view {
    [self wink:view];
}

#pragma - private animation methods


- (void)jiggle:(UIView *)sender {
    [UIView animateWithDuration:0.5 delay:2.0 options:UIViewAnimationOptionAutoreverse | UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionRepeat
                     animations:^{
                         [sender setTransform:CGAffineTransformRotate(sender.transform, M_PI_2)];
                     }completion:nil];
}

- (void)rockSlowly:(UIView *)sender {
    [UIView animateWithDuration:0.25 delay:3.5 options:UIViewAnimationOptionAutoreverse
                     animations:^{
                         [sender setTransform:CGAffineTransformRotate(sender.transform, M_PI_2)];
                     }completion:^(BOOL finished){
                         if (finished) {
                             [self rockSlowly:sender];
                         }
                     }];
}

- (void)rockQuickly:(UIView *)sender {
    [UIView animateWithDuration:0.05 delay:1.5 options:UIViewAnimationOptionAutoreverse
                     animations:^{
                         [sender setTransform:CGAffineTransformRotate(sender.transform, M_PI_2)];
                     }completion:^(BOOL finished){
                         if (finished) {
                             [self rockQuickly:sender];
                         }
                     }];
}

- (void)rotate:(UIView *)sender {
    [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
        [sender setTransform:CGAffineTransformRotate(sender.transform, M_PI_2)];
    }completion:^(BOOL finished){
        if (finished) {
            [self rotate:sender];
        }
    }];
}

- (void)flash:(UIView *)sender {
    [sender setAlpha:0.5];
    [UIView animateWithDuration:.125 delay:1.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         [sender setAlpha:0.85];
            }completion:^(BOOL finished){
                if (finished) {
                    [self flash:sender];
                }
            }
     ];
}

- (void)flashQuickly:(UIView *)sender {
    [sender setAlpha:0.1];
    [UIView animateWithDuration:.125 delay:1.43
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         [sender setAlpha:.23];
                     }completion:^(BOOL finished){
                         if (finished) {
                             [self flashQuickly:sender];
                         }
                     }
     ];
}

- (void)alphaCycle:(UIView *)sender {
    [sender setAlpha:0.3];
    [UIView animateWithDuration:3.0 delay:0 options:UIViewAnimationOptionCurveLinear | UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat   
                     animations:^{
        [sender setAlpha:0.63];
    }completion:nil];
}

- (void)alphaCycleStrong:(UIView *)sender {
    [sender setAlpha:0.45];
    [UIView animateWithDuration:2.5 delay:0 options:UIViewAnimationOptionCurveLinear | UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat
                     animations:^{
                         [sender setAlpha:1.0];
                     }completion:nil];
}


- (void)glowDimly:(UIView *)sender {
    [sender setAlpha:0.02];
    [UIView animateWithDuration:2.0 delay:0 options:UIViewAnimationOptionCurveLinear | UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat
                     animations:^{
                         [sender setAlpha:0.35];
                     }completion:nil];
}

- (void)wink:(UIView *)sender {
    [sender setAlpha:0.0];
    [UIView animateWithDuration:.125 delay:4.0
                        options: UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         [sender setAlpha:.80];
                     }completion:^(BOOL finished){
                         if (finished) {
                             [self wink:sender];
                         }
                     }
     ];
}


@end
