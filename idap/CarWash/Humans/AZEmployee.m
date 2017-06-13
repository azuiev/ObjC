//
//  AZHuman.m
//  idap
//
//  Created by Aleksey Zuiev on 26/04/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "AZEmployee.h"

#import "AZRandomNumber.h"

#import "NSString+AZRandomString.h"
#import "NSObject+AZExtension.h"
#import "NSString+AZRandomName.h"

static NSString * const AZDescriptionFormatter = @"%@: %@";

static const NSUInteger AZMinSalary         = 1000;
static const NSUInteger AZMaxSalary         = 5000;
static const NSUInteger AZMaxExperience     = 50;
static const NSUInteger AZMinLengthName     = 3;
static const NSUInteger AZMaxLengthName     = 12;
static const NSUInteger AZMinDurationOfWork = 20;
static const NSUInteger AZMaxDurationOfWork = 100;

@interface AZEmployee ()
@property (nonatomic, assign)   NSUInteger    money;

@end

@implementation AZEmployee

#pragma mark -
#pragma mark Initialization and Deallocation

- (void)dealloc {
    self.name = nil;
    self.employeesQueue = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    
    self.name = [NSString randomNameWithLengthInRange:AZMakeRange(AZMinLengthName, AZMaxLengthName)];
    self.salary = AZRandomNumberInRange(NSMakeRange(AZMinSalary, AZMaxSalary - AZMinSalary + 1));
    self.experience = AZRandomNumberWithMaxValue(AZMaxExperience);
    self.state = AZEmployeeReadyToWork;
    self.employeesQueue = [AZQueue object];
    
    return self;
}

#pragma mark -
#pragma mark Public

- (void)processObject:(id<AZMoneyFlow>)object {
    if (AZEmployeeReadyToWork == self.state) {
        self.state = AZEmployeeWorking;
        
        [self performSelectorInBackground:@selector(processObjectWithChangingState:) withObject:object];
    } else {
        [self.employeesQueue enqueueObject:object];
    }
    
}

- (void)imitateWorkingProcess {
    usleep((uint32_t)(1000 * AZRandomNumberInRange(AZMakeRange(AZMinDurationOfWork, AZMaxDurationOfWork))));
}

//method to override. Do not call this method
- (void)performOperationWithObject:(id<AZMoneyFlow>)moneySpender {
    
}

- (void)processObjectInBackgroundThread:(id<AZMoneyFlow>)object {
    [self takeMoneyFromObject:object];
    [self performOperationWithObject:object];
}

- (void)startProcessingWithObject:(id<AZMoneyFlow>)object {
    self.state = AZEmployeeWorking;
}

- (void)finishProcessing:(id<AZMoneyFlow>)object {
    [(AZEmployee *)object setState:AZEmployeeReadyToWork];
}

- (void)finishProcessing {
    self.state = AZEmployeeRequiredProcessing;
}

- (void)finishProcessingWithObject:(id<AZMoneyFlow>)object {
    [self finishProcessing:object];
    [self finishProcessing];
}

- (void)processObjectWithChangingState:(id<AZMoneyFlow>)object {
    [self processObjectInBackgroundThread:object];
    
    [self performSelectorOnMainThread:@selector(finishProcessingWithObject:)
                           withObject:object
                        waitUntilDone:NO];
}

#pragma mark -
#pragma mark AZMoneyFlow

- (void)takeMoneyFromObject:(id<AZMoneyFlow>)moneySpender {
    @synchronized (self) {
        NSLog(@"%@ take money from %@", self, moneySpender);
        [self takeMoney:[moneySpender giveMoney]];
    }
}

- (NSUInteger)giveMoney {
    @synchronized (self) {
        NSUInteger result = self.money;
        self.money = 0;
        
        NSLog(@"%@ give %lu dollars", self, result);
        
        return result;
    }
}

- (void)takeMoney:(NSUInteger)money {
    @synchronized (self) {
        NSLog(@"%@ take %lu dollars", self, money);
        
        self.money += money;
    }
}

#pragma mark -
#pragma mark Observer

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
        case AZEmployeeWorking:
            return @selector(employeeDidStartWorking:);
        
        case AZEmployeeReadyToWork:
            return @selector(employeeBecameReadyToWork:);
            
        case AZEmployeeRequiredProcessing:
            return @selector(employeeBecameRequiredProcessing:);
            
        default:
            return nil;
    }
}

#pragma mark -
#pragma mark Description

- (NSString *)description {
    return [NSString stringWithFormat:AZDescriptionFormatter, [self class], self.name];
}

@end
