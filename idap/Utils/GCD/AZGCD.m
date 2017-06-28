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
#pragma mark Public

+ (void)dispatchSyncWith:(id<OS_dispatch_queue>)queue block:(void(^)())block {
    if (block && queue) {
        dispatch_sync(queue, block);
    }
}

+ (void)dispatchAsyncWith:(id<OS_dispatch_queue>)queue block:(void(^)())block {
    if (block && queue) {
        dispatch_async(queue, block);
    }
}

+ (void)dispatchSyncOnMainQueue:(void(^)())block {
    if (block) {
        dispatch_sync(dispatch_get_main_queue(), block);
    }
}

+ (void)dispatchAsyncOnMainQueue:(void(^)())block {
    if (block) {
        dispatch_async(dispatch_get_main_queue(), block);
    }
}

+ (void)dispatchAfterDelay:(NSUInteger)delay queue:(id<OS_dispatch_queue>)queue block:(void(^)())block{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)), queue, block);
}

+ (id)createConcurrentQueue:(NSString *)label  {
    return dispatch_queue_create([label UTF8String], DISPATCH_QUEUE_CONCURRENT);
}

+ (id)createSerialQueue:(NSString *)label  {
    return dispatch_queue_create([label UTF8String], DISPATCH_QUEUE_SERIAL);
}

+ (void)releaseDispatchObject:(id<OS_dispatch_object>)object {
    dispatch_release(object);
}

@end
