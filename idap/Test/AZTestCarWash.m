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
#import "AZEnterprise.h"
#import "NSObject+AZInit.h"

static const NSString *AZDelimeter = @"**********";

@implementation AZTestCarWash

+ (void)performTtest{
    AZWasher *washer = [AZWasher init];
    AZAccountant *accountant = [AZAccountant init];
    AZDirector *director = [AZDirector init];
    NSLog(@"%@",AZDelimeter);
    NSArray *cars = [AZCar initWithCount:10];
    AZEnterprise *enterprise = [AZEnterprise init];
    NSLog(@"%@",AZDelimeter);
    for (AZCar *car in cars) {
        [enterprise performBusinessProcess:car washer:washer accountant:accountant director:director];
        NSLog(@"%@",AZDelimeter);
    }
}

@end
