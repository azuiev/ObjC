//
//  AZAccountant.m
//  idap
//
//  Created by Aleksey Zuiev on 26/04/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "AZAccountant.h"
#import "AZWasher.h"

#import "AZQueue.h"

#import "NSObject+AZExtension.h"

@class AZWasher;

@implementation AZAccountant

@synthesize state = _state;

#pragma mark -
#pragma mark Initialization and deallocation

- (void)dealloc {
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
       
    }
    
    return self;
}

#pragma mark -
#pragma mark Public

- (void)calculateMoney {
    NSLog(@"%@ start calculate money.", self);
    
    [self imitateWorkingProcess];
    
    NSLog(@"%@ finish calculate money. %lu dollars ", self, self.money);
}

#pragma mark -
#pragma mark Public

- (void)processWasher {
    @synchronized (self) {
        if (AZEmployeeReadyToWork == self.state) {
            AZWasher *washer = [self.employeesQueue dequeueObject];
            if (washer) {
                [self processObject:washer];
            }
        }
    }
}

#pragma mark -
#pragma mark Observer

- (void)employeeBecameReadyToWork:(AZEmployee *)employee {
    if ([employee isMemberOfClass:[AZAccountant class]]) {
        [self processWasher];
    }
}

- (void)employeeBecameRequiredProcessing:(AZEmployee *)employee {
    if ([employee isMemberOfClass:[AZAccountant class]]) {
        return;
    }
    
    NSLog(@"%@ notified %@ about finish work", employee, self);

    [self.employeesQueue enqueueObject:employee];
    [self processWasher];
}

#pragma mark -
#pragma mark Private

- (void)performOperationWithObject:(AZWasher *)washer {
    [self calculateMoney];
}

#pragma mark -
#pragma mark Observer

- (void)setState:(NSUInteger)state {
    @synchronized (self) {
        if (state != _state) {
            if (AZEmployeeRequiredProcessing == state && self.employeesQueue.count) {
                _state = AZEmployeeReadyToWork;
                [self processWasher];
                return;
            }
            
            _state = state;
            
            [self notifyOfStateWithSelector:[self selectorForState:state]];
        }
    }
}



@end
