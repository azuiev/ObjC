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

#pragma mark -
#pragma mark Initialization and Deallocation

- (void)dealloc {
    self.mutableChildren = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    self.mutableChildren = [NSMutableArray array];
    
    return self;
}

#pragma mark -
#pragma mark Getters

- (NSArray *)children {
    return [[self.mutableChildren copy] autorelease];
}

#pragma mark -
#pragma mark Public Methods

- (void)sayHi {
    NSLog(@"HI. I`am %@", self);
    if (0 == [self.children count]){
        return;
    }
    
    NSLog(@"%@`s children",[self name]);
    for (AZCreature *creature in self.children) {
        [creature sayHi];
    }
    
    NSLog(@"\n");
}

- (void)addChild:(AZCreature *)child {
    if (!child){
        NSLog(@"Achtung!!!");
        
        return;
    }
    
    [self.mutableChildren addObject:child];
}

- (void)removeChild:(AZCreature *)child {
    if (!child){
        NSLog(@"Achtung!!!");
    }
    
    [self.mutableChildren removeObject:child];
}

- (void)performGenderSpecificOperation {
    
}

#pragma mark -
#pragma mark Override methods

- (NSString *)description {
    return [NSString stringWithFormat:@"%@ (%@) - %3.1f years old, %3.1f kilo", [self class], self.name, self.age, self.weight];
}

@end
