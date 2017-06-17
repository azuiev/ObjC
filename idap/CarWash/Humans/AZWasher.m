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
    NSLog(@"%@ start wash the %@\n", self, car);
    
    [self imitateWorkingProcess];
    
    NSLog(@"%@ finish wash the %@\n", self, car);
}

#pragma mark -
#pragma mark Private

- (void)performOperationWithObject:(AZCar *)car {
    [self washCar:car];
}

#pragma mark -
#pragma mark Override

- (void)processObjectInBackgroundThread:(AZCar *)car {
    [self performOperationWithObject:car];
    [self takeMoneyFromObject:car];
}

- (void)finishProcessing:(id<AZMoneyFlow>)car {
    [(AZCar *)car setState:AZCarClear];
}
@end
