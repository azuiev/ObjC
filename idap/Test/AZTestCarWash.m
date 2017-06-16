//
//  AZTestCarWash.m
//  idap
//
//  Created by Aleksey Zuiev on 27/04/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "AZTestCarWash.h"

#import "AZEnterprise.h"
#import "AZController.h"

#import "AZCar.h"

#import "NSObject+AZExtension.h"

static const NSString *AZDelimeter = @"**********";
static const NSUInteger AZCarsCount = 7;

@implementation AZTestCarWash

+ (void)performTest {
    AZEnterprise *enterprise = [AZEnterprise object];
    
    NSLog(@"%@", AZDelimeter);

    AZController *washController = [[AZController alloc] initWithBlock:^void {
        NSArray *cars = [AZCar objectsWithCount:AZCarsCount];
        
        [enterprise washCars:cars];
    }];
    
    [washController start];
    
    NSRunLoop *runLoop = [NSRunLoop mainRunLoop];
    [runLoop run];
}

@end
