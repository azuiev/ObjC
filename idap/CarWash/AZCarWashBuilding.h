//
//  AZCarWashBuilding.h
//  idap
//
//  Created by Aleksey Zuiev on 28/04/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "AZBuilding.h"

@interface AZCarWashBuilding : AZBuilding

- (void)washCarBy:(AZCar *)car washer:(AZWasher *)washer accountant:(AZAccountant *)accountant director:(AZDirector *)director;

@end
