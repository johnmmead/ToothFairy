//
//  TFConstants.m
//  ToothFairy
//
//  Created by John Mead on 8/2/13.
//  Copyright (c) 2013 sevendesign. All rights reserved.
//

#import "TFConstants.h"

@implementation TFConstants

+ (UIColor *) kTickmarkColor  { return [UIColor colorWithRed:0.812 green:0.925 blue:0.945 alpha:1.000]; }

+ (UIColor *) kLavenderTextColor  { return [UIColor colorWithRed:0.675 green:0.733 blue:0.906 alpha:1.000]; }

+ (UIColor *) kMainTitleTextColor  { return [UIColor colorWithRed:0.318 green:0.376 blue:0.600 alpha:1.000]; }

+ (UIImageView *) kCellCheckmarkImage { return [[UIImageView alloc ]
    initWithImage:[UIImage imageNamed:@"cellCheckmark.png"]]; }

+ (NSString *) kCellIdentifier{ return @"Cell"; }


@end
