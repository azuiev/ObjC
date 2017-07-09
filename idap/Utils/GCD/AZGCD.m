//
//  AZGCD.m
//  idap
//
//  Created by Aleksey Zuiev on 27/06/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "AZGCD.h"

static dispatch_queue_t AZAsyncQueue;
static dispatch_queue_t AZSyncQueue;

@implementation AZGCD

#pragma mark -
#pragma mark Public

+ (void)dispatchSyncWithBlock:(void(^)())block {
    if (block) {
        dispatch_sync([self syncQueue], block);
    }
}

+ (void)dispatchAsyncWithBlock:(void(^)())block {
    if (block) {
        dispatch_async([self asyncQueue], block);
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

+ (void)dispatchAfterDelay:(NSUInteger)delay block:(void(^)())block{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)), [self asyncQueue], block);
}

+ (void)releaseDispatchObject:(id<OS_dispatch_object>)object {
    dispatch_release(object);
}

#pragma mark -
#pragma mark Queue getters

+ (dispatch_queue_t)syncQueue {
    if (!AZSyncQueue) {
        AZSyncQueue = dispatch_queue_create("syncQueue", DISPATCH_QUEUE_SERIAL);
    }
    
    return AZSyncQueue;
}

+ (dispatch_queue_t)asyncQueue {
    if (!AZAsyncQueue) {
        AZAsyncQueue = dispatch_queue_create("asyncQueue", DISPATCH_QUEUE_CONCURRENT);
    }
    
    return AZAsyncQueue;
}

@end
