//
//  Creature.h
//  idap
//
//  Created by Aleksey Zuiev on 20/04/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface AZCreature : NSObject

@property (nonatomic, copy)       NSString       *name;
@property (nonatomic, assign)     double         age;
@property (nonatomic, assign)     double         weight;

@property (nonatomic, copy, readonly)   NSArray *children;

- (void)sayHi;
- (void)addChild:(AZCreature *)child;
- (void)removeChild:(AZCreature *)child;
- (void)performGenderSpecificOperation;

@end


