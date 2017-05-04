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
#import "AZRandom.h"
#import "AZRoom.h"
#import "AZCarWashRoom.h"

static const NSString *AZDelimeter = @"**********";

@implementation AZTestCarWash

+ (void)performTest{
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
    
    NSLog(@"%@", [AZRandom lowercaseString]);
    NSLog(@"%@", [AZRandom uppercaseStringWithLength:13]);
    NSLog(@"%@", [AZRandom lowercaseStringWithLength:9]);
    NSLog(@"%@", [AZRandom numericStringWithLength:11]);
    NSLog(@"%@", [AZRandom letterStringWithLength:10]);
    NSLog(@"%@", [AZRandom alphanumericStringWithLength:12]);
    NSLog(@"%@", [AZRandom alphanumericStringWithLengthInRange:NSMakeRange(1, 2)]);
    
    AZRoom *room = [AZRoom init];
    AZRoom *room2 = [AZRoom initWithHumansCapacity:2];
    AZCarWashRoom *room3 = [AZCarWashRoom init];
    AZCarWashRoom *room4 = [AZCarWashRoom initWithCarsCapacity:5];
    AZCarWashRoom *room5 = [AZCarWashRoom initWithHumansCapacity:4];
    AZCarWashRoom *room6 = [AZCarWashRoom initWithCarsCapacity:3 humansCapacity:3];
    
    
    
}

@end
