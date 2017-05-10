	//
//  Creature.m
//  idap
//
//  Created by Aleksey Zuiev on 20/04/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AZCreature.h"
#import "NSString+AZRandomString.h"
#import "NSNumber+AZRandomNumber.h"

static NSUInteger const AZMaxHumansAge = 100;
static NSUInteger const AZMaxHumansWeight = 200;

@interface AZCreature ()
@property (nonatomic, retain)   NSMutableArray  *mutableChildren;
@property (nonatomic, copy)     NSString        *name;

@end

@implementation AZCreature
@dynamic children;

#pragma mark -
#pragma mark Initialization and Deallocation

- (void)dealloc {
    self.mutableChildren = nil;
    self.name = nil;
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    self.mutableChildren = [NSMutableArray array];
    self.name = [NSString randomName];
    self.age = randomNumberWithMaxValue(AZMaxHumansAge);
    self.weight = randomNumberWithMaxValue(AZMaxHumansWeight);
    
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
    
    if ([self isEqual:(child)]) {
        NSLog(@"Unable to be parent of themselfs");
        
        return;
    }
    
    if (self.age < child.age) {
        NSLog(@"Parent can`t be yunger then child");
        
        return;
    }
    
    if ([self.mutableChildren containsObject:child]) {
        NSLog(@"Already in child list");
        
        return;
    }
    
    [self.mutableChildren addObject:child];
}

- (void)removeChild:(AZCreature *)child {
    [self.mutableChildren removeObject:child];
}

- (void)performGenderSpecificOperation {
    
}

#pragma mark -
#pragma mark Override methods

- (NSString *)description {
    return [NSString stringWithFormat:@"%@ (%@) - %lu years old, %lu kilo", [self class], self.name, self.age, self.weight];
}

@end
