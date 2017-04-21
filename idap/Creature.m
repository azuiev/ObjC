	//
//  Creature.m
//  idap
//
//  Created by Aleksey Zuiev on 20/04/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Creature.h"

@interface Creature ()
    @property (nonatomic, retain)   NSMutableArray *mutableChildren;
@end

@implementation Creature

@synthesize gender = _gender;
@dynamic children;

+(Creature *)create {
    Creature *creature = [[[self alloc] init] autorelease];
    [creature create];
    return creature;
}

-(NSArray *) children {
    return [[self mutableChildren] copy];
}

-(NSString *)genderAsString {
    return male == [self gender] ? @"male" : @"female";
}

-(void)goToWar {
    NSLog(@"%@ went to war",[self name]);
}

-(void)bornChild {
    NSLog(@"%@ went to give birth to children",[self name]);
}

-(void)remove {
    [self setMutableChildren:nil];
    [self.children dealloc];
    [self dealloc];
    [super dealloc];
}

-(void)sayHi {
    NSLog(@"HI. I`am %@ (%@) - %3.1f years old, %3.1f kilo", [self name], [self genderAsString], [self age], [self weight]);
    if (0 == [self.children count]){
        return;
    }
    NSLog(@"%@`s children",[self name]);
    for (Creature *creature in self.children) {
        [creature sayHi];
    }
    NSLog(@"\n");
}

-(void)addChild:(Creature *)child {
    [self.mutableChildren addObject:child];
}

-(void)removeChild:(Creature *)child {
    [self.mutableChildren removeObject:child];
}

-(void)create {
    [self setMutableChildren:[NSMutableArray new]];
}
@end
