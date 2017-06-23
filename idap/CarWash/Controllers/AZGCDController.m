//
//  AZGCDController.m
//  idap
//
//  Created by Aleksey Zuiev on 23/06/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "AZGCDController.h"


static const double AZSleepInterwal = 3.0;

@interface AZGCDController ()
@property (nonatomic, copy)     AZBlock block;
@property (nonatomic, assign)   BOOL    running;

@property (nonatomic, retain)   dispatch_queue_t    queue;

@end

@implementation AZGCDController

#pragma mark -
#pragma mark Initialization and Deallocation

- (void)dealloc {
    self.block = nil;
    dispatch_release(self.queue);
    self.queue = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    
    self.queue = dispatch_queue_create("queue", DISPATCH_QUEUE_SERIAL);
    
    return self;
}

- (instancetype)initWithBlock:(void(^)())block {
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
#pragma mark Public

- (void)start {
    self.running = true;
}

- (void)stop {
    self.running = false;
}

- (void)performBlock {
    dispatch_queue_t queue = self.queue;
    dispatch_release(queue);
    
    AZBlock block = self.block;
    
    if (!block) {
        return;
    }
    
    dispatch_async(queue, ^ {
        while (self.running) {
            sleep(AZSleepInterwal);
                
            block();
        }
    });
}

@end
