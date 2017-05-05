//
//  AZCarWashRoom.m
//  idap
//
//  Created by Aleksey Zuiev on 26/04/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "AZCarWashRoom.h"

@interface AZCarWashRoom ()
@property (nonatomic, assign) NSMutableArray    *mutableHumans;
@property (nonatomic, assign) NSUInteger        mutableHumansCapacity;
@property (nonatomic, copy)   NSMutableArray    *mutableCars;
@property (nonatomic, assign) NSUInteger        mutableCarsCapacity;
@end

@implementation AZCarWashRoom
@dynamic cars;
@dynamic carsCapacity;

#pragma mark -
#pragma mark Inicialization and Deallocation

+ (instancetype)initWithCarsCapacity:(NSUInteger)carsCapacity humansCapacity:(NSUInteger)humansCapacity {
     return [[[self alloc] initWithCarsCapacity:carsCapacity humansCapacity:humansCapacity] autorelease];
}

+ (instancetype)initWithCarsCapacity:(NSUInteger)carsCapacity {
    return [[[self alloc] initWithCarsCapacity:carsCapacity] autorelease];
}

- (instancetype)initWithCarsCapacity:(NSUInteger)carsCapacity humansCapacity:(NSUInteger)humansCapacity{
    [super initWithHumansCapacity:humansCapacity];
    self.mutableCars = [NSMutableArray array];
    self.mutableCarsCapacity = carsCapacity;
    return self;
}

- (instancetype)initWithCarsCapacity:(NSUInteger)carsCapacity {
    [super init];
    self.mutableCars = [NSMutableArray array];
    self.mutableCarsCapacity = carsCapacity;
    return self;
}

- (instancetype)init {
    [super init];
    self.mutableCars = [NSMutableArray array];
    self.mutableCarsCapacity = AZDefaultCarsCount;
    return self;
}

#pragma mark -
#pragma mark Override parent initializer

- (instancetype)initWithHumansCapacity:(NSUInteger)humansCapacity {
    [super initWithHumansCapacity:humansCapacity];
    self.mutableCars = [NSMutableArray array];
    self.mutableCarsCapacity = AZDefaultCarsCount;
    return self;
}

#pragma mark -
#pragma mark Getters

- (NSArray *)cars {
    return [[self.mutableCars copy] autorelease];
}

- (NSUInteger)carsCapacity:(NSUInteger)humansCapacity {
    return self.mutableCarsCapacity;
}

#pragma mark -
#pragma mark Public Methods

- (void) addCar:(AZCar *)car {
    if (!car) {
        NSLog(@"Achtung!!!");
    }
    
    [self.mutableCars addObject:car];
}

- (void) removeCar:(AZCar *)car {
    if (!car) {
        NSLog(@"Achtung!!!");
    }
    
    [self.mutableCars removeObject:car];
}

#pragma mark -
#pragma mark Override Methods

- (void)sayHi {
    NSLog(@"Hi! I am %@ with humansCapacity - %lu, carsCapacity - %lu", [self class], self.mutableHumansCapacity, self.mutableCarsCapacity);
}

@end
