//
//  AZTestCarWash.m
//  idap
//
//  Created by Aleksey Zuiev on 27/04/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "AZTestCarWash.h"

#import "AZCar.h"
#import "AZEnterprise.h"
#import "NSObject+AZObjectExtension.h"
#import "AZRandomString.h"
#import "AZRoom.h"
#import "AZCarWashRoom.h"
#import "NSArray+AZObjectsByClass.h"

static const NSString *AZDelimeter = @"**********";

@implementation AZTestCarWash

+ (void)performTest {
    AZEnterprise *enterprise = [AZEnterprise object];
    NSArray *cars = [AZCar objectsWithCount:10];
    
    NSLog(@"%@",AZDelimeter);

    for (AZCar *car in cars) {
        [enterprise performBusinessProcess:car];
        NSLog(@"%@",AZDelimeter);
    }
}

@end
