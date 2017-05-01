//
//  AZCarWashBuilding.m
//  idap
//
//  Created by Aleksey Zuiev on 28/04/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "AZCarWashBuilding.h"

@implementation AZCarWashBuilding

static const NSString *AZDelimeter = @"**********";

- (void)washCarsBy:(NSArray *)cars washer:(AZWasher *)washer accountant:(AZAccountant *)accountant director:(AZDirector *)director{
    for (AZCar *car in cars) {
        [washer washCar:car];
         NSLog(@"%@",AZDelimeter);
    }
    
    [accountant takeMoney:washer];
    [director takeMoney:accountant];
}

@end
