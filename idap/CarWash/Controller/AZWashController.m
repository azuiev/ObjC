//
//  AZWashController.m
//  idap
//
//  Created by Aleksey Zuiev on 01/06/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "AZWashController.h"

#import "AZWasher.h"

@interface AZWashController ()
@property (nonatomic, copy)   AZQueue         *washersQueue;
@property (nonatomic, copy)   AZQueue         *carsQueue;

@end

@implementation AZWashController

@dynamic washers;
@dynamic cars;

#pragma mark -
#pragma mark Initialization and Deallocation

- (void)dealloc {
    self.washersQueue = nil;
    self.carsQueue = nil;
    
    [super dealloc];
}

#pragma mark -
#pragma mark Accessors

- (void)setWashersQueue:(AZQueue *)queue {
    if (_carsQueue != queue) {
        [_washersQueue release];
        _washersQueue = [queue retain];
    }
}

- (void)setCarsQueue:(AZQueue *)queue {
    if (_carsQueue != queue) {
        [_carsQueue release];
        _carsQueue = [queue retain];
    }
}


- (NSArray *)washers {
    return self.washersQueue.queue;
}

- (NSArray *)cars {
    return self.washersQueue.queue;
}

#pragma mark -
#pragma mark AZEmployeeObserver

- (void)employeeDidBecameReadyToWork:(AZWasher *)washer {
    [self.washersQueue enqueue:washer];
}

- (void)employeeDidStartWorking:(AZEmployee *)employee {
    
}

- (void)employeeDidBecameRequiredProcissing:(AZEmployee *)employee {
    
}

@end
