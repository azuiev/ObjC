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
@property (nonatomic, copy)     NSArray         *washers;
@property (nonatomic, retain)   AZQueue         *washersQueue;

- (AZWasher *)freeWasher;
- (void)prepareEnterprise;

@end

@implementation AZEnterprise

#pragma mark -
#pragma mark Initialization and Deallocation

- (void)dealloc {
    self.accountant = nil;
    self.director = nil;
    self.washers = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    self.washersQueue = [AZQueue object];
    [self prepareEnterprise];
    
    return self;
}

#pragma mark -
#pragma mark Private

- (void)setWashers:(NSArray *)washers {
    if (washers != _washers) {
        _washers = nil;
        _washers = washers;
        self.washersQueue = nil;
        self.washersQueue = [AZQueue object];
        for (AZWasher *washer in _washers) {
            [_washersQueue enqueue:washer];
        }
    }
}

- (id)freeWasher {
    return [self.washersQueue dequeue];
}

- (void)performBusinessProcess:(AZCar *)car {
    [[self freeWasher] processObject:car];
}

- (void)prepareEnterprise {
    self.director = [AZDirector object];
    AZDirector *director = self.director;
    self.accountant = [AZAccountant object];
    AZAccountant *accountant = self.accountant;
    [accountant addObserver:director];
    
    NSUInteger washersCount = AZRandomNumberInRange(AZMakeRange(AZMinWashersCount, AZMaxWashersCount));
    NSMutableArray *washers = [NSMutableArray arrayWithCapacity:washersCount];
    for (NSUInteger i = 0; i < washersCount; i += 1) {
        AZWasher *washer = [AZWasher object];
        [washers addObject:washer];
        [washer addObserver:accountant];
    }
    
    self.washers = [NSArray arrayWithArray:washers];

}

@end
