//
//  AZDispatcher.h
//  idap
//
//  Created by Aleksey Zuiev on 17/06/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AZMoneyFlow.h"

@class AZDispatcher;

typedef NS_ENUM(NSUInteger, AZHandlerState) {
    AZHandlerReadyToWork,
    AZHandlerFinishWorking
};

@protocol AZHandlerDispatcher <NSObject>

@optional
- (void)handlerBecameReadyToWork:(id<AZHandlerDispatcher>)handler;
- (void)handlerBecameFinishWorking:(id<AZHandlerDispatcher>)handler;
- (void)processObject:(id<AZHandlerDispatcher>)handler;

@end

@interface AZDispatcher : NSObject
@property (nonatomic, readonly)   NSSet   *handlers;
@property (nonatomic, readonly)   NSSet   *processedObjects;

- (void)takeObjectForProcessing:(id<AZHandlerDispatcher>)object;

- (void)addHandler:(id<AZHandlerDispatcher>)handler;
- (void)addHandlersFromArray:(NSArray *)array;

@end
