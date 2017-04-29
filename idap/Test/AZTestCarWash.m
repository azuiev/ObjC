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
#import "AZStringGenerator.h"
#import "AZCar.h"
#import "AZCarWashBuilding.h"

@implementation AZTestCarWash

+ (void)performTtest{
    AZWasher *washer = [AZWasher init];
    AZAccountant *accountant = [AZAccountant init];
    AZDirector *director = [AZDirector init];
    
    NSMutableArray *cars = [[[NSMutableArray alloc] init] autorelease];
    for (u_int i = 0; i < 10; i +=1 ) {
        [cars addObject:[AZCar init]];
    }
    AZCarWashBuilding *carWashBuilding = [AZCarWashBuilding init];
    [carWashBuilding washCarsBy:cars washer:washer accountant:accountant director:director];
}

@end
