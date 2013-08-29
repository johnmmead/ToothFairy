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
@property (strong, nonatomic) IBOutlet UILabel *adjusting;

@end

@implementation TFResultsViewController{
}

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
    self.toothValue.font = [UIFont fontWithName:@"Baskerville-Bold" size:72.0];
    self.toothValue.textColor = [UIColor whiteColor];
    self.toothValue.text = [NSString stringWithFormat:@"$%d", [self model].finalAmount];
    
    // adjusted for inflation text
    self.adjusting.font = [UIFont fontWithName:@"HelveticaRoundedLTStd-Bd" size:17.0];
    self.adjusting.textColor = [UIColor whiteColor];
    self.adjusting.text = [self getAdjustingForInflationString];

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
    self.adjusting.alpha = 0.0;
    
    // little planet pulses from the get go, little star in lower left twinkles
    [self pulsateSlowly:self.planet];
    [self twinkleQuickly:self.starLowerLeft];
    
    // the tooth fairy starts flying around the screen
    
    // set a timer for some seconds - when it's done, start showing and animating
    // the assets that were turned off for first ten seconds
    [NSTimer scheduledTimerWithTimeInterval:2.5 target:self selector:@selector(startAnimations) userInfo:nil repeats:NO];
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
    [UIView animateWithDuration:1.99 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
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
        [self.adjusting setAlpha:1.0];
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

- (NSInteger)getYearUserWasEight {
    NSInteger rtnYear;
    NSDate *now = [NSDate date];
    unsigned units = NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit;
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [calendar components:units fromDate:now];
    NSInteger currentYear = [components year];
    NSInteger ageSelected = [self.model age];
    rtnYear = (currentYear - ageSelected) + 8;
    return rtnYear;
}

// Get the amount equal to the calculated amount, based on inflation, when the user was 8
- (float)getCPIDataBasedOnYear {
    // the consumer price index
    NSDictionary*
    cpiDict = [NSDictionary dictionaryWithObjectsAndKeys:
               [NSNumber numberWithFloat:9.8],  @"1913",
               [NSNumber numberWithFloat:10.0], @"1914",
               [NSNumber numberWithFloat:10.1], @"1915",
               [NSNumber numberWithFloat:10.4], @"1916",
               [NSNumber numberWithFloat:11.7], @"1917",
               [NSNumber numberWithFloat:14.0], @"1918",
               [NSNumber numberWithFloat:16.5], @"1919",
               [NSNumber numberWithFloat:19.3], @"1920",
               [NSNumber numberWithFloat:19.0], @"1921",
               [NSNumber numberWithFloat:16.9], @"1922",
               [NSNumber numberWithFloat:16.8], @"1923",
               [NSNumber numberWithFloat:17.3], @"1924",
               [NSNumber numberWithFloat:17.3], @"1925",
               [NSNumber numberWithFloat:17.9], @"1926",
               [NSNumber numberWithFloat:17.5], @"1927",
               [NSNumber numberWithFloat:17.3], @"1928",
               [NSNumber numberWithFloat:17.1], @"1929",
               [NSNumber numberWithFloat:17.1], @"1930",
               [NSNumber numberWithFloat:15.9], @"1931",
               [NSNumber numberWithFloat:14.3], @"1932",
               [NSNumber numberWithFloat:12.9], @"1933",
               [NSNumber numberWithFloat:13.2], @"1943",
               [NSNumber numberWithFloat:13.6], @"1935",
               [NSNumber numberWithFloat:13.8], @"1936",
               [NSNumber numberWithFloat:14.1], @"1937",
               [NSNumber numberWithFloat:14.2], @"1938",
               [NSNumber numberWithFloat:14.0], @"1939",
               [NSNumber numberWithFloat:13.9], @"1940",
               [NSNumber numberWithFloat:14.1], @"1941",
               [NSNumber numberWithFloat:15.7], @"1942",
               [NSNumber numberWithFloat:16.9], @"1943",
               [NSNumber numberWithFloat:17.4], @"1944",
               [NSNumber numberWithFloat:17.8], @"1945",
               [NSNumber numberWithFloat:18.2], @"1946",
               [NSNumber numberWithFloat:21.5], @"1947",
               [NSNumber numberWithFloat:23.7], @"1948",
               [NSNumber numberWithFloat:24.0], @"1949",
               [NSNumber numberWithFloat:23.5], @"1950",
               [NSNumber numberWithFloat:25.4], @"1951",
               [NSNumber numberWithFloat:26.5], @"1952",
               [NSNumber numberWithFloat:26.6], @"1953",
               [NSNumber numberWithFloat:26.9], @"1954",
               [NSNumber numberWithFloat:26.7], @"1955",
               [NSNumber numberWithFloat:26.8], @"1956",
               [NSNumber numberWithFloat:27.6], @"1957",
               [NSNumber numberWithFloat:28.6], @"1958",
               [NSNumber numberWithFloat:29.0], @"1959",
               [NSNumber numberWithFloat:29.3], @"1960",
               [NSNumber numberWithFloat:29.8], @"1961",
               [NSNumber numberWithFloat:30.0], @"1962",
               [NSNumber numberWithFloat:30.4], @"1963",
               [NSNumber numberWithFloat:30.9], @"1964",
               [NSNumber numberWithFloat:31.2], @"1965",
               [NSNumber numberWithFloat:31.8], @"1966",
               [NSNumber numberWithFloat:32.9], @"1967",
               [NSNumber numberWithFloat:34.1], @"1968",
               [NSNumber numberWithFloat:35.6], @"1969",
               [NSNumber numberWithFloat:37.8], @"1970",
               [NSNumber numberWithFloat:39.8], @"1971",
               [NSNumber numberWithFloat:41.1], @"1972",
               [NSNumber numberWithFloat:42.6], @"1973",
               [NSNumber numberWithFloat:46.6], @"1974",
               [NSNumber numberWithFloat:52.1], @"1975",
               [NSNumber numberWithFloat:55.6], @"1976",
               [NSNumber numberWithFloat:58.5], @"1977",
               [NSNumber numberWithFloat:62.5], @"1978",
               [NSNumber numberWithFloat:68.3], @"1979",
               [NSNumber numberWithFloat:77.8], @"1980",
               [NSNumber numberWithFloat:87.0], @"1981",
               [NSNumber numberWithFloat:94.3], @"1982",
               [NSNumber numberWithFloat:97.8], @"1983",
               [NSNumber numberWithFloat:101.9], @"1984",
               [NSNumber numberWithFloat:105.5], @"1985",
               [NSNumber numberWithFloat:109.6], @"1986",
               [NSNumber numberWithFloat:111.2], @"1987",
               [NSNumber numberWithFloat:115.7], @"1988",
               [NSNumber numberWithFloat:121.1], @"1989",
               [NSNumber numberWithFloat:127.4], @"1990",
               [NSNumber numberWithFloat:134.6], @"1991",
               [NSNumber numberWithFloat:138.1], @"1992",
               [NSNumber numberWithFloat:142.6], @"1993",
               [NSNumber numberWithFloat:146.2], @"1994",
               [NSNumber numberWithFloat:150.3], @"1995",
               [NSNumber numberWithFloat:154.4], @"1996",
               [NSNumber numberWithFloat:159.1], @"1997",
               [NSNumber numberWithFloat:161.6], @"1998",
               [NSNumber numberWithFloat:164.3], @"1999",
               [NSNumber numberWithFloat:168.8], @"2001",
               [NSNumber numberWithFloat:177.1], @"2002",
               [NSNumber numberWithFloat:181.7], @"2003",
               [NSNumber numberWithFloat:185.2], @"2004",
               [NSNumber numberWithFloat:190.7], @"2005",
               [NSNumber numberWithFloat:198.0], @"2006",
               [NSNumber numberWithFloat:202.4], @"2007",
               [NSNumber numberWithFloat:211.0], @"2008",
               [NSNumber numberWithFloat:211.1], @"2009",
               [NSNumber numberWithFloat:216.7], @"2010",
               [NSNumber numberWithFloat:220.2], @"2011",
               [NSNumber numberWithFloat:226.7], @"2012",
               [NSNumber numberWithFloat:236.5], @"2013",
               [NSNumber numberWithFloat:242.3], @"2014",
               [NSNumber numberWithFloat:267.3], @"2015",
               [NSNumber numberWithFloat:277.5], @"2016",
               [NSNumber numberWithFloat:289.4], @"2017",
               [NSNumber numberWithFloat:301.5], @"2018",
               nil];

    
    int currentYear = [[[NSCalendar currentCalendar]
                     components:NSYearCalendarUnit fromDate:[NSDate date]]
                    year];
    NSString *currentYearString = [NSString stringWithFormat:@"%i",currentYear];
    NSString *yearEightString = [NSString stringWithFormat:@"%i", [self getYearUserWasEight]];
    
    // ratio
    NSNumber *currentYearCPI = [cpiDict valueForKey:currentYearString];
    NSNumber *eightYearCPI = [cpiDict valueForKey:yearEightString];
    float ratio = ([eightYearCPI floatValue] / [currentYearCPI floatValue]);
    float equivalent = ([self model].finalAmount * ratio);
    return equivalent;
}

- (NSString *)getAdjustingForInflationString{
    NSString *wasWorth = [NSString stringWithFormat:@"$%.02f", [self getCPIDataBasedOnYear]];
    NSString *composed = [NSString stringWithFormat:@"Adjusting for inflation, $%d today\nwas worth %@ in %i.",
                          [self model].finalAmount, wasWorth, [self getYearUserWasEight]];
    return composed;
}

@end
