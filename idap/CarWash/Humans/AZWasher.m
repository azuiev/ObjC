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

- (void)washCar:(AZCar *)car{
    [car setClear:YES];
    NSLog(@"%@ wash the %@\n", self, car);
    [self takeMoney:(id<AZMoneyFlow> *)car];
}

@end
