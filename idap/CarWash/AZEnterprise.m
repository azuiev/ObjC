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

- (AZHuman *)freeEmployeeFromArray:(NSArray *)employes {
    return employes[0];
}

- (void)performBusinessProcess:(AZCar *)car {
    NSArray *washers = [self.carWashBuilding findEmployeeByClass:[AZWasher class]];
    NSArray *accountants = [self.adminBuilding findEmployeeByClass:[AZAccountant class]];
    NSArray *directors = [self.adminBuilding findEmployeeByClass:[AZDirector class]];
    
    AZWasher *washer = (AZWasher *)[self freeEmployeeFromArray:washers];
    AZAccountant *accountant = (AZAccountant *)[self freeEmployeeFromArray:accountants];
    AZDirector *director = (AZDirector *)[self freeEmployeeFromArray:directors];
    
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

@end
