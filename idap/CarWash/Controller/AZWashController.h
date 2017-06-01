//
//  AZWashController.h
//  idap
//
//  Created by Aleksey Zuiev on 01/06/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AZEmployee.h"

#import "AZQueue.h"

@interface AZWashController : NSObject <AZEmployeeObserver>
@property (nonatomic, readonly)   NSArray   *washers;
@property (nonatomic, readonly)   NSArray   *cars;

@end
