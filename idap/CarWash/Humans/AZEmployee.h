//
//  AZHuman.h
//  idap
//
//  Created by Aleksey Zuiev on 26/04/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AZObservableObject.h"
#import "AZMoneyFlow.h"
#import "AZQueue.h"

#import "AZDispatcher.h"

@interface AZEmployee : AZObservableObject <AZMoneyFlow, AZHandlerDispatcher>
@property (nonatomic, copy)     NSString    *name;
@property (nonatomic, assign)   NSUInteger  salary;
@property (nonatomic, assign)   NSUInteger  experience;
@property (nonatomic, retain)   AZQueue     *employeesQueue;

- (void)imitateWorkingProcess;
- (void)processObject:(id<AZMoneyFlow>)object;

//observer
- (void)processObservableObject;
- (void)employeeBecameReadyToWork:(AZEmployee *)employee;
- (void)employeeBecameRequiredProcessing:(AZEmployee *)employee;

//overload points. With default implementation
- (void)processObjectInBackgroundThread:(id<AZMoneyFlow>)object;
- (void)finishProcessing:(id<AZMoneyFlow>)object;
- (void)finishProcessing;

//methods to override. Do not call this method directly
- (void)performOperationWithObject:(id<AZMoneyFlow>)object;

@end
