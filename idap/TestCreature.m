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

+ (void) test {
    Creature *creature1 = [Creature create];
    [creature1 setName:@"Yasya"];
    [creature1 setGender:male];
    [creature1 setAge:25.4];
    [creature1 setWeight:99.9];
    [creature1 sayHi];
}
@end
