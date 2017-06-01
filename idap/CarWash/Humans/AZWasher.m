//
//  AZWasher.m
//  idap
//
//  Created by Aleksey Zuiev on 26/04/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "AZWasher.h"

#import "AZCar.h"

@implementation AZWasher

#pragma mark -
#pragma mark Public

- (void)washCar:(AZCar *)car {
    NSLog(@"%@ wash the %@\n", self, car);
    car.state = AZCleanCar;
}

#pragma mark -
#pragma mark Private

- (void)performOperationWithObject:(AZCar *)car {
    [self washCar:car];
}

#pragma mark -
#pragma mark Override

- (void)processObject:(AZCar *)car {
    self.state = AZEmployeeBusy;
    
    [self performOperationWithObject:car];
    [self takeMoneyFromObject:car];
    
    self.state = AZEmployeeFree;
}

@end
