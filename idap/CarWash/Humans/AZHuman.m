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
@property (nonatomic,assign) double money;
@end

@implementation AZHuman

#pragma mark -
#pragma mark Initialization and Deallocation

- (void)dealloc {
    [self.name release];
    [super dealloc];
}

- (instancetype)init {
    [super init];
    self.name = [AZRandom randomName];
    self.salary = randomNumberInRange(NSMakeRange(AZMinSalary, AZMaxSalary - AZMinSalary + 1));
    self.experience = randomNumberWithMaxValue(AZMaxExperience);
    [self sayHi];
    return self;
}

#pragma mark -
#pragma mark Public methods

- (void)sayHi{
    NSLog(@"HI! I am %@ - %@, salary - %4.2f, expirience - %2.1f", [self class], self.name, self.salary, self.experience);
}

#pragma mark -
#pragma mark Implements protocols

- (void)takeMoney:(id<AZMoneyFlow>  *)moneySpender {
    [self performSpecificForClassOperation:moneySpender];
    double income = [(id<AZMoneyFlow>)moneySpender giveMoney:(id<AZMoneyFlow> *)self];
    self.money += income;
    NSLog(@"%@ take %5.2f dollars from %@ ", self, income, (id)moneySpender);
}

- (double)giveMoney:(id<AZMoneyFlow> *)moneyReceiver {
    double result = self.money;
    self.money = 0;
    NSLog(@"%@ give %5.2f dollars to %@ ", self, result, (id)moneyReceiver);
    return result;
}

#pragma mark -
#pragma mark Override Methods

- (NSString *)description {
    return [NSString stringWithFormat:AZDescriptionFormatter, [self class], self.name];
}

#pragma mark -
#pragma mark Override Methods

- (void)performSpecificForClassOperation:(id<AZMoneyFlow>  *)moneySpender {
    
}

@end
