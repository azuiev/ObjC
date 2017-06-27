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

static const NSUInteger AZDefaultDirectorsCount = 1;
static const NSUInteger AZDefaultAccountantsCount = 3;
static const NSUInteger AZDefaultWashersCount = 9;

typedef AZDispatcher * (^AZDispatcherBlock)(Class class, NSUInteger count, AZDispatcher *dispatcher);

@interface AZEnterprise ()
@property (nonatomic, retain)   AZDispatcher    *washerDispatcher;
@property (nonatomic, retain)   AZDispatcher    *accountantDispatcher;
@property (nonatomic, retain)   AZDispatcher    *directorDispatcher;

- (void)prepareEnterprise;

@end

@implementation AZEnterprise

#pragma mark -
#pragma mark Initialization and Deallocation

- (void)dealloc {
    self.directorDispatcher = nil;
    self.accountantDispatcher = nil;
    self.washerDispatcher = nil;
    
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
    AZDispatcherBlock block = ^AZDispatcher * (Class class, NSUInteger count, AZDispatcher *observer) {
        AZDispatcher *dispatcher = [AZDispatcher object];
        
        NSArray *objects = [NSArray objectsWithCount:count block: ^id {
            id object = [class object];
            [object addObserver:observer];
            
            return object;
        }];
        
        [dispatcher addHandlersFromArray:objects];
        
        return dispatcher;
    };
    
    self.directorDispatcher = block([AZDirector class], AZDefaultDirectorsCount, nil);
    self.accountantDispatcher = block([AZAccountant class], AZDefaultAccountantsCount, self.directorDispatcher);
    self.washerDispatcher = block([AZWasher class], AZDefaultWashersCount, self.accountantDispatcher);
}

@end
