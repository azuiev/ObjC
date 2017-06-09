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

@interface AZAccountant ()
@property (nonatomic, retain)   AZQueue *washersQueue;

@end

@implementation AZAccountant

#pragma mark -
#pragma mark Initialization and deallocation

- (void)dealloc {
    self.washersQueue = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.washersQueue = [AZQueue object];
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
            AZWasher *washer = [self.washersQueue dequeueObject];
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

    [self.washersQueue enqueueObject:employee];
    [self processWasher];
}

#pragma mark -
#pragma mark Private

- (void)performOperationWithObject:(AZWasher *)washer {
    [self calculateMoney];
}

@end
