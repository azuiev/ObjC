//
//  AZDirector.m
//  idap
//
//  Created by Aleksey Zuiev on 26/04/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "AZDirector.h"

@class AZAccountant;

@implementation AZDirector

@synthesize state = _state;

#pragma mark -
#pragma mark Public

- (void)getIncome {
    NSLog(@"%@ get income - %lu dollars ", self, self.money);
}

#pragma mark -
#pragma mark Private 

- (void)performOperationWithObject:(AZAccountant *)accountant {
    [self getIncome];
}

#pragma mark -
#pragma mark Observer

- (void)setState:(NSUInteger)state {
    @synchronized (self) {
        if (state != _state) {
            state = AZHandlerReadyToWork;
            if (self.employeesQueue.count) {
                [self processObservableObject];
                
                return;
            }
            
            [self notifyOfStateWithSelector:[self selectorForState:state]];
        }
    }
}

@end
