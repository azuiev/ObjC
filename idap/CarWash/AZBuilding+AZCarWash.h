//
//  AZBuilding+AZCarWash.h
//  idap
//
//  Created by Aleksey Zuiev on 26/04/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "AZBuilding.h"

@interface AZBuilding (AZCarWash)

- (void)washCarBy:(AZCar *)car washer:(AZWasher *)washer accountant:(AZAccountant *)accountant director:(AZDirector *)director;

@end
