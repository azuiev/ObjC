//
//  AZCarWashBuilding.m
//  idap
//
//  Created by Aleksey Zuiev on 28/04/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "AZEnterprise.h"

#import "AZCarWashRoom.h"

#import "NSObject+AZExtension.h"
#import "NSArray+AZExtension.h"

@interface AZEnterprise ()
@property (nonatomic, retain)   AZBuilding  *adminBuilding;
@property (nonatomic, retain)   AZBuilding  *carWashBuilding;

- (AZHuman *)freeEmployeeFromArray:(NSArray *)employes;
- (void)performBusinessProcess:(AZCar *)car;
- (void)prepareEnterprise;

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
#pragma mark Private

- (id)freeEmployeeWithClass:(Class)cls {
    return [[[self employees] objectsWithBlock: ^BOOL(AZHuman *obj) {
        return ([obj isMemberOfClass:cls] && obj.state == AZEmployeeFree);
    }] firstObject];
}

- (id)employees {
    NSArray *buildings = @[self.adminBuilding, self.carWashBuilding];
    NSMutableArray *employees = [NSMutableArray array];
    for (AZBuilding *building in buildings) {
        [employees addObjectsFromArray:[building employees]];
    }
    
    return employees;
}
                          
- (void)performBusinessProcess:(AZCar *)car {
    AZWasher *washer = [self freeEmployeeWithClass:[AZWasher class]];
    AZAccountant *accountant = [self freeEmployeeWithClass:[AZAccountant class]];
    AZDirector *director = [self freeEmployeeWithClass:[AZDirector class]];
    
    [washer processObject:car];
    [accountant processObject:washer];
    [director processObject:accountant];
}

- (void)prepareEnterprise {
    AZBuilding *adminBuilding = [AZBuilding object];
    AZRoom *adminRoom = [AZRoom object];
    AZAccountant *accountant = [AZAccountant object];
    AZDirector *director = [AZDirector object];
    
    [adminBuilding addRoom:adminRoom];
    [adminRoom addHuman:accountant];
    [adminRoom addHuman:director];

    
    AZBuilding *carWashBuilding = [AZBuilding object];
    AZRoom *carWashRoom = [AZCarWashRoom object];
    AZWasher *washer = [AZWasher object];
    
    [carWashBuilding addRoom:carWashRoom];
    [carWashRoom addHuman:washer];
    
    self.adminBuilding = adminBuilding;
    self.carWashBuilding = carWashBuilding;
}

@end
