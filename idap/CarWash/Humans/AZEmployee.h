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
    AZEmployeeFree,
    AZEmployeeBusy
};

@protocol AZEmployeeObserver <NSObject>

@optional
- (void)employeeDidBecameFree:(AZEmployee *)employee;
- (void)employeeDidBecameBusy:(AZEmployee *)employee;

@end

@interface AZEmployee : AZObservableObject <AZMoneyFlow, AZEmployeeObserver>
@property (nonatomic, copy)     NSString        *name;
@property (nonatomic, assign)   NSUInteger      salary;
@property (nonatomic, assign)   NSUInteger      experience;

- (void)sayHi;
- (void)processObject:(id<AZMoneyFlow>)object;

//method to override. Do not call this method
- (void)performOperationWithObject:(id<AZMoneyFlow>)object;

@end
