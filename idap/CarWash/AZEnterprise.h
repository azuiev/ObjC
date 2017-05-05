//
//  AZCarWashBuilding.h
//  idap
//
//  Created by Aleksey Zuiev on 28/04/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "AZBuilding.h"

@interface AZEnterprise : NSObject

@property (nonatomic, retain, readonly) AZBuilding *administration;
@property (nonatomic, retain, readonly) AZBuilding *carWash;

+ (instancetype)initWithAdministration:(AZBuilding *)administration carWash:(AZBuilding *)carWash;
- (instancetype)initWithAdministration:(AZBuilding *)administration carWash:(AZBuilding *)carWash;

- (void)performBusinessProcess:(AZCar *)car;

@end
