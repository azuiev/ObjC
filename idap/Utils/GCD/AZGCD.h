//
//  AZGCD.h
//  idap
//
//  Created by Aleksey Zuiev on 27/06/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AZGCD : NSObject

+ (void)dispatchSyncWith:(id<OS_dispatch_queue>)queue block:(void(^)())block;
+ (void)dispatchAsyncWith:(id<OS_dispatch_queue>)queue block:(void(^)())block;

+ (void)dispatchSyncOnMainQueue:(void(^)())block;
+ (void)dispatchAsyncOnMainQueue:(void(^)())block;

+ (void)dispatchAfterDelay:(NSUInteger)delay queue:(id<OS_dispatch_queue>)queue block:(void(^)())block;

+ (id)createConcurrentQueue:(NSString *)label;
+ (id)createSerialQueue:(NSString *)label;

+ (void)releaseDispatchObject:(id<OS_dispatch_object>)queue;

@end
