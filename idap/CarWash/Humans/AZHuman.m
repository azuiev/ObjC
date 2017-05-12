//
//  AZHuman.m
//  idap
//
//  Created by Aleksey Zuiev on 26/04/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "AZHuman.h"
#import "NSString+AZRandomString.h"
#import "NSNumber+AZRandomNumber.h"
#import "NSObject+AZObjectExtension.h"

static const NSUInteger AZMinSalary = 1000;
static const NSUInteger AZMaxSalary = 5000;
static const NSUInteger AZMaxExperience = 50;

static NSString * const AZDescriptionFormatter = @"%@: %@";
static NSUInteger const AZMinLengthName = 3;
static NSUInteger const AZMaxLengthName = 12;

@interface AZHuman ()
@property (nonatomic,assign) NSUInteger money;

+ (NSString *)randomName;
- (void)performSpecificForClassOperation:(id<AZMoneyFlow>)moneySpender;

@end

@implementation AZHuman

#pragma mark -
#pragma mark Initialization and Deallocation

- (void)dealloc {
    self.name = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    
    self.name = [AZHuman randomName];
    self.salary = randomNumberInRange(NSMakeRange(AZMinSalary, AZMaxSalary - AZMinSalary + 1));
    self.experience = randomNumberWithMaxValue(AZMaxExperience);
    [self sayHi];
    
    return self;
}

#pragma mark -
#pragma mark Public methods

- (void)processObject:(id<AZMoneyFlow>)object {
    [self performSpecificForClassOperation:object];
    [self takeMoney:object];
}

- (void)sayHi {
    NSLog(@"HI! I am %@ - %@, salary - %lu, expirience - %lu", [self class], self.name, self.salary, self.experience);
}

#pragma mark -
#pragma mark AZMoneyFlow

- (void)takeMoney:(id<AZMoneyFlow>)moneySpender {
    NSUInteger income = [moneySpender giveMoney:self];
    self.money += income;
    NSLog(@"%@ take %lu dollars from %@ ", self, income, moneySpender);
}

- (NSUInteger)giveMoney:(id<AZMoneyFlow>)moneyReceiver {
    NSUInteger result = self.money;
    self.money = 0;
    NSLog(@"%@ give %lu dollars to %@ ", self, result, moneyReceiver);
    
    return result;
}

#pragma mark -
#pragma mark Description

- (NSString *)description {
    return [NSString stringWithFormat:AZDescriptionFormatter, [self class], self.name];
}

#pragma mark -
#pragma mark Private

- (void)performSpecificForClassOperation:(id<AZMoneyFlow>)moneySpender {
    
}

+ (NSString *)randomName {
    return [[NSString lowercaseStringWithLengthInRange:AZMakeRange(AZMinLengthName, AZMaxLengthName)] capitalizedString];
}

@end
