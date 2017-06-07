//
//  AZDirector.m
//  idap
//
//  Created by Aleksey Zuiev on 26/04/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "AZDirector.h"

@class AZAccountant;

@implementation AZDirector

#pragma mark -
#pragma mark Public

- (void)getIncome {
    NSLog(@"%@ start getting income", self);
    
    NSLog(@"%@ get income - %lu dollars ", self, self.money);
}

#pragma mark -
#pragma mark Observer

- (void)employeeDidBecameRequiredProcessing:(AZEmployee *)accountant {
    NSLog(@"%@ notified %@ about finish work", accountant, self);
    [self processObject:accountant];
}

#pragma mark -
#pragma mark Private 

- (void)performOperationWithObject:(AZAccountant *)accountant {
    [self getIncome];
}

@end
