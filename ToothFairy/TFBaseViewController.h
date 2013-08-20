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
#import "TFTopCell.h"

@interface TFBaseViewController : UIViewController

- (TFModel *)model;
- (BOOL)hasRetinaDisplay;
- (UIImageView *)checkmark;
- (TFCell *)decorateCell:(TFCell *)cell forIndex:(int)index;
- (TFTopCell *)decorateTopCell:(TFTopCell *)cell forIndex:(int)index;
- (UITableView *)configureTable:(UITableView *)table forController:(id)controller;
- (void)clearModel;
+ (void)nukSound;
+ (void)pingSound;
+ (void)dingSound;
+ (void)chimesSound;
+ (void)fairyAppearsSound;
+ (void)buttonPressSound;

@property (strong, nonatomic) NSArray* selections;

@end
