//
//  AZAccountant.m
//  idap
//
//  Created by Aleksey Zuiev on 26/04/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "AZAccountant.h"

@implementation AZAccountant

#pragma mark -
#pragma mark Public

- (void)calculateMoney:washer {
    NSLog(@"%@ calculate %@ money. %lu dollars ", self ,washer, [washer money]);
}

#pragma mark -
#pragma mark Observer

- (void)employeeDidFinishWork:(AZEmployee *)employee {
    [self processObject:employee];
}

#pragma mark -
#pragma mark Private

- (void)performOperationWithObject:(AZWasher *)washer {
    [self calculateMoney:(AZWasher *)washer];
}

@end
