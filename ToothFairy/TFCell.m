//
//  TFCell.m
//  ToothFairy
//
//  Created by John Mead on 8/8/13.
//  Copyright (c) 2013 sevendesign. All rights reserved.
//

#import "TFCell.h"
#import "TFConstants.h"

@implementation TFCell

-(id)initWithCoder:(NSCoder *)aDecoder
{    
    self = [super initWithCoder: aDecoder];
    if (self)
    {
        self.textLabel.font = [UIFont fontWithName:@"HelveticaRoundedLTStd-Bd" size:22.0f];
        self.textLabel.textColor = [UIColor blackColor];
        self.accessoryType = UITableViewCellAccessoryNone;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
//        UIColor *backgroundPatternColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"backgroundTileBlue"]];
//        self.contentView.backgroundColor = backgroundPatternColor;
//        self.accessoryView.backgroundColor = backgroundPatternColor;
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
//    self.accessoryType = UITableViewCellAccessoryCheckmark;
//    self.accessoryView = [TFConstants kCellCheckmarkImage];
}

@end
