//
//  AZQueue.m
//  idap
//
//  Created by Aleksey Zuiev on 24/05/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "AZQueue.h"

@interface AZQueue ()
@property (nonatomic, retain) NSMutableArray *data;

@end

@implementation AZQueue

@dynamic queue;

#pragma mark -
#pragma mark Initialization and Deallocations

- (void)dealloc {
    self.data = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    self.data = [NSMutableArray array];
    
    return self;
}

#pragma mark -
#pragma mark Public

- (void)enqueue:(id)object {
    if (!object) {
        NSLog(@"%@", NSInvalidArgumentException);
    }
    
    [self.data addObject:object];
}

- (id)dequeue {
    id result = [self.data firstObject];
    if (nil != result) {
        [self.data removeObjectAtIndex:0];
    } else {
        NSLog(@"No objects in Queue");
    }
    
    return result;
}

- (instancetype)queue {
    return [[self.data copy] autorelease];
}

@end
