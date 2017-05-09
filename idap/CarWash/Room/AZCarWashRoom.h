//
//  AZCarWashRoom.h
//  idap
//
//  Created by Aleksey Zuiev on 26/04/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "AZRoom.h"
#import "AZCar.h"

static const NSUInteger AZDefaultCarsCount = 1;

@interface AZCarWashRoom : AZRoom
@property (nonatomic, copy, readonly)   NSArray     *cars;
@property (nonatomic, assign, readonly) NSUInteger  carsCapacity;

+ (instancetype)roomWithCarsCapacity:(NSUInteger)carsCapacity humansCapacity:(NSUInteger)humansCapacity;
+ (instancetype)roomWithCarsCapacity:(NSUInteger)carsCapacity;

- (instancetype)initWithCarsCapacity:(NSUInteger)carsCapacity humansCapacity:(NSUInteger)humansCapacity;
- (instancetype)initWithCarsCapacity:(NSUInteger)carsCapacity;

- (void) addCar:(AZCar *) car;
- (void) removeCar:(AZCar *) car;

@end
