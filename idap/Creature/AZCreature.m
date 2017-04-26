	//
//  Creature.m
//  idap
//
//  Created by Aleksey Zuiev on 20/04/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AZCreature.h"

@interface AZCreature ()
    @property (nonatomic, retain)   NSMutableArray *mutableChildren;
@end

@implementation AZCreature
@dynamic children;

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
    for (AZCreature *creature in self.children) {
        [creature sayHi];
    }
    
    NSLog(@"\n");
}

-(void)addChild:(AZCreature *)child {
    [self.mutableChildren addObject:child];
}

-(void)removeChild:(AZCreature *)child {
    [self.mutableChildren removeObject:child];
}

-(void)create {
    [self setMutableChildren:[NSMutableArray new]];
}

-(void)performGenderSpecificOperation{
    
}

@end
