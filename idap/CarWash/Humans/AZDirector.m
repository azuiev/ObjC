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

- (void)getIncome {
    NSLog(@"%@ get income - %lu dollars ", self, self.money);
}

#pragma mark -
#pragma mark Observer

- (void)employeeDidFinishWork:(AZEmployee *)employee {
    [self processObject:employee];
}

#pragma mark -
#pragma mark Private 

- (void)performSpecificOperation {
    [self getIncome];
}

@end
