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
@dynamic children;

+(Creature *)create {
    Creature *creature = [[[self alloc] init] autorelease];
    [creature create];
    return creature;
}

-(NSArray *)children {
    return [[self mutableChildren] copy];
}

-(void)remove {
    [self setMutableChildren:nil];
    [self.children dealloc];
    [self dealloc];
    [super dealloc];
}

-(void)sayHi {
    NSLog(@"HI. I`am %@ (%@) - %3.1f years old, %3.1f kilo", [self name], [self class], [self age], [self weight]);
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

-(void)performGenderSpecificOperation{
    
}

@end
