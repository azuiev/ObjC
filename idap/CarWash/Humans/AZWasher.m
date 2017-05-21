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
#pragma mark Public

- (void)washCar:(AZCar *)car{
    car.state = AZCleanCar;
    NSLog(@"%@ wash the %@\n", self, car);
}

#pragma mark -
#pragma mark Private

- (void)performOperationWithObject:(AZCar  *)car {
    [self washCar:(AZCar *)car];
}

@end
