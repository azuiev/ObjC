//
//  AZWasher.m
//  idap
//
//  Created by Aleksey Zuiev on 26/04/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "AZWasher.h"

@implementation AZWasher

#pragma mark -
#pragma mark Initialization

- (instancetype)init {
    [super init];
    self.moneyFromCars = 0;
    return self;
}

#pragma mark -
#pragma mark Public methods

- (void)washCar:(AZCar *)car {
    [car setIsClear:TRUE];
    self.moneyFromCars += [car payForClearing];
    NSLog(@"%@ is now clear\n", car);
}

- (float)passMoneyToAccountant {
    float result = self.moneyFromCars;
    self.moneyFromCars = 0;
    NSLog(@"%@ %@ passed %5.2f dollars to accountant\n", [self class], self.name, result);
    return result;
}

@end
