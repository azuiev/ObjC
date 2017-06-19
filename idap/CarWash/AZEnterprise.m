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
#import "AZDispatcher.h"

#import "AZQueue.h"
#import "AZRandomNumber.h"

#import "NSObject+AZExtension.h"
#import "NSArray+AZExtension.h"

static const NSUInteger AZMinWashersCount = 2;
static const NSUInteger AZMaxWashersCount = 20;
static const NSUInteger AZDefaultDirectorsCount = 1;
static const NSUInteger AZDefaultAccountantsCount = 2;
static const NSUInteger AZDefaultWashersCount = 5;

@interface AZEnterprise ()
@property (nonatomic, retain)   NSMutableSet    *directors;
@property (nonatomic, retain)   NSMutableSet    *accountants;
@property (nonatomic, retain)   NSMutableSet    *washers;
@property (nonatomic, retain)   AZDispatcher    *washerDispatcher;
@property (nonatomic, retain)   AZDispatcher    *accountantDispatcher;

- (void)prepareEnterprise;

@end

@implementation AZEnterprise

#pragma mark -
#pragma mark Initialization and Deallocation

- (void)dealloc {
    self.accountants = nil;
    self.directors = nil;
    self.washers = nil;
    self.washerDispatcher = nil;
    self.accountantDispatcher = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self prepareEnterprise];
    }
    
    return self;
}

#pragma mark -
#pragma mark Public

- (void)washCar:(AZCar *)car {
    [self.washerDispatcher takeObjectForProcessing:(id<AZHandlerDispatcher>)car];
}

- (void)washCars:(NSArray *)cars {
    for (AZCar * car in cars) {
        [self performSelectorInBackground:@selector(washCar:) withObject:car];
    }
}

- (void)prepareEnterprise {
    AZDispatcher *washerDispatcher = [AZDispatcher object];
    AZDispatcher *accountantDispatcher = [AZDispatcher object];
    
    NSUInteger washersCount = AZRandomNumberInRange(AZMakeRange(AZMinWashersCount, AZMaxWashersCount));
    washersCount = AZDefaultWashersCount;
    
    NSArray *directors = [AZDirector objectsWithCount:AZDefaultDirectorsCount];
    NSArray *accountants = [AZAccountant objectsWithCount:AZDefaultAccountantsCount];
    NSArray *washers = [NSArray objectsWithCount:washersCount block: ^AZWasher * {
        AZWasher *washer = [AZWasher object];
        
        [washer addObserver:accountantDispatcher];
        return washer;
    }];
    
    self.washers = [NSMutableSet setWithArray:washers];
    self.accountants = [NSMutableSet setWithArray:accountants];
    self.directors = [NSMutableSet setWithArray:directors];
    
    [washerDispatcher addHandlersFromArray:washers];
    [accountantDispatcher addHandlersFromArray:accountants];
    
    self.washerDispatcher = washerDispatcher;
    self.accountantDispatcher = accountantDispatcher;
}

@end
