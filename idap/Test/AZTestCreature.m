//
//  TestCreature.m
//  idap
//
//  Created by Aleksey Zuiev on 21/04/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AZTestCreature.h"
#import "AZCreatureMale.h"
#import "AZCreatureFemale.h"
#import "AZCreature+AZCreatureCategory.h"

@implementation AZTestCreature

+ (void)performTest {
#define createCreature(parameter,name,gender,age,weight) \
    AZCreature *parameter = [AZCreature##gender object]; \
    [AZTestCreature setProperties :parameter :@#name :age :weight]; \
    [childrenArray addObject:parameter]; \

    NSMutableArray *childrenArray = [NSMutableArray new];
    
    createCreature(creature1, Yasya, Male, 25.4, 99.9);
    createCreature(creature2, Natasha, Female, 9.4, 30);
    createCreature(creature3, Yulia, Female, 11.4, 32.2);
    createCreature(creature4, Dasha, Female, 101.0, 70.5);
    createCreature(creature5, Petya, Male, 25.4, 80.8);
    
    [creature1 addChild:creature2];
    [creature1 addChild:creature3];
    [creature5 addChild:creature2];
    [creature5 addChild:creature3];
    [creature4 addChild:creature1];
    [creature4 addChild:creature5];
    
    [creature4 sayHi];
    
    for (AZCreature *creature in childrenArray) {
        [creature performGenderSpecificOperation];
    }
    
#undef createCreature
    
}

+ (void)setProperties :(AZCreature *)creature :(NSString *)name :(double)age :(double)weight {
    [creature setName:name];
    [creature setAge:age];
    [creature setWeight:weight];
}

@end
