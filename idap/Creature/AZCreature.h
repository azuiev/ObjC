//
//  Creature.h
//  idap
//
//  Created by Aleksey Zuiev on 20/04/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface AZCreature : NSObject

@property (nonatomic, copy, readonly)     NSString  *name;
@property (nonatomic, assign)   NSUInteger    age;
@property (nonatomic, assign)   NSUInteger    weight;

@property (nonatomic, copy, readonly)   NSArray *children;

- (void)sayHi;
- (void)addChild:(AZCreature *)child;
- (void)removeChild:(AZCreature *)child;
- (void)performGenderSpecificOperation;

@end


