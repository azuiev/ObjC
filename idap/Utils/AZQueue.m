//
//  AZQueue.m
//  idap
//
//  Created by Aleksey Zuiev on 24/05/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "AZQueue.h"

@interface AZQueue ()
@property (nonatomic, copy) NSMutableArray *mutableQueue;

@end

@implementation AZQueue

@dynamic queue;

#pragma mark -
#pragma mark Initialization and Deallocations

- (void)dealloc {
    self.mutableQueue = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    self.mutableQueue = [NSMutableArray array];
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setMutableQueue:(NSMutableArray *)queue {
    
    if ( _mutableQueue != queue ) {
        [_mutableQueue release];
        _mutableQueue = [queue mutableCopy];
    }
    
    return;
}

#pragma mark -
#pragma mark Public

- (void)enqueue:(id)object {
    if (!object) {
        NSLog(@"%@", NSInvalidArgumentException);
    }
    
    [self.mutableQueue addObject:object];
}

- (id)dequeue {
    id result = [self.mutableQueue firstObject];
    if (result) {
        [self.mutableQueue removeObjectAtIndex:0];
    } else {
        NSLog(@"No objects in Queue");
    }
    
    return [[result retain] autorelease];
}

- (NSArray *)queue {
    return [[self.mutableQueue copy] autorelease];
}

@end
