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
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    
    self.name = [NSString randomNameWithLengthInRange:AZMakeRange(AZMinLengthName, AZMaxLengthName)];
    self.salary = AZRandomNumberInRange(NSMakeRange(AZMinSalary, AZMaxSalary - AZMinSalary + 1));
    self.experience = AZRandomNumberWithMaxValue(AZMaxExperience);
    self.state = AZEmployeeFree;
    [self sayHi];
    
    return self;
}

#pragma mark -
#pragma mark Public

- (void)processObject:(id<AZMoneyFlow>)object {
    [self performSelectorInBackground:@selector(__processObject:) withObject:object];
}

- (void)imitateWorkingProcess {
    usleep((uint32_t)(1000 * AZRandomNumberInRange(AZMakeRange(AZMinDurationOfWork, AZMaxDurationOfWork))));
}


- (void)sayHi {
    NSLog(@"HI! I am %@ - %@, salary - %lu, expirience - %lu", [self class], self.name, self.salary, self.experience);
}

//method to override. Do not call this method
- (void)performOperationWithObject:(id<AZMoneyFlow>)moneySpender {
    
}

- (void)__processObject:(id<AZMoneyFlow>)object {
    self.state = AZEmployeeBusy;
    
    [self takeMoneyFromObject:object];
    [self performOperationWithObject:object];
    
    self.state = AZEmployeeFree;
}

#pragma mark -
#pragma mark AZMoneyFlow

- (void)takeMoneyFromObject:(id<AZMoneyFlow>)moneySpender {
    NSUInteger income = [moneySpender giveMoney];
    self.money += income;
    NSLog(@"%@ take %lu dollars from %@ ", self, income, moneySpender);
}

- (NSUInteger)giveMoney {
    NSUInteger result = self.money;
    self.money = 0;
    NSLog(@"%@ give %lu dollars", self, result);
    
    return result;
}

#pragma mark -
#pragma mark Observer

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
        case AZEmployeeBusy:
            return @selector(employeeDidBecameBusy:);
        
        case AZEmployeeFree:
            return @selector(employeeDidBecameFree:);
            
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
