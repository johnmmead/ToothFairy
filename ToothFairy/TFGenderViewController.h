//
//  TFGenderViewController2.h
//  ToothFairy
//
//  Created by John Mead on 8/10/13.
//  Copyright (c) 2013 sevendesign. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TFBaseViewController.h"

@interface TFGenderViewController : TFBaseViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *table;
@property (strong, nonatomic) IBOutlet UILabel *mainTitle;

@end
