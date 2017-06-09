//
//  AZQueue.m
//  idap
//
//  Created by Aleksey Zuiev on 24/05/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "AZQueue.h"

@interface AZQueue ()
@property (nonatomic, retain) NSMutableArray    *mutableQueue;

@end

@implementation AZQueue

@dynamic queue;
@dynamic count;

#pragma mark -
#pragma mark Initialization and Deallocations

- (void)dealloc {
    self.mutableQueue = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.mutableQueue = [NSMutableArray array];
    }
    
    return self;
}

#pragma mark -
#pragma mark Public

- (NSUInteger)count {
    return self.mutableQueue.count;
}

- (void)enqueueObject:(id)object {
    @synchronized (self) {
        if (!object) {
            NSLog(@"%@", NSInvalidArgumentException);
            
            return;
        }
        
        [self.mutableQueue addObject:object];
    }
}

- (id)dequeueObject {
    @synchronized (self) {
        id result = [[[self.mutableQueue firstObject] retain] autorelease];
        if (result) {
            [self.mutableQueue removeObjectAtIndex:0];
        } else {
            NSLog(@"No objects in Queue - %@", self);
        }
        
        return result;
    }
}

- (NSArray *)queue {
    return [[self.mutableQueue copy] autorelease];
}

@end
