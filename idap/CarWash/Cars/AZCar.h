//
//  AZCar.h
//  idap
//
//  Created by Aleksey Zuiev on 26/04/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AZMoneyFlow.h"

typedef NS_ENUM(NSUInteger, AZCarState) {
    AZDirtyCar,
    AZCleanCar
};

@interface AZCar : NSObject <AZMoneyFlow>
@property (nonatomic, copy)   NSString      *mark;
@property (nonatomic, assign) AZCarState    state;

- (void)sayHi;

@end
