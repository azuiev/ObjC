//
//  AZController.m
//  idap
//
//  Created by Aleksey Zuiev on 27/06/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "AZController.h"

#import "NSTimer+AZWeakReferenceTimer.h"

@implementation AZController

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
            
            running ? [self start] : [self stop];
        }
    }
}

#pragma mark -
#pragma mark Methods to override

- (void)start {
    
}

- (void)stop {
    
}


@end
