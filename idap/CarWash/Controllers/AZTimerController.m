//
//  AZWashController.m
//  idap
//
//  Created by Aleksey Zuiev on 01/06/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "AZTimerController.h"

#import "NSTimer+AZWeakReferenceTimer.h"

static const double AZTimerInterwal = 3.0;

@interface AZTimerController ()
@property (nonatomic, retain)   NSTimer *timer;

@end

@implementation AZTimerController

#pragma mark -
#pragma mark Initialization and Deallocation

- (void)dealloc {
    [self.timer invalidate];
    
    self.timer = nil;
    
    [super dealloc];
}

#pragma mark -
#pragma mark Private

- (void)start {
    @synchronized (self) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:AZTimerInterwal
                                         weakReferenceTarget:self
                                                    selector:@selector(onTick)
                                                    userInfo:nil
                                                     repeats:YES];
    }
}
    
- (void)stop {
    @synchronized (self) {
        [self.timer invalidate];
        self.timer = nil;
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
