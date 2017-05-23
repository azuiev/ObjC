//
//  AZQueue.m
//  idap
//
//  Created by Aleksey Zuiev on 24/05/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "AZQueue.h"

@interface AZQueue ()
@property (nonatomic, copy) NSMutableArray *data;

@end

@implementation AZQueue

@dynamic queue;

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
    }
    
    return result;
}

- (instancetype)queue {
    return [[self.data copy] autorelease];
}

@end
