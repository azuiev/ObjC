//
//  AZCar.m
//  idap
//
//  Created by Aleksey Zuiev on 26/04/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "AZCar.h"

extern NSString * AZDescriptionFormatter;

@interface AZCar ()
@property (nonatomic, assign) double money;
@end

@implementation AZCar

const u_int AZMaxMoneyForCar = 5000;

#pragma mark -
#pragma mark Initialization and Deallocation

+ (instancetype)init{
    return [[[self alloc] init] autorelease];
}

- (void)dealloc {
    [self.mark release];
    self.mark = nil;
    [super dealloc];
}

- (instancetype)init{
    [super init];
    self.mark = [self randomMark];
    self.money = arc4random_uniform((uint32_t)AZMaxMoneyForCar);
    self.clear = NO;
    [self sayHi];
    return self;
}

#pragma mark -
#pragma mark Private Methods

- (NSString *)randomMark {
    NSArray *listOfMarks = [NSArray arrayWithObjects:
                           @"Alfa-romeo",
                           @"Bugatti",
                           @"Ferrary",
                           @"Ford",
                           @"Lamborgini",
                           @"Mazeratti",
                           @"Opel",
                           @"Porshe",
                           @"Toyota",
                           nil];
    return [listOfMarks objectAtIndex:arc4random_uniform((uint32_t)[listOfMarks count])];
}

#pragma mark -
#pragma mark Implements methods

- (void)sayHi {
    NSLog(@"HI! I am %@ - %@. I have %4.2f dollars",[self class],self.mark,self.money);
}

#pragma mark -
#pragma mark Implements protocols

- (void)takeMoney:(id<AZMoneyFlow>  *)human{
    double income = [(id<AZMoneyFlow>)human giveMoney:(id<AZMoneyFlow> *)self];
    self.money += income;
    NSLog(@"%@ take %5.2f dollars from %@ ", self, income, *human);
}

- (double)giveMoney:(id<AZMoneyFlow> *)human{
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
