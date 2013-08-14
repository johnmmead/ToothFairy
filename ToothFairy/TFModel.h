//
//  TFModel.h
//  ToothFairy
//
//  Created by John Mead on 8/1/13.
//  Copyright (c) 2013 sevendesign. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TFModel : NSObject

@property (strong, nonatomic) NSString *gender;
@property (strong, nonatomic) NSString *state;
@property (strong, nonatomic) NSString *education;
@property (strong, nonatomic) NSString *maritalStatus;
@property (assign, nonatomic) NSInteger familySize;
@property (assign, nonatomic) NSInteger age;
@property (assign, nonatomic) NSInteger income;
@property (assign, nonatomic) int finalAmount;

@end
