//
//  AZAccountant.m
//  idap
//
//  Created by Aleksey Zuiev on 26/04/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "AZAccountant.h"

@class AZWasher;

@implementation AZAccountant

#pragma mark -
#pragma mark Public

- (void)calculateMoney {
    NSLog(@"%@ calculate money. %lu dollars ", self, self.money);
}

#pragma mark -
#pragma mark Observer

- (void)employeeDidBecameFree:(AZEmployee *)employee {
    NSLog(@"%@ notified %@ about finish work", employee, self);
    [self processObject:employee];
}

#pragma mark -
#pragma mark Private

- (void)performOperationWithObject:(AZWasher *)washer {
    [self calculateMoney];
}

@end
