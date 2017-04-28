//
//  AZDirector.m
//  idap
//
//  Created by Aleksey Zuiev on 26/04/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "AZDirector.h"

@implementation AZDirector

#pragma mark -
#pragma mark Initialization

- (instancetype)init {
    [super init];
    self.income = 0;
    return self;
}

#pragma mark -
#pragma mark Public methods

- (void)takeIncome:(double)income {
    self.income += income;
    NSLog(@"%@ - %@ recieved income - %f", [self class], self.name, income);
}

@end
