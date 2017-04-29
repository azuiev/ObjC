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

- (void)takeIncomeFromAccountant:(double)income {
    self.income += income;
    NSLog(@"%@ - %@, receive income - %5.2f", [self class], self.name, income);
}

@end
