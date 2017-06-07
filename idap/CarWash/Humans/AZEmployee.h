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
@property (nonatomic, copy)     NSString        *name;
@property (nonatomic, assign)   NSUInteger      salary;
@property (nonatomic, assign)   NSUInteger      experience;

- (void)sayHi;
- (void)imitateWorkingProcess;
- (void)processObject:(id<AZMoneyFlow>)object;

- (void)notifyWith:(NSNumber *)state;

//methods to override. Do not call this methods directly
- (void)performOperationWithObject:(id<AZMoneyFlow>)object;
- (void)__processObject:(id<AZMoneyFlow>)object;

@end
