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

- (AZWasher *)freeWasher;
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
    [self.carsQueue enqueue:car];
    [[self freeWasher] processObject:car];
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
#pragma mark AZEmployeeObserver

- (void)employeeDidBecameFree:(AZEmployee *)employee {
    NSLog(@"%@ notified %@ about finish work", employee, self);
    [self.washersQueue enqueue:employee];
}

#pragma mark -
#pragma mark Private

- (void)removeObservers {
    AZAccountant *accountant = self.accountant;
    [self.director removeObserver:accountant];
    
    NSArray *washers = self.washers;
    
    for (AZWasher *washer in washers) {
        [washer removeObserver:accountant];
        [washer removeObserver:self];
    }
}

- (AZWasher *)freeWasher {
    return [self.washersQueue dequeue];
}

- (void)prepareEnterprise {
    AZDirector *director = [AZDirector object];
    self.director = director;
    AZAccountant *accountant = [AZAccountant object];
    self.accountant = accountant;
    [accountant addObserver:director];
    
    NSUInteger washersCount = AZRandomNumberInRange(AZMakeRange(AZMinWashersCount, AZMaxWashersCount));
    NSArray *washers = [NSArray objectsWithCount:washersCount block: ^AZWasher * {
        return [AZWasher object];
    }];
   
    self.washers = [NSMutableArray array];
    self.washersQueue = [AZQueue object];
    
    for (AZWasher *washer in washers) {
        [self hireWasher:washer];
    }
}

- (void)hireWasher:(AZWasher *)washer {
    [washer setState:AZEmployeeFree];
    [washer addObserver:self.accountant];
    [washer addObserver:self];
    
    [self.washers addObject:washer];
    [self.washersQueue enqueue:washer];
}


- (void)hireAccountant:(AZAccountant *)accountant {
    
}

- (void)hireDirector:(AZDirector *)director {
    
}

@end
