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
    NSLog(@"%@ - %@ wash the %@ - %@\n", [self class], self.name, [car class], car.mark);
}

- (void)takeMoneyFromCar:(double)amount {
    self.moneyFromCars += amount;
    NSLog(@"%@ - %@, receive %5.2f dollars from car\n", [self class], self.name, amount);
}

- (double)passMoneyToAccountant {
    float result = self.moneyFromCars;
    self.moneyFromCars = 0;
    NSLog(@"%@ %@, pass %5.2f dollars to accountant\n", [self class], self.name, result);
    return result;
}

@end
