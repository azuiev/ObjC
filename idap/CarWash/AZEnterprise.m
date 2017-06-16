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
static const NSUInteger AZDefaultWashersCount = 5;


@interface AZEnterprise ()
@property (nonatomic, retain)   AZDirector      *director;
@property (nonatomic, retain)   AZAccountant    *accountant;
@property (nonatomic, retain)   NSMutableArray  *washers;
@property (nonatomic, retain)   AZQueue         *washersQueue;
@property (nonatomic, retain)   AZQueue         *carsQueue;

- (void)startWashing;

- (void)removeObservers;
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
    self.washersQueue = nil;
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
    [self.carsQueue enqueueObject:car];
    [self startWashing];
}

- (void)washCars:(NSArray *)cars {
    for (AZCar * car in cars) {
        [self performSelectorInBackground:@selector(washCar:) withObject:car];
    }
}

#pragma mark -
#pragma mark Private

- (void)startWashing {
    @synchronized (self) {
        AZQueue *washers = self.washersQueue;
        AZQueue *cars = self.carsQueue;
        
        AZWasher *washer = [washers dequeueObject];
        if (washer) {
            AZCar *car = [cars dequeueObject];
            if (car) {
                [washer processObject:car];
            } else {
                [washers enqueueObject:washer];
            }
        }
    }
}

- (void)removeObservers {
    AZAccountant *accountant = self.accountant;
    [accountant removeObserver:accountant];
    [accountant removeObserver:self.director];
    
    NSArray *observers = @[accountant, self];
    NSArray *washers = self.washers;

    for (AZWasher *washer in washers) {
        [washer removeObservers:observers];
    }
}

- (void)prepareEnterprise {
    AZDirector *director = [AZDirector object];
    self.director = director;
    
    AZAccountant *accountant = [AZAccountant object];
    self.accountant = accountant;
    
    [accountant addObserver:director];
    
    NSUInteger washersCount = AZRandomNumberInRange(AZMakeRange(AZMinWashersCount, AZMaxWashersCount));
    washersCount = AZDefaultWashersCount;
    
    AZQueue *queue = [AZQueue object];
    NSArray *observers = @[accountant, self];
    
    NSArray *washers = [NSArray objectsWithCount:washersCount block: ^AZWasher * {
        AZWasher *washer = [AZWasher object];
        [washer addObservers:observers];
        
        [queue enqueueObject:washer];
        
        return washer;
    }];
   
    self.washers = [NSMutableArray arrayWithArray:washers];
    self.washersQueue = queue;

    self.carsQueue = [AZQueue object];
}

#pragma mark -
#pragma mark AZEmployeeObserver

- (void)employeeBecameReadyToWork:(AZEmployee *)employee {
    [self.washersQueue enqueueObject:employee];
    [self startWashing];
}

@end
