//
//  AZCar.h
//  idap
//
//  Created by Aleksey Zuiev on 26/04/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AZMoneyFlow.h"

typedef NS_ENUM(NSUInteger, clearStatus) {
    CLEAR,
    DIRTY
};

@interface AZCar : NSObject <AZMoneyFlow>
@property (nonatomic, copy)   NSString      *mark;
@property (nonatomic, assign) clearStatus   clear;

- (void)sayHi;

@end
