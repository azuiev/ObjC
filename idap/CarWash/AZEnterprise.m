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
@property (nonatomic, copy)     AZQueue         *washersQueue;

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
    self.washersQueue = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    [self prepareEnterprise];
    
    return self;
}

#pragma mark -
#pragma mark Private

- (id)freeWasher {
    return [self.washersQueue dequeue];
}

- (void)performBusinessProcess:(AZCar *)car {
    AZWasher *washer = [self freeWasher];
    AZDirector *director = self.director;
    AZAccountant *accountant = self.accountant;
    
    [washer processObject:car];
    [accountant processObject:washer];
    [director processObject:accountant];
}

- (void)prepareEnterprise {
    self.accountant = [AZAccountant object];
    self.director = [AZDirector object];
    NSUInteger washersCount = AZRandomNumberInRange(AZMakeRange(AZMinWashersCount, AZMaxWashersCount));
    NSMutableArray *washers = [NSMutableArray arrayWithCapacity:washersCount];
    for (NSUInteger i = 0; i < washersCount; i += 1) {
        [washers addObject:[AZWasher object]];
    }
    
    self.washers = [NSArray arrayWithArray:washers];
}

@end
