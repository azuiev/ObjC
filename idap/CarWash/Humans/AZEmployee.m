//
//  AZHuman.m
//  idap
//
//  Created by Aleksey Zuiev on 26/04/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "AZEmployee.h"

#import "NSString+AZRandomString.h"
#import "NSObject+AZExtension.h"
#import "NSString+AZRandomName.h"

#import "AZRandomNumber.h"

static const NSUInteger AZMinSalary = 1000;
static const NSUInteger AZMaxSalary = 5000;
static const NSUInteger AZMaxExperience = 50;

static NSString * const AZDescriptionFormatter = @"%@: %@";
static NSUInteger const AZMinLengthName = 3;
static NSUInteger const AZMaxLengthName = 12;

@interface AZEmployee ()
@property (nonatomic, assign) NSUInteger money;

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
    
    self.name = [AZEmployee randomName];
    self.salary = AZRandomNumberInRange(NSMakeRange(AZMinSalary, AZMaxSalary - AZMinSalary + 1));
    self.experience = AZRandomNumberWithMaxValue(AZMaxExperience);
    self.state = AZEmployeeFree;
    [self sayHi];
    
    return self;
}

#pragma mark -
#pragma mark Public methods

- (void)processObject:(id<AZMoneyFlow>)object {
    self.state = AZEmployeeBusy;
    [self takeMoneyFromObject:object];
    [self performSpecificOperation];
    self.state = AZEmployeeFree;
}

- (void)sayHi {
    NSLog(@"HI! I am %@ - %@, salary - %lu, expirience - %lu", [self class], self.name, self.salary, self.experience);
}

//method to override. Do not call this method
- (void)performOperationWithObject:(id<AZMoneyFlow>)moneySpender {
    
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

- (void)takeMoney:(NSUInteger)money {
    self.money += money;
    NSLog(@"%@ recieve %lu dollars", self, money);
}

#pragma mark -
#pragma mark Observer

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
        case AZEmployeeBusy:
            return @selector(employeeDidStartWork:);
        
        case AZEmployeeFree:
            return @selector(employeeDidFinishWork:);
            
        default:
            return nil;
    }
}


#pragma mark -
#pragma mark Description

- (NSString *)description {
    return [NSString stringWithFormat:AZDescriptionFormatter, [self class], self.name];
}

#pragma mark -
#pragma mark Private

+ (NSString *)randomName {
    return [[NSString lowercaseStringWithLengthInRange:AZMakeRange(AZMinLengthName, AZMaxLengthName)] capitalizedString];
}

@end
