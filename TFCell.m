//
//  TFCell.m
//  ToothFairy
//
//  Created by John Mead on 8/8/13.
//  Copyright (c) 2013 sevendesign. All rights reserved.
//

#import "TFCell.h"

@implementation TFCell

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder: aDecoder];
    if (self)
    {
//        self.backgroundView.hidden = true;
//        self.contentView.hidden = true;
//        self.accessoryView.hidden = true;
//        self.selectionStyle = UITableViewCellSelectionStyleNone;
//        self.textLabel.font = [UIFont fontWithName:@"Helvetica" size:18.0f];
//        self.textLabel.textColor = [UIColor orangeColor];
//        self.accessoryType = UITableViewCellAccessoryCheckmark;
//        self.accessoryView = [[UIImageView alloc ] initWithImage:[UIImage imageNamed:@"plane.png"]];
    }
    return self;
}

//- (id)initWithCoder:(NSCoder *)aDecoder{
//    self = [super initWithCoder: aDecoder];
//    if (self)
//    {
////        [self.tableView registerNib:[UINib nibWithNibName:@"TFCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:[TFConstants kCellIdentifier]];
//        self = [UINib nibWithNibName:@"TFCell" bundle:[NSBundle mainBundle]];
////        NSArray *nibs = [[NSBundle mainBundle]loadNibNamed:@"TFCell" owner:self options:nil];
////        self = [nibs objectAtIndex:0];
//    }
//    return self;
//}

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
