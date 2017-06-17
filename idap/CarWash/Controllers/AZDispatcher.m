//
//  AZDispatcher.m
//  idap
//
//  Created by Aleksey Zuiev on 17/06/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "AZDispatcher.h"

#import "AZQueue.h"

#import "NSObject+AZExtension.h"

@interface AZDispatcher ()
@property (nonatomic, retain) AZQueue   *handlersQueue;
@property (nonatomic, retain) AZQueue   *processedObjectsQueue;

- (void)startProcessing;
- (void)addProcessedObjectToQueue:(id<AZMoneyFlow> *)object;

@end

@implementation AZDispatcher

@dynamic handlers;
@dynamic processedObjects;

#pragma mark -
#pragma mark Initialization and Deallocation

- (void)dealloc {
    self.handlersQueue = nil;
    self.processedObjectsQueue = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.handlersQueue = [AZQueue object];
        self.processedObjectsQueue = [AZQueue object];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)handlers {
    return self.handlersQueue.queue;
}

- (NSArray *)processedObjects {
    return self.processedObjectsQueue.queue;
}

#pragma mark -
#pragma mark Public

- (void)processObject:(id<AZMoneyFlow> *)object {
    [self addProcessedObjectToQueue:object];
    [self startProcessing];
    
}

#pragma mark -
#pragma mark Private

- (void)addProcessedObjectToQueue:(id<AZMoneyFlow> *)object {
    [self.processedObjectsQueue enqueueObject:(id)object];
}

- (void)startProcessing {
    @synchronized (self) {
        AZEmployee *handler = [self.handlersQueue dequeueObject];
        if (handler) {
            id<AZMoneyFlow> *object = (id<AZMoneyFlow> *)[self.processedObjectsQueue dequeueObject];
            if (object) {
                [self processObject:object];
            } else {
                [self.handlersQueue enqueueObject:handler];
            }
        }
    }
}

#pragma mark -
#pragma mark AZEmployeeObserver

- (void)employeeDidBecameReadyToWork:(AZEmployee *) employee {
    [self.handlersQueue enqueueObject:employee];
    [self startProcessing];
}

@end
