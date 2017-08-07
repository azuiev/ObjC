//
//  AZGCDController.m
//  idap
//
//  Created by Aleksey Zuiev on 23/06/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "AZGCDController.h"

#import "AZGCD.h"

static const double AZSleepInterval = 3.0;

@implementation AZGCDController

#pragma mark -
#pragma mark Initialization and Deallocation

- (void)dealloc {
    self.block = nil;
    
    [super dealloc];
}

- (instancetype)initWithBlock:(AZBlock)block {
    self = [self init];
    if (self) {
        self.block = block;
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setRunning:(BOOL)running {
    @synchronized (self) {
        if (_running != running) {
            _running = running;
            
            if (running) {
                [self performBlock];
            }
        }
    }
}

#pragma mark -
#pragma mark Private

- (void)performBlock {
    [AZGCD dispatchAsyncOnBackground:^ {
         [AZGCD dispatchAfterDelay:AZSleepInterval
                    withCondition:^BOOL {
                        return self.running;
                    }
                            block:^ {
                                AZBlock block = self.block;
                                
                                if (!block) {
                                    return;
                                }
                                
                                block();
                            }];
        
    }];
}

@end
