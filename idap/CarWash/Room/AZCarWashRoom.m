//
//  AZCarWashRoom.m
//  idap
//
//  Created by Aleksey Zuiev on 26/04/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "AZCarWashRoom.h"

@interface AZCarWashRoom ()
@property (nonatomic, copy)   NSMutableArray    *mutableCars;
@property (nonatomic, assign) NSUInteger        carsCapacity;
@end

@implementation AZCarWashRoom
@dynamic cars;

#pragma mark -
#pragma mark Inicialization and Deallocation

+ (instancetype)roomWithCarsCapacity:(NSUInteger)carsCapacity humansCapacity:(NSUInteger)humansCapacity {
     return [[[self alloc] initWithCarsCapacity:carsCapacity humansCapacity:humansCapacity] autorelease];
}

+ (instancetype)roomWithCarsCapacity:(NSUInteger)carsCapacity {
    return [[[self alloc] initWithCarsCapacity:carsCapacity] autorelease];
}

- (instancetype)initWithCarsCapacity:(NSUInteger)carsCapacity humansCapacity:(NSUInteger)humansCapacity {
    self = [super initWithHumansCapacity:humansCapacity];
    self.mutableCars = [NSMutableArray array];
    self.carsCapacity = carsCapacity;
    
    return self;
}

- (instancetype)initWithCarsCapacity:(NSUInteger)carsCapacity {
    return [self initWithCarsCapacity:carsCapacity humansCapacity:AZDefaultHumansCount];
}

- (instancetype)init {
    return [self initWithCarsCapacity:AZDefaultCarsCount];
}

//parent initializer
- (instancetype)initWithHumansCapacity:(NSUInteger)humansCapacity {
    self = [super initWithHumansCapacity:humansCapacity];
    
    return [self init];
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)cars {
    return [[self.mutableCars copy] autorelease];
}

#pragma mark -
#pragma mark Public

- (void) addCar:(AZCar *)car {
    if (!car) {
        NSLog(@"Achtung!!!");
        
        return;
    }
    
    [self.mutableCars addObject:car];
}

- (void) removeCar:(AZCar *)car {
    [self.mutableCars removeObject:car];
}

#pragma mark -
#pragma mark Override SayHi

- (void)sayHi {
    NSLog(@"Hi! I am %@ with humansCapacity - %lu, carsCapacity - %lu", [self class], [self humansCapacity], self.carsCapacity);
}

@end
