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
#pragma mark Public methods

- (void)getIncome:(AZAccountant *)accountant {
    
    double income = accountant.money;
    NSLog(@"%@ get income from %@ - %5.2f. Total - %5.2f dollars ", self, accountant, income, self.money + income);
}

#pragma mark -
#pragma mark Private methods

- (void)performSpecificForClassOperation:(id<AZMoneyFlow>  *)moneySpender {
    if ([(id)moneySpender isMemberOfClass:[AZAccountant class]]) {
        [self getIncome:(AZAccountant *)moneySpender];
    } else {
        NSLog(@"Achtung!!!");
    }
}

@end
