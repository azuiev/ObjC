//
//  AZCarWashBuilding.m
//  idap
//
//  Created by Aleksey Zuiev on 28/04/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "AZEnterprise.h"

@implementation AZEnterprise

- (void)performBusinessProcess:(AZCar *)car washer:(AZWasher *)washer accountant:(AZAccountant *)accountant director:(AZDirector *)director{
    [washer takeMoney:(id<AZMoneyFlow> *)car];
    [accountant takeMoney:(id<AZMoneyFlow> *)washer];
    [director takeMoney:(id<AZMoneyFlow> *)accountant];
}

@end
