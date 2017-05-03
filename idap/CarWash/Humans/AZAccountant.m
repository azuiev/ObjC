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
#pragma mark Public methods

- (void)calculateMoney:washer {
    NSLog(@"%@ calculate %@ money. %5.2f dollars ", self ,washer, [washer money]);
}

#pragma mark -
#pragma mark Private methods

- (void)performSpecificForClassOperation:(id<AZMoneyFlow>  *)moneySpender {
    if ([(id)moneySpender isMemberOfClass:[AZWasher class]]) {
        [self calculateMoney:(AZWasher *)moneySpender];
    } else {
        NSLog(@"Achtung!!!");
    }
}

@end
