//
//  AZQueue.h
//  idap
//
//  Created by Aleksey Zuiev on 24/05/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AZQueue : NSObject
@property (nonatomic, readonly) NSArray *queue;

- (void)enqueue:(id)object;
- (id)dequeue;
- (NSArray *)queue;
- (NSUInteger)count;

@end
