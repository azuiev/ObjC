//
//  AZHuman.m
//  idap
//
//  Created by Aleksey Zuiev on 26/04/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "AZHuman.h"
#import "AZRandomString.h"

static const NSUInteger AZMinSalary = 1000;
static const NSUInteger AZMaxSalary = 5000;
static const NSUInteger AZMaxExperience = 50;

extern NSString * const AZDescriptionFormatter;

@interface AZHuman ()
@property (nonatomic,assign) NSUInteger money;
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
    
    self.name = [AZRandomString randomName];
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
    NSLog(@"HI! I am %@ - %@, salary - %4.2f, expirience - %2.1f", [self class], self.name, self.salary, self.experience);
}

#pragma mark -
#pragma mark Implements protocols

- (void)takeMoney:(id<AZMoneyFlow>)moneySpender {
    NSUInteger income = [moneySpender giveMoney:self];
    self.money += income;
    NSLog(@"%@ take %lu dollars from %@ ", self, income, moneySpender);
}

- (double)giveMoney:(id<AZMoneyFlow>)moneyReceiver {
    NSUInteger result = self.money;
    self.money = 0;
    NSLog(@"%@ give %lu dollars to %@ ", self, result, moneyReceiver);
    
    return result;
}

#pragma mark -
#pragma mark Override Methods

- (NSString *)description {
    return [NSString stringWithFormat:AZDescriptionFormatter, [self class], self.name];
}

- (void)performSpecificForClassOperation:(id<AZMoneyFlow>)moneySpender {
    
}

@end
