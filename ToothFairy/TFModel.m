//
//  TFModel.m
//  ToothFairy
//
//  Created by John Mead on 8/1/13.
//  Copyright (c) 2013 sevendesign. All rights reserved.
//

#import "TFModel.h"

@implementation TFModel

@synthesize gender, age, income, education, state, maritalStatus, familySize, finalAmount;


- (int)finalAmount{
    
    float toothValue = 1.0;
    int returnValue = 1;
    
    NSMutableDictionary *finalValues = [[NSMutableDictionary alloc]init];
    
    // gender
    if ([self.gender isEqualToString:@"Male"]){
        [finalValues setValue:@4.8F forKey:@"gender"];
    } else {
        [finalValues setValue:@3.5F forKey:@"gender"];
    }
    
    // age - varies depending on group
    if(self.age < 17 && self.age < 25) {
        [finalValues setValue:@5.2F forKey:@"age"];
    } else if(self.age >= 25 && self.age < 35) {
        [finalValues setValue:@3.9F forKey:@"age"];
    } else if(self.age >= 35 && self.age < 50) {
        [finalValues setValue:@3.9F forKey:@"age"];
    } else if(self.age >= 50 && self.age < 65) {
        [finalValues setValue:@3.7F forKey:@"age"];
    } else if(self.age >= 65) {
        [finalValues setValue:@4.2F forKey:@"age"];
    }
    
    // marital status
    if([self.maritalStatus isEqualToString:@"Married"]){
        [finalValues setValue:@3.7F forKey:@"marital"];
    } else {
        [finalValues setValue:@4.7F forKey:@"marital"];
    }
    
    // family size
    if(self.familySize == 2){
        [finalValues setValue:@4.1F forKey:@"family"];
    } else if (self.familySize == 3) {
        [finalValues setValue:@4.1F forKey:@"family"];
    } else if (self.familySize == 4) {
        [finalValues setValue:@4.1F forKey:@"family"];
    } else if (self.familySize == 5) {
        [finalValues setValue:@4.2F forKey:@"family"];
    } else if (self.familySize > 5) {
        [finalValues setValue:@4.2F forKey:@"family"];
    }
    
    // income
    if(self.income < 25){
        [finalValues setValue:@4.1F forKey:@"income"];
    } else if (self.income >=25 && self.income < 39.9) {
        [finalValues setValue:@4.3F forKey:@"income"];
    } else if (self.income >=39.9 && self.income < 49.9) {
        [finalValues setValue:@5.1F forKey:@"income"];
    } else if (self.income > 49.9) {
        [finalValues setValue:@3.7F forKey:@"income"];
    } else if (self.income > 75.0) {
        [finalValues setValue:@4.0F forKey:@"income"];
    }
    
    // education
    if([self.education isEqualToString:@"High School"]){
        [finalValues setValue:@4.1F forKey:@"education"];
    } else if ([self.education isEqualToString:@"College"]){
        [finalValues setValue:@4.3F forKey:@"education"];
    } else if ([self.education isEqualToString:@"Graduate School"]){
        [finalValues setValue:@3.6F forKey:@"education"];
    }
    
    // region
    if([[self plusStates] indexOfObject:self.state] != NSNotFound){
        [finalValues setValue:@4.4F forKey:@"region"]; // North East
    } else if ([[self minusStates] indexOfObject:self.state] != NSNotFound){
        [finalValues setValue:@3.8F forKey:@"region"]; // Midwest
    } else {
        [finalValues setValue:@4.2F forKey:@"region"]; // South and West
    }
    
    // add up the values
    for(NSString *key in [finalValues keyEnumerator]){
        NSNumber *num = [finalValues objectForKey:key];
        toothValue += [num floatValue];
    }
    
    // calculate final dollar amount
    toothValue = toothValue / finalValues.count;
    if (toothValue < 3.95){
        returnValue = 1;
    } else if (toothValue >= 3.95 && toothValue < 4.19){
        returnValue = 2;
    } else if (toothValue >= 4.19 && toothValue < 4.43){
        returnValue = 3;
    } else if (toothValue >= 4.43 && toothValue < 4.55){
        returnValue = 4;
    } else if (toothValue > 4.55) {
        returnValue = 5;
    }
    
    return returnValue;
    
}
    
- (NSArray *)plusStates{
    return @[ @"Connecticut", @"Delaware", @"Maine" @"New Hampshire", @"New Jersey", @"New York", @"Pennsylvania", @"Rhode Island", @"Vermont", @"Virginia", @"Washington", @"West Virginia"];
}

- (NSArray *)minusStates{
   return @[@"Arkansas", @"Idaho", @"Illinois", @"Indiana", @"Iowa", @"Kansas", @"Kentucky",  @"Michigan", @"Minnesota", @"Montana", @"Nebraska", @"North Dakota", @"Ohio", @"Oklahoma",  @"South Dakota", @"Utah", @"Wisconsin", @"Wyoming"];
}


@end
