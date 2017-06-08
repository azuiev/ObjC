//
//  AZCarWashBuilding.m
//  idap
//
//  Created by Aleksey Zuiev on 28/04/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "AZEnterprise.h"

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
@property (nonatomic, retain)   AZQueue         *freeWashersQueue;
@property (nonatomic, retain)   AZQueue         *requiredProcessingWashersQueue;
@property (nonatomic, retain)   AZQueue         *carsQueue;

- (void)startWashing;

- (void)removeObservers;
- (void)prepareEnterprise;

- (void)addCarToQueue:car;
- (AZCar *)getCarFromQueue;

@end

@implementation AZEnterprise

#pragma mark -
#pragma mark Initialization and Deallocation

- (void)dealloc {
    [self removeObservers];
    
    self.accountant = nil;
    self.director = nil;
    self.washers = nil;
    self.freeWashersQueue = nil;
    self.requiredProcessingWashersQueue = nil;
    self.carsQueue = nil;
    
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
    [self addCarToQueue:car];
    [self startWashing];
}

#pragma mark -
#pragma mark Private

- (void)processWasher {
    AZAccountant *accountant = self.accountant;
    
    @synchronized (accountant) {
        if (AZEmployeeReadyToWork == self.accountant.state) {
            AZWasher *washer = [self.requiredProcessingWashersQueue dequeue];
            if (washer) {
                [self.accountant processObject:washer];
            }
        }
    }
}

- (BOOL)readyToWork {
    return [self.freeWashersQueue count] && [self.carsQueue count];
}

- (void)startWashing {
    @synchronized (self) {
        if ([self readyToWork]) {
            AZWasher *washer = [self.freeWashersQueue dequeue];
            AZCar *car = [self.carsQueue dequeue];
            
            [washer processObject:car];
        }
    }
}

- (void)removeObservers {
    AZAccountant *accountant = self.accountant;
    [self.director removeObserver:accountant];
    
    NSArray *washers = self.washers;
    
    for (AZWasher *washer in washers) {
        [washer removeObserver:accountant];
        [washer removeObserver:self];
    }
}

- (void)prepareEnterprise {
    AZDirector *director = [AZDirector object];
    self.director = director;
    
    AZAccountant *accountant = [AZAccountant object];
    self.accountant = accountant;
    
    [accountant addObserver:director];
    [accountant addObserver:self];
    
    
    NSUInteger washersCount = AZRandomNumberInRange(AZMakeRange(AZMinWashersCount, AZMaxWashersCount));
    washersCount = 22;
    NSArray *washers = [NSArray objectsWithCount:washersCount block: ^AZWasher * {
        return [AZWasher object];
    }];
   
    AZQueue *queue = [AZQueue object];
    
    for (AZWasher *washer in washers) {
        [washer addObserver:accountant];
        [washer addObserver:self];
        
        [queue enqueue:washer];
    }
    
    self.washers = [NSMutableArray arrayWithArray:washers];
    self.freeWashersQueue = queue;
    self.requiredProcessingWashersQueue = [AZQueue object];
    self.carsQueue = [AZQueue object];
}

#pragma mark -
#pragma mark AZEmployeeObserver

- (void)employeeBecameReadyToWork:(AZEmployee *)employee {
    if ([employee isMemberOfClass:[AZWasher class]]) {
        [self.freeWashersQueue enqueue:employee];
        [self startWashing];
    } else {
        [self processWasher];
    }
}

- (void)employeeDidStartWorking:(AZEmployee *)employee {
    //TODO. queue of washers to accountant
    
}

- (void)employeeBecameRequiredProcessing:(AZEmployee *)employee {
    if ([employee isMemberOfClass:[AZWasher class]]) {
        [self.requiredProcessingWashersQueue enqueue:employee];
        [self processWasher];
    }
}

#pragma mark -
#pragma mark Cars queue

- (void)addCarToQueue:car {
    [self.carsQueue enqueue:car];
}

- (AZCar *)getCarFromQueue {
    return [self.carsQueue dequeue];
}

@end
