//
//  TFBaseViewController.h
//  ToothFairy
//
//  Created by John Mead on 8/1/13.
//  Copyright (c) 2013 sevendesign. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TFModel.h"

@interface TFBaseViewController : UIViewController

- (TFModel *)model;
- (BOOL)hasRetinaDisplay;
- (UIImageView *)checkmark;

@property (strong, nonatomic) NSArray* selections;

@end
