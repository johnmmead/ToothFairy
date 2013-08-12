//
//  TFFamilyViewController.h
//  ToothFairy
//
//  Created by John Mead on 8/11/13.
//  Copyright (c) 2013 sevendesign. All rights reserved.
//

#import "TFBaseViewController.h"

@interface TFFamilyViewController : TFBaseViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *table;
@property (strong, nonatomic) IBOutlet UILabel *mainTitle;

@end
