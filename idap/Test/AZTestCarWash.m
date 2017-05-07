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
#import "NSObject+AZObjectExtension.h"
#import "AZRandomString.h"
#import "AZRoom.h"
#import "AZCarWashRoom.h"

static const NSString *AZDelimeter = @"**********";

@implementation AZTestCarWash

+ (void)performTest {
    AZBuilding *administration = [AZBuilding object];
    AZRoom *admininstrationRoom = [AZRoom object];
    AZAccountant *accountant = [AZAccountant object];
    AZDirector *director = [AZDirector object];
    [administration addRoom:admininstrationRoom];
    [admininstrationRoom addHuman:accountant];
    [admininstrationRoom addHuman:director];
    NSLog(@"%@",AZDelimeter);
    
    AZBuilding *carWash = [AZBuilding object];
    AZRoom *carWashRoom = [AZCarWashRoom object];
    [carWashRoom humans];
    AZWasher *washer = [AZWasher object];
    [carWash addRoom:carWashRoom];
    [carWashRoom addHuman:washer];
    
    AZEnterprise *enterprise = [AZEnterprise initWithAdministration:administration carWash:carWash];
    
    NSArray *cars = [AZCar arrayWithObjects:10];
    
    NSLog(@"%@",AZDelimeter);
    
    for (AZCar *car in cars) {
        [enterprise performBusinessProcess:car];
        NSLog(@"%@",AZDelimeter);
    }
}

@end
