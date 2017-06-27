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
@property (nonatomic, retain)   dispatch_queue_t    queue1;

@end

@implementation AZGCDController

#pragma mark -
#pragma mark Initialization and Deallocation

- (void)dealloc {
    [AZGCD releaseDispatchObject:self.queue];
    self.queue = nil;
    self.queue1 = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    
    self.queue = [AZGCD createSerialQueue:@"queue"];
    self.queue1 = [AZGCD createSerialQueue:@"queue"];
    
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
    dispatch_queue_t queue1 = self.queue1;
    dispatch_release(queue);
    dispatch_release(queue1);
    
    AZBlock block = self.block;
    
    if (!block) {
        return;
    }
    
    [AZGCD dispatchAsyncWith:queue block: ^ {
        while (self.running) {
            [AZGCD dispatchAfterDelay:AZSleepInterval block:block queue:queue1];
            sleep(AZSleepInterval);
        }
    }];
}


@end
