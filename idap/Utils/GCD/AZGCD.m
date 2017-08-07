//
//  AZGCD.m
//  idap
//
//  Created by Aleksey Zuiev on 27/06/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "AZGCD.h"

@implementation AZGCD

#pragma mark -
#pragma mark Queue getters
const uint AZMilisecondsInSecond = 1000000;

+ (dispatch_queue_t)dispatchGetMainQueue {
    return dispatch_get_main_queue();
}

+ (dispatch_queue_t)dispatchGetBackgroundQueue {
    return dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0);
}

+ (dispatch_queue_t)dispatchGetQueueWithQOS:(dispatch_qos_class_t)QOSClass {
    return dispatch_get_global_queue(QOSClass, 0);
}

#pragma mark -
#pragma mark Sync/Async methods

+ (void)dispatchSyncOnBackground:(void(^)())block {
    [self dispatchSyncOnQueue:[self dispatchGetBackgroundQueue] block:block];
}

+ (void)dispatchAsyncOnBackground:(void(^)())block {
    [self dispatchAsyncOnQueue:[self dispatchGetBackgroundQueue] block:block];
}

+ (void)dispatchSyncOnMainQueue:(void(^)())block {
    [self dispatchSyncOnQueue:[self dispatchGetMainQueue] block:block];
}

+ (void)dispatchAsyncOnMainQueue:(void(^)())block {
    [self dispatchAsyncOnQueue:[self dispatchGetMainQueue] block:block];
}

+ (void)dispatchSyncOnQueue:(dispatch_queue_t)queue block:(void (^)())block {
    [self dispatchWithFlag:YES queue:queue block:block];
}

+ (void)dispatchAsyncOnQueue:(dispatch_queue_t)queue block:(void (^)())block {
    [self dispatchWithFlag:NO queue:queue block:block];
}

+ (void)dispatchWithFlag:(BOOL)sync queue:(dispatch_queue_t)queue block:(void (^)())block {
    if (block) {
        if (sync) {
            dispatch_sync(queue, block);
        } else {
            dispatch_async(queue, block);
        }
    }
}

#pragma mark -
#pragma mark Dispatch after

+ (void)dispatchAfterDelay:(double)delay block:(void(^)())block{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)), [self dispatchGetBackgroundQueue], block);
}

+ (void)dispatchAfterDelay:(double)delay withCondition:(BOOL(^)())condition block:(void(^)())block {
    if (condition()) {
        [self dispatchAfterDelay:delay block:^ {
            block();
            usleep(delay * AZMilisecondsInSecond);
            [self dispatchAfterDelay:delay withCondition:condition block:block];
        }];
    }
}

#pragma mark -
#pragma mark Dispatch release

+ (void)releaseDispatchObject:(id<OS_dispatch_object>)object {
    dispatch_release(object);
}

@end
