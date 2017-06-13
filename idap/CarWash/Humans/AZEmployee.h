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

@class AZEmployee;

typedef NS_ENUM(NSUInteger, AZEmployeeState) {
    AZEmployeeReadyToWork,
    AZEmployeeWorking,
    AZEmployeeRequiredProcessing
};

@protocol AZEmployeeObserver <NSObject>

@optional
- (void)employeeBecameReadyToWork:(AZEmployee *)employee;
- (void)employeeDidStartWorking:(AZEmployee *)employee;
- (void)employeeBecameRequiredProcessing:(AZEmployee *)employee;

@end

@interface AZEmployee : AZObservableObject <AZMoneyFlow, AZEmployeeObserver>
@property (nonatomic, copy)     NSString    *name;
@property (nonatomic, assign)   NSUInteger  salary;
@property (nonatomic, assign)   NSUInteger  experience;
@property (nonatomic, retain)   AZQueue     *employeesQueue;

- (void)imitateWorkingProcess;
- (void)processObject:(id<AZMoneyFlow>)object;

//overload points. With default implementation
- (void)processObjectInBackgroundThread:(id<AZMoneyFlow>)object;
- (void)finishProcessing:(id<AZMoneyFlow>)object;
- (void)finishProcessing;

//methods to override. Do not call this method directly
- (void)performOperationWithObject:(id<AZMoneyFlow>)object;

@end
