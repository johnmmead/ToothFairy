//
//  TFBaseTableViewController.h
//  ToothFairy
//
//  Created by John Mead on 8/1/13.
//  Copyright (c) 2013 sevendesign. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TFModel.h"

@interface TFBaseTableViewController : UITableViewController

- (TFModel *)model;
- (UIImageView *)checkmark;

@property (strong, nonatomic) NSArray* selections;

@end
