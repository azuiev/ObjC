//
//  AZDispatcher.m
//  idap
//
//  Created by Aleksey Zuiev on 17/06/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "AZDispatcher.h"

#import "AZEmployee.h"

#import "AZObservableObject.h"
#import "AZQueue.h"

#import "NSObject+AZExtension.h"

@interface AZDispatcher ()
@property (nonatomic, retain) AZQueue       *handlersQueue;
@property (nonatomic, retain) NSMutableSet  *mutableHandlers;
@property (nonatomic, retain) AZQueue       *processedObjectsQueue;

- (void)startProcessing;
- (void)addProcessedObjectToQueue:(id<AZMoneyFlow>)object;

@end

@implementation AZDispatcher

@dynamic processedObjects;
@dynamic handlers;

#pragma mark -
#pragma mark Initialization and Deallocation

- (void)dealloc {
    self.mutableHandlers = nil;
    self.handlersQueue = nil;
    self.processedObjectsQueue = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.mutableHandlers = [NSMutableSet set];
        self.handlersQueue = [AZQueue object];
        self.processedObjectsQueue = [AZQueue object];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSSet *)handlers {
    @synchronized (self) {
        return [[self.mutableHandlers retain] autorelease];
    }
}

- (NSArray *)processedObjects {
    @synchronized (self) {
        return self.processedObjectsQueue.queue;
    }
}

#pragma mark -
#pragma mark Public

- (void)takeObjectForProcessing:(id<AZMoneyFlow>)object {
    @synchronized (self) {
        [self addProcessedObjectToQueue:object];
        [self startProcessing];
    }
}

- (void)addHandler:(id<AZHandlerDispatcher>)handler {
    @synchronized (self) {
        [(AZObservableObject *)handler addObserver:self];
        
        [self.mutableHandlers addObject:handler];
        [self.handlersQueue enqueueObject:handler];
    }
}

- (void)addHandlersFromArray:(NSArray *)handlers {
    for (id<AZHandlerDispatcher> handler in handlers) {
        [self addHandler:handler];
    }
}

- (void)removeHandler:(id<AZHandlerDispatcher>)handler {
    @synchronized (self) {
        [(AZObservableObject *)handler removeObserver:self];
        [self.mutableHandlers removeObject:handler];
    }
}

- (void)removeHandlersWithArray:(NSArray *)handlers {
    for (id<AZHandlerDispatcher> handler in handlers) {
        [self removeHandler:handler];
    }
}

#pragma mark -
#pragma mark Private

- (void)addProcessedObjectToQueue:(id<AZMoneyFlow>)object {
    [self.processedObjectsQueue enqueueObject:(id)object];
}

- (void)startProcessing {
    @synchronized (self) {
        id<AZHandlerDispatcher> handler = [self.handlersQueue dequeueObject];
        if (handler) {
            id<AZHandlerDispatcher> object = [self.processedObjectsQueue dequeueObject];
            
            if (object) {
                [handler processObject:object];
            } else {
                [self.handlersQueue enqueueObject:handler];
            }
        }
    }
}

#pragma mark -
#pragma mark AZHandlerDispatcher

- (void)handlerBecameReadyToWork:(id<AZHandlerDispatcher>)handler {
    @synchronized (self) {
        if([self.handlers containsObject:handler]) {
            [self.handlersQueue enqueueObject:handler];
            [self startProcessing];
        }
    }
}

- (void)handlerBecameFinishWorking:(id<AZHandlerDispatcher>)handler {
    @synchronized (self) {
        if (![self.handlers containsObject:handler]) {
            [self takeObjectForProcessing:handler];
        }
    }
}

@end
