//
//  TFAgeViewController.m
//  ToothFairy
//
//  Created by John Mead on 8/2/13.
//  Copyright (c) 2013 sevendesign. All rights reserved.
//

#import "TFAgeViewController.h"
#import "TRSDialScrollView.h"

@interface TFAgeViewController ()  <UIScrollViewDelegate>
- (IBAction)click:(id)sender;

@property (weak, nonatomic) IBOutlet TRSDialScrollView *dialView;

@end

@implementation TFAgeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.mainTitle.text = @"What is\nyour age?";
    self.age.font = [UIFont fontWithName:@"HelveticaRoundedLTStd-Bd" size:45.0f];

    
    [[TRSDialScrollView appearance] setMinorTicksPerMajorTick:10];
    [[TRSDialScrollView appearance] setMinorTickDistance:16];
    
    [[TRSDialScrollView appearance] setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"DialBackground"]]];
    
    [[TRSDialScrollView appearance] setLabelStrokeColor:[UIColor colorWithRed:0.400 green:0.525 blue:0.643 alpha:1.000]];
    [[TRSDialScrollView appearance] setLabelStrokeWidth:0.1f];
    [[TRSDialScrollView appearance] setLabelFillColor:[UIColor whiteColor]];

    [[TRSDialScrollView appearance] setLabelFont:[UIFont fontWithName:@"HelveticaRoundedLTStd-Bd" size:32.0f]];
    
    

    [[TRSDialScrollView appearance] setMinorTickColor:[TFConstants kTickmarkColor]];
    [[TRSDialScrollView appearance] setMinorTickLength:10.0];
    [[TRSDialScrollView appearance] setMinorTickWidth:4.0];
    
    [[TRSDialScrollView appearance] setMajorTickColor:[TFConstants kTickmarkColor]];
    [[TRSDialScrollView appearance] setMajorTickLength:18.0];
    [[TRSDialScrollView appearance] setMajorTickWidth:4.0];
    
    [[TRSDialScrollView appearance] setShadowColor:[UIColor colorWithRed:0.593 green:0.619 blue:0.643 alpha:1.000]];
    [[TRSDialScrollView appearance] setShadowOffset:CGSizeMake(0, 1)];
    [[TRSDialScrollView appearance] setShadowBlur:0.9f];
    
    [_dialView setDialRangeFrom:5 to:100];
    
    _dialView.currentValue = 40;
    _dialView.delegate = self;
    
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
     self.age.text = [NSString stringWithFormat:@"%i", _dialView.currentValue];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{

}

- (IBAction)click:(id)sender {
    [TFBaseViewController buttonPressSound];
}

@end
