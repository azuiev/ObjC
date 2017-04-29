//
//  AZCarWashBuilding.m
//  idap
//
//  Created by Aleksey Zuiev on 28/04/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "AZCarWashBuilding.h"

@implementation AZCarWashBuilding

static const NSString *AZDelimeter = @"**********";

- (void)washCarsBy:(NSArray *)cars washer:(AZWasher *)washer accountant:(AZAccountant *)accountant director:(AZDirector *)director{
    for (AZCar *car in cars) {
        [washer washCar:car];
        [washer takeMoneyFromCar:[car payForClearing]];
        NSLog(@"%@",AZDelimeter);
    }
    
    [accountant takeMoneyFromWasher:[washer passMoneyToAccountant]];
    [accountant calculateMoney];
    [director takeIncomeFromAccountant:[accountant passIncomeToDirector]];
}

@end
