//
//  AZAccountant.m
//  idap
//
//  Created by Aleksey Zuiev on 26/04/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "AZAccountant.h"

@implementation AZAccountant

#pragma mark -
#pragma mark Initialization

- (instancetype)init {
    [super init];
    self.moneyFromWashers = 0;
    return self;
}

#pragma mark -
#pragma mark Public methods

- (void)calculateMoney {
    NSLog(@"%@ - %@, totally income is %5.2f dollars ", [self class] ,self.name, self.moneyFromWashers);
}

- (void)takeMoneyFromWasher:(double) amount {
    self.moneyFromWashers += amount;
    NSLog(@"%@ - %@, receive %5.2f dollars from washer", [self class] ,self.name, self.moneyFromWashers);
}

- (double)passIncomeToDirector {
    double result = self.moneyFromWashers;
    [self setMoneyFromWashers:0];
    NSLog(@"%@ - %@, pass %5.2f dollars to director", [self class] ,self.name, result);
    return result;
}

@end
