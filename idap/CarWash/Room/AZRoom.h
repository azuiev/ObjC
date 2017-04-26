//
//  AZRoom.h
//  idap
//
//  Created by Aleksey Zuiev on 26/04/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AZHuman.h"

@interface AZRoom : NSObject

@property (nonatomic,assign,readonly) NSArray *humans;
@property (nonatomic,assign) int humansCapacity;

- (void) addHuman:(AZHuman *) human;
- (void) removeHuman:(AZHuman *) human;

@end
