//
//  AZCarWashBuilding.h
//  idap
//
//  Created by Aleksey Zuiev on 28/04/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "AZBuilding.h"

@interface AZEnterprise : NSObject

@property (nonatomic, retain, readonly) AZBuilding *adminBuilding;
@property (nonatomic, retain, readonly) AZBuilding *carWashBuilding;

- (void)performBusinessProcess:(AZCar *)car;

@end
