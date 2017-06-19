//
//  AZWashController.m
//  idap
//
//  Created by Aleksey Zuiev on 01/06/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "AZController.h"

#import "NSTimer+AZWeakReferenceTimer.h"

static const double AZTimerInterwal = 3.0;

@interface AZController ()
@property (nonatomic, retain)   NSTimer *timer;
@property (nonatomic, copy)     AZBlock block;
@property (nonatomic, assign)   BOOL    running;

@end

@implementation AZController

#pragma mark -
#pragma mark Initialization and Deallocation

- (void)dealloc {
    [self.timer invalidate];
    
    self.timer = nil;
    self.block = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    
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
- (void)start {
    self.running = true;
}

- (void)stop {
    self.running = false;
}

#pragma mark -
#pragma mark Accessors

- (void)setRunning:(BOOL)running {
    @synchronized (self) {
        if (_running != running) {
            _running = running;
            [self updateTimer];
        }
    }
}

#pragma mark -
#pragma mark Private

- (void)updateTimer {
    @synchronized (self) {
        if (self.running) {
            self.timer = [NSTimer scheduledTimerWithTimeInterval:AZTimerInterwal
                                             weakReferenceTarget:self
                                                        selector:@selector(onTick)
                                                        userInfo:nil
                                                         repeats:NO];
        } else {
            [self.timer invalidate];
            self.timer = nil;
        }
    }
}

- (void)onTick {
    if (self.running) {
        AZBlock block = self.block;
        if (!block) {
            return;
        }
        
        block();
    }
}

@end
