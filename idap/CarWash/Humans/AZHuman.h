//
//  AZHuman.h
//  idap
//
//  Created by Aleksey Zuiev on 26/04/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AZMoneyFlow.h"

typedef NS_ENUM(NSUInteger, AZEmployeeState) {
    AZFreeEmployee,
    AZBusyEmployee
};

@interface AZHuman : NSObject <AZMoneyFlow>
@property (nonatomic, copy)     NSString        *name;
@property (nonatomic, assign)   NSUInteger      salary;
@property (nonatomic, assign)   NSUInteger      experience;
@property (nonatomic, assign)   AZEmployeeState state;

- (void)sayHi;
- (void)processObject:(id<AZMoneyFlow>)object;

//method to override. Do not call this method
- (void)performSpecificForClassOperation:(id<AZMoneyFlow>)moneySpender;

@end
