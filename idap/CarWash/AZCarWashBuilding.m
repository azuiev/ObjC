//
//  AZCarWashBuilding.m
//  idap
//
//  Created by Aleksey Zuiev on 28/04/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "AZCarWashBuilding.h"

@implementation AZCarWashBuilding

- (void)washCarsBy:(NSArray *)cars washer:(AZWasher *)washer accountant:(AZAccountant *)accountant director:(AZDirector *)director{
    for (AZCar *car in cars) {
        [washer washCar:car];
    }
    [accountant takeMoneyFromWasher:[washer passMoneyToAccountant]];
    [accountant calculateMoney];
    [director takeIncomeFromAccountant:[accountant passIncomeToDirector]];
}

@end
