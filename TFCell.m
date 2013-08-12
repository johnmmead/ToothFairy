//
//  TFCell.m
//  ToothFairy
//
//  Created by John Mead on 8/8/13.
//  Copyright (c) 2013 sevendesign. All rights reserved.
//

#import "TFCell.h"

@implementation TFCell

@synthesize image, label, dots;

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder: aDecoder];
    if (self)
    {
    }
    return self;
}


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if(self){
    
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
