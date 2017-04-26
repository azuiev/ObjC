//
//  AZCarWashRoom.h
//  idap
//
//  Created by Aleksey Zuiev on 26/04/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "AZRoom.h"
#import "AZCar.h"

@interface AZCarWashRoom : AZRoom

@property (nonatomic, copy, readonly) NSArray *cars;
@property (nonatomic,assign) int carsCapacity;

- (void) addCar:(AZCar *) car;
- (void) removecar:(AZCar *) car;

@end
