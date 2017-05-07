//
//  AZCarWashBuilding.m
//  idap
//
//  Created by Aleksey Zuiev on 28/04/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "AZEnterprise.h"

#import "NSObject+AZObjectExtension.h"
#import "AZCarWashRoom.h"

@interface AZEnterprise ()
@property (nonatomic, retain) AZBuilding *adminBuilding;
@property (nonatomic, retain) AZBuilding *carWashBuilding;
@end

@implementation AZEnterprise

#pragma mark -
#pragma mark Initialization and Deallocation

- (void)dealloc {
    self.adminBuilding = nil;
    self.carWashBuilding = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    
    [self prepareEnterprise];
    return self;
}

#pragma mark -
#pragma mark Private methods

- (void)performBusinessProcess:(AZCar *)car {
    AZHuman *washer = [self.carWashBuilding findEmployeeByClass:[AZWasher class]][0];
    AZHuman *accountant = [self.adminBuilding findEmployeeByClass:[AZAccountant class]][0];
    AZHuman *director = [self.adminBuilding findEmployeeByClass:[AZDirector class]][0];
    
    [washer processObject:car];
    [accountant processObject:washer];
    [director processObject:accountant];
}

- (void)prepareEnterprise {
    AZBuilding *adminBuilding = [AZBuilding object];
    AZRoom *adminBuildingRoom = [AZRoom object];
    AZAccountant *accountant = [AZAccountant object];
    AZDirector *director = [AZDirector object];
    
    [adminBuilding addRoom:adminBuildingRoom];
    [adminBuildingRoom addHuman:accountant];
    [adminBuildingRoom addHuman:director];
    
    AZBuilding *carWashBuilding = [AZBuilding object];
    AZRoom *carWashBuildingRoom = [AZCarWashRoom object];
    AZWasher *washer = [AZWasher object];
    
    [carWashBuilding addRoom:carWashBuildingRoom];
    [carWashBuildingRoom addHuman:washer];
    
    self.adminBuilding = adminBuilding;
    self.carWashBuilding = carWashBuilding;
}

- (AZHuman *)humanFromBuildingBy:(AZBuilding *)building class:(Class)cls {
    NSArray *humans = [[building rooms][0] humans];
    for (AZHuman *human in humans) {
        if ([human isKindOfClass:cls]) {
            return human;
        }
    }
    
    return nil;
}


@end
