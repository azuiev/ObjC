//
//  AZCarWashBuilding.m
//  idap
//
//  Created by Aleksey Zuiev on 28/04/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "AZEnterprise.h"

@implementation AZEnterprise

- (void)performBusinessProcess:(AZCar *)car {
    AZHuman *washer = [self humanFromBuildingBy:self.carWash class:[AZWasher class]];
    [washer takeMoney:(id<AZMoneyFlow> *)car];
    AZHuman *accountant = [self humanFromBuildingBy:self.administration class:[AZAccountant class]];
    [accountant takeMoney:(id<AZMoneyFlow> *)washer];
    AZHuman *director = [self humanFromBuildingBy:self.administration class:[AZDirector class]];
    [director takeMoney:(id<AZMoneyFlow> *)accountant];
}

#pragma mark -
#pragma mark Private methods
- (AZHuman *)humanFromBuildingBy:(AZBuilding *)building class:(Class)cls {
    NSArray *rooms = [building rooms];
    NSArray *humans = [rooms[0] humans];
    for (AZHuman *human in humans) {
        if ([human isKindOfClass:cls]) {
            return human;
        }
    }
    return nil;
}


@end
