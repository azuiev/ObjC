//
//  AZCar.h
//  idap
//
//  Created by Aleksey Zuiev on 26/04/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AZCar : NSObject

@property (nonatomic, copy)   NSString  *mark;
@property (nonatomic, assign) float     money;
@property (nonatomic, assign) BOOL      isClear;

+ (instancetype)init;

- (void)dealloc;
- (instancetype)init;
- (double)payForClearing;
- (void)sayHi;

@end
