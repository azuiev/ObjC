//
//  AZRoom.h
//  idap
//
//  Created by Aleksey Zuiev on 26/04/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AZHuman.h"

static const NSUInteger AZDefaultHumanCount = 1;

@interface AZRoom : NSObject

@property (nonatomic, copy, readonly)   NSArray     *humans;
@property (nonatomic, assign, readonly) NSUInteger  humansCapacity;

+ (instancetype)initWithHumansCapacity:(NSUInteger) humansCapacity;

- (void)addHuman:(AZHuman *) human;
- (void)removeHuman:(AZHuman *) human;

@end
