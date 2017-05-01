//
//  AZTestCarWash.m
//  idap
//
//  Created by Aleksey Zuiev on 27/04/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "AZTestCarWash.h"

#import "AZAccountant.h"
#import "AZDirector.h"
#import "AZWasher.h"
#import "AZCar.h"
#import "AZCarWashBuilding.h"
#import "NSObject+AZInit.h"

@implementation AZTestCarWash

+ (void)performTtest{
    AZWasher *washer = [AZWasher init];
    AZAccountant *accountant = [AZAccountant init];
    AZDirector *director = [AZDirector init];
    
    NSArray *cars = [AZCar initWithCount:10];
    AZCarWashBuilding *carWashBuilding = [AZCarWashBuilding init];
    [carWashBuilding washCarsBy:cars washer:washer accountant:accountant director:director];
}

@end
