//
//  AZHuman.h
//  idap
//
//  Created by Aleksey Zuiev on 26/04/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AZMoneyFlow.h"

@interface AZHuman : NSObject <AZMoneyFlow>

@property (nonatomic, copy)     NSString    *name;
@property (nonatomic, assign)   double      salary;
@property (nonatomic, assign)   double      experience;
	
- (instancetype)init;
- (void)sayHi;

@end
