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
#pragma mark Initialization

- (instancetype)init {
    [super init];
    self.moneyFromWashers = 0;
    return self;
}

#pragma mark -
#pragma mark Public methods

- (void)calculateMoney {
    NSLog(@"%@ - %@, totally income is %5.2f dollars ", [self class] ,self.name, self.moneyFromWashers);
}

@end
