//
//  TestCreature.m
//  idap
//
//  Created by Aleksey Zuiev on 21/04/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TestCreature.h"
#import "Creature.h"

@implementation TestCreature

#define createCreature(parameter,name,gender,age,weight) \
    Creature *parameter = [Creature create]; \
    [TestCreature setProperties :parameter :@#name :gender :age :weight]; \
    [childrenArray addObject:parameter]

+ (void) test {
    NSMutableArray *childrenArray = [NSMutableArray new];
    
    createCreature(creature1, Yasya, male, 25.4, 99.9);
    createCreature(creature2, Natasha, female, 9.4, 30);
    createCreature(creature3, Yulia, female, 11.4, 32.2);
    createCreature(creature4, Dasha, female, 101.0, 70.5);
    createCreature(creature5, Petya, male, 25.4, 80.8);
    
    [creature1 addChild:creature2];
    [creature1 addChild:creature3];
    [creature5 addChild:creature2];
    [creature5 addChild:creature3];
    [creature4 addChild:creature1];
    [creature4 addChild:creature5];
    
    [creature4 sayHi];
    
    for (Creature *creature in childrenArray) {
        switch ([creature gender]) {
            case male: [creature goToWar];
                break;
            case female: [creature bornChild];
                break;
            default: NSLog(@"ACHTUNG!!!");
                break;
        }
    }
}

+ (void) setProperties :(Creature *)creature :(NSString *)name :(gender)gender :(double)age :(double)weight {
    [creature setName:name];
    [creature setGender:gender];
    [creature setAge:age];
    [creature setWeight:weight];
}

@end
