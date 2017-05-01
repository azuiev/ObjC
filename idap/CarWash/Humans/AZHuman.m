//
//  AZHuman.m
//  idap
//
//  Created by Aleksey Zuiev on 26/04/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "AZHuman.h"
#import "AZRandom.h"

static const NSUInteger AZMinSalary = 1000;
static const NSUInteger AZMaxSalary = 5000;
static const NSUInteger AZMaxExperience = 50;

@implementation AZHuman

#pragma mark -
#pragma mark Initialization and Deallocation

- (void)dealloc {
    [self.name release];
    self.name = nil;
    [super dealloc];
}

+ (instancetype)init{
    return [[[self alloc] init] autorelease];
}

- (instancetype)init{
    [super init];
    self.name = [AZRandom randomName];
    self.salary = randomNumberInRange(NSMakeRange(AZMinSalary, AZMaxSalary - AZMinSalary + 1));
    self.experience = randomNumberWithMaxValue(AZMaxExperience);
    [self sayHi];
    return self;
}

#pragma mark -
#pragma mark Implements methods

- (void)sayHi{
    NSLog(@"HI! I am %@ - %@, salary - %4.2f, expirience - %2.1f", [self class], self.name, self.salary, self.experience);
}

@end
