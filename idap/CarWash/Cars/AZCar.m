//
//  AZCar.m
//  idap
//
//  Created by Aleksey Zuiev on 26/04/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "AZCar.h"

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
    self.isClear = FALSE;
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

- (double)payForClearing {
    float moneyForClearing = self.money;
    [self setMoney:0];
    NSLog(@"%@ - %@. Paid %4.2f dollars for washing", [self class], self.mark, moneyForClearing);
    return moneyForClearing;
}

@end
