//
//  AZBuilding.h
//  idap
//
//  Created by Aleksey Zuiev on 26/04/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AZCar.h"
#import "AZWasher.h"
#import "AZAccountant.h"
#import "AZDirector.h"
#import "AZRoom.h"

@interface AZBuilding : NSObject
@property (nonatomic, copy, readonly) NSArray *rooms;

- (void)addRoom:(AZRoom *)room;

@end
