//
//  Creature.h
//  idap
//
//  Created by Aleksey Zuiev on 20/04/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//
#import <Foundation/Foundation.h>

@class Creature;

@interface Creature : NSObject

@property 	(nonatomic, copy)       NSString       *name;
@property   (nonatomic, assign)     double         age;
@property   (nonatomic, assign)     double         weight;
@property   (nonatomic, copy, readonly)   NSArray *children;

-(void)remove;
-(void)sayHi;
-(void)addChild:(Creature *)child;
-(void)removeChild:(Creature *)child;
-(void)performGenderSpecificOperation;

@end


