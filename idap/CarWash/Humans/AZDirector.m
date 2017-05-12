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
#pragma mark Public

- (void)getIncome:(AZAccountant *)accountant {
    NSUInteger income = accountant.money;
    NSLog(@"%@ get income from %@ - %lu. Total - %lu dollars ", self, accountant, income, self.money + income);
}

#pragma mark -
#pragma mark Private 

- (void)performSpecificForClassOperation:(AZAccountant *)accountant {
    [self getIncome:(AZAccountant *)accountant];
}

@end
