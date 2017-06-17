//
//  AZDispatcher.h
//  idap
//
//  Created by Aleksey Zuiev on 17/06/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AZEmployee.h"

@interface AZDispatcher : NSObject <AZEmployeeObserver>
@property (nonatomic, readonly)   NSArray   *handlers;
@property (nonatomic, readonly)   NSArray   *processedObjects;

- (void)processObject:(id<AZMoneyFlow> *)object;

@end
