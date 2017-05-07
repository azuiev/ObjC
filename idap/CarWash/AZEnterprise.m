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
    AZHuman *washer = [self humanFromBuildingBy:self.carWashBuilding class:[AZWasher class]];
    [washer takeMoney:(id<AZMoneyFlow>)car];
    AZHuman *accountant = [self humanFromBuildingBy:self.adminBuilding class:[AZAccountant class]];
    [accountant takeMoney:(id<AZMoneyFlow>)washer];
    AZHuman *director = [self humanFromBuildingBy:self.adminBuilding class:[AZDirector class]];
    [director takeMoney:(id<AZMoneyFlow>)accountant];
}

- (void)prepareEnterprise {
    AZBuilding *administration = [AZBuilding object];
    AZRoom *admininstrationRoom = [AZRoom object];
    AZAccountant *accountant = [AZAccountant object];
    AZDirector *director = [AZDirector object];
    [administration addRoom:admininstrationRoom];
    [admininstrationRoom addHuman:accountant];
    [admininstrationRoom addHuman:director];
    
    AZBuilding *carWash = [AZBuilding object];
    AZRoom *carWashRoom = [AZCarWashRoom object];
    [carWashRoom humans];
    AZWasher *washer = [AZWasher object];
    [carWash addRoom:carWashRoom];
    [carWashRoom addHuman:washer];
    
    self.adminBuilding = administration;
    self.carWashBuilding = carWash;
    
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
