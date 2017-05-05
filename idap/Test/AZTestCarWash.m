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
#import "AZRandomString.h"
#import "AZRoom.h"
#import "AZCarWashRoom.h"

static const NSString *AZDelimeter = @"**********";

@implementation AZTestCarWash

+ (void)performTest{
    AZBuilding *administration = [AZBuilding init];
    AZRoom *admininstrationRoom = [AZRoom init];
    AZAccountant *accountant = [AZAccountant init];
    AZDirector *director = [AZDirector init];
    [administration addRoom:admininstrationRoom];
    [admininstrationRoom addHuman:accountant];
    [admininstrationRoom addHuman:director];
    NSLog(@"%@",AZDelimeter);
    
    AZBuilding *carWash = [AZBuilding init];
    AZRoom *carWashRoom = [AZCarWashRoom init];
    [carWashRoom humans];
    AZWasher *washer = [AZWasher init];
    [carWash addRoom:carWashRoom];
    [carWashRoom addHuman:washer];
    
    AZEnterprise *enterprise = [AZEnterprise initWithAdministration:administration carWash:carWash];
    
    NSArray *cars = [AZCar initWithCount:10];
    
    NSLog(@"%@",AZDelimeter);
    
    for (AZCar *car in cars) {
        [enterprise performBusinessProcess:car];
        NSLog(@"%@",AZDelimeter);
    }
}

@end
