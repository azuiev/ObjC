//
//  AZCar.m
//  idap
//
//  Created by Aleksey Zuiev on 26/04/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "AZCar.h"
#import "AZRandomString.h"
#import "AZWasher.h"

static NSString * const AZDescriptionFormatter = @"%@: %@";

@interface AZCar ()
@property (nonatomic, assign) double money;
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
    [super init];
    self.mark = [self randomMark];
    self.money = randomNumberWithMaxValue(AZMaxMoneyForCar);
    self.clear = NO;
    [self sayHi];
    
    return self;
}

#pragma mark -
#pragma mark Private Methods

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
    
    return listOfMarks[arc4random_uniform((uint32_t)[listOfMarks count])];
}

#pragma mark -
#pragma mark Implements methods

- (void)sayHi {
    NSLog(@"HI! I am %@ - %@. I have %4.2f dollars", [self class], self.mark, self.money);
}

#pragma mark -
#pragma mark Implements protocols

- (double)giveMoney:(AZWasher *)human {
    double result = self.money;
    self.money = 0;
    NSLog(@"%@ give %5.2f dollars to %@ ", self, result, human);
    
    return result;
}

#pragma mark -
#pragma mark Override Methods

- (NSString *)description {
    return [NSString stringWithFormat:AZDescriptionFormatter, [self class], self.mark];
}

@end
