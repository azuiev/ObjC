//
//  AZGCD.h
//  idap
//
//  Created by Aleksey Zuiev on 27/06/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AZGCD : NSObject

+ (void)dispatchSyncWithBlock:(void(^)())block;
+ (void)dispatchAsyncWithBlock:(void(^)())block;

+ (void)dispatchSyncOnMainQueue:(void(^)())block;
+ (void)dispatchAsyncOnMainQueue:(void(^)())block;

+ (void)dispatchAfterDelay:(NSUInteger)delay block:(void(^)())block;

@end
