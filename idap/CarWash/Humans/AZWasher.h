//
//  AZWasher.h
//  idap
//
//  Created by Aleksey Zuiev on 26/04/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "AZHuman.h"
#import "AZCar.h"

@interface AZWasher : AZHuman

@property (nonatomic, assign) double moneyFromCars;

- (void)washCar:(AZCar *)car;
- (void)takeMoneyFromCar:(double)amount;
- (double)passMoneyToAccountant;
- (instancetype)init;

@end
