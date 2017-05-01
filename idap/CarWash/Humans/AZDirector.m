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

- (void)getIncome:(AZAccountant *)accountant{
    [self takeMoney:(id<AZMoneyFlow> *)accountant];
    NSLog(@"%@ get income from %@. Total income - %5.2f dollars ", self, accountant, self.money);
}

@end
