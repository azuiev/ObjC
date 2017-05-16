//
//  AZCar.m
//  idap
//
//  Created by Aleksey Zuiev on 26/04/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "AZCar.h"
#import "AZWasher.h"

#import "AZRandomNumber.h"

static NSString * const AZDescriptionFormatter = @"%@: %@";

@interface AZCar ()
@property (nonatomic, assign) NSUInteger money;

- (NSString *)randomMark;

@end

@implementation AZCar

const u_int AZMaxMoneyForCar = 5000;

#pragma mark -
#pragma mark Initialization and Deallocation

- (void)dealloc {
    self.mark = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    self.mark = [self randomMark];
    self.money = AZRandomNumberWithMaxValue(AZMaxMoneyForCar);
    self.state = AZDirtyCar;
    [self sayHi];
    
    return self;
}

#pragma mark -
#pragma mark Public

- (void)sayHi {
    NSLog(@"HI! I am %@ - %@. I have %lu dollars", [self class], self.mark, self.money);
}

#pragma mark -
#pragma mark AZMoneyFlow

- (NSUInteger)giveMoney {
    NSUInteger result = self.money;
    self.money = 0;
    NSLog(@"%@ give %lu dollars ", self, result);
    
    return result;
}

#pragma mark -
#pragma mark Description

- (NSString *)description {
    return [NSString stringWithFormat:AZDescriptionFormatter, [self class], self.mark];
}

#pragma mark -
#pragma mark Private

- (NSString *)randomMark {
    NSArray *listOfMarks = @[@"Alfa-romeo",
                             @"Bugatti",
                             @"Ferrary",
                             @"Ford",
                             @"Lamborgini",
                             @"Mazeratti",
                             @"Opel",
                             @"Porshe",
                             @"Toyota"];
    
    return listOfMarks[AZRandomNumberWithMaxValue([listOfMarks count] - 1)];
}

@end
