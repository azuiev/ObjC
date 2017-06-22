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
    NSLog(@"%@ calculate money. %lu dollars ", self, self.money);
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
            if (AZHandlerFinishWorking == state && self.employeesQueue.count) {
                _state = AZHandlerReadyToWork;
                [self processObservableObject];
                
                return;
            }
            
            _state = state;
            
            [self notifyOfStateWithSelector:[self selectorForState:state]];
        }
    }
}

@end
