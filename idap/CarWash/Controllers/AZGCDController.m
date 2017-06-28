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

@interface AZGCDController ()

@property (nonatomic, retain)   dispatch_queue_t    queue;

@end

@implementation AZGCDController

#pragma mark -
#pragma mark Initialization and Deallocation

- (void)dealloc {
    [AZGCD releaseDispatchObject:self.queue];
    self.queue = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    
    self.queue = [AZGCD createSerialQueue:@"queue"];
    
    return self;
}

#pragma mark -
#pragma mark Override methods

- (void)start {
    [self performBlock];
}

#pragma mark -
#pragma mark Private

- (void)performBlock {
    dispatch_queue_t queue = self.queue;
    
    AZBlock block = self.block;
    
    if (!block) {
        return;
    }
    
    [AZGCD dispatchAsyncWith:queue block: ^ {
        if (self.running) {
            block();
            
            [AZGCD dispatchAfterDelay:AZSleepInterval queue:queue block:^ {
                [self performBlock];
            }];

        }
    }];
}


@end
