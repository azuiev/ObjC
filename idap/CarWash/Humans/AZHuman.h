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
@property (nonatomic, assign)   NSUInteger  salary;
@property (nonatomic, assign)   NSUInteger  experience;
	
- (void)sayHi;
- (void)processObject:(id<AZMoneyFlow>)object;

@end
