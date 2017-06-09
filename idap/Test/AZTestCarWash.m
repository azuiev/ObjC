//
//  AZTestCarWash.m
//  idap
//
//  Created by Aleksey Zuiev on 27/04/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "AZTestCarWash.h"

#import "AZEnterprise.h"
#import "AZCar.h"

#import "NSObject+AZExtension.h"

static const NSString *AZDelimeter = @"**********";
static const NSUInteger AZCarsCount = 150;

@implementation AZTestCarWash

+ (void)performTest {
    AZEnterprise *enterprise = [AZEnterprise object];
    NSArray *cars = [AZCar objectsWithCount:AZCarsCount];
    
    NSLog(@"%@", AZDelimeter);

    for (AZCar *car in cars) {
        
        [enterprise performSelectorInBackground:@selector(washCar:) withObject:car];
        //[enterprise washCar:car];
    }
    
    NSRunLoop *runLoop = [NSRunLoop mainRunLoop];
    [runLoop run];
}

@end
