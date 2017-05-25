//
//  AZCarWashBuilding.h
//  idap
//
//  Created by Aleksey Zuiev on 28/04/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "AZEmployee.h"
#import "AZCar.h"


@interface AZEnterprise : NSObject <AZEmployeeObserver>

- (void)performBusinessProcess:(AZCar *)car;

@end
