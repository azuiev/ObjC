//
//  AZCarWashBuilding.m
//  idap
//
//  Created by Aleksey Zuiev on 28/04/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "AZEnterprise.h"

#import "AZWashController.h"

#import "AZDirector.h"
#import "AZAccountant.h"
#import "AZWasher.h"
#import "AZCar.h"

#import "AZQueue.h"
#import "AZRandomNumber.h"

#import "NSObject+AZExtension.h"
#import "NSArray+AZExtension.h"

static const NSUInteger AZMinWashersCount = 2;
static const NSUInteger AZMaxWashersCount = 20;

@interface AZEnterprise ()
@property (nonatomic, retain)   AZDirector      *director;
@property (nonatomic, retain)   AZAccountant    *accountant;
@property (nonatomic, retain)   NSMutableArray  *washers;

@property (nonatomic, retain)   AZWashController    *washController;

- (void)prepareEnterprise;

@end

@implementation AZEnterprise

#pragma mark -
#pragma mark Initialization and Deallocation

- (void)dealloc {
    [self removeObservers];
    self.accountant = nil;
    self.director = nil;
    self.washers = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    
    [self prepareEnterprise];
    
    return self;
}

#pragma mark -
#pragma mark Public

- (void)washCar:(AZCar *)car {
    [self.washController processCar:car];
}

- (void)hireEmployee:(AZEmployee *)employee {
    Class cls = [employee class];
    
    if (cls == [AZWasher class]) {
        [self hireWasher:(AZWasher *)employee];
    }
    
    if (cls == [AZAccountant class]) {
        [self hireAccountant:(AZAccountant *)employee];
    }
    
    if (cls == [AZDirector class]) {
        [self hireDirector:(AZDirector *)employee];
    }
}

- (void)fireEmployee:(AZEmployee *)employee {
    
}

#pragma mark -
#pragma mark Private

- (void)removeObservers {
    AZAccountant *accountant = self.accountant;
    AZWashController *controller = self.washController;
    [self.director removeObserver:accountant];
    
    NSArray *washers = self.washers;
    
    for (AZWasher *washer in washers) {
        [washer removeObserver:accountant];
        [washer removeObserver:controller];
    }
}

- (void)prepareEnterprise {
    AZDirector *director = [AZDirector object];
    self.director = director;
    AZAccountant *accountant = [AZAccountant object];
    self.accountant = accountant;
    [accountant addObserver:director];
    self.washController = [AZWashController object];
    
    NSUInteger washersCount = AZRandomNumberInRange(AZMakeRange(AZMinWashersCount, AZMaxWashersCount));
    washersCount = 2;
    NSArray *washers = [NSArray objectsWithCount:washersCount block: ^AZWasher * {
        return [AZWasher object];
    }];
   
    self.washers = [NSMutableArray array];
    
    for (AZWasher *washer in washers) {
        [self hireWasher:washer];
    }
}

- (void)hireWasher:(AZWasher *)washer {
    [washer addObserver:self.accountant];
    [washer addObserver:self.washController];
    [washer setState:AZEmployeeReadyToWork];
    
    [self.washers addObject:washer];
}


- (void)hireAccountant:(AZAccountant *)accountant {
    
}

- (void)hireDirector:(AZDirector *)director {
    
}

@end
