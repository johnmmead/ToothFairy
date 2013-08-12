//
//  TFBaseViewController.h
//  ToothFairy
//
//  Created by John Mead on 8/1/13.
//  Copyright (c) 2013 sevendesign. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TFModel.h"
#import "TFCell.h"

@interface TFBaseViewController : UIViewController

- (TFModel *)model;
- (BOOL)hasRetinaDisplay;
- (UIImageView *)checkmark;
- (TFCell *)decorateCell:(TFCell *)cell forIndex:(int)index;
- (UITableView *)configureTable:(UITableView *)table forController:(id)controller;
- (void)clearModel;
- (void) playSound:(NSString *)soundName;
+ (void)nukSound;
+ (void)pingSound;

@property (strong, nonatomic) NSArray* selections;

@end
