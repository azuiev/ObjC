//
//  AZRoom.m
//  idap
//
//  Created by Aleksey Zuiev on 26/04/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "AZRoom.h"

@interface AZRoom ()
@property (nonatomic, assign) NSMutableArray    *mutableHumans;
@property (nonatomic, assign) NSUInteger        mutableHumansCapacity;
@end

@implementation AZRoom
@dynamic humans;
@dynamic humansCapacity;

#pragma mark -
#pragma mark Initialization and Deallocation

+ (instancetype)initWithHumansCapacity:(NSUInteger)humansCapacity {
   return [[[self alloc] initWithHumansCapacity:humansCapacity] autorelease];
}

- (instancetype)initWithHumansCapacity:(NSUInteger)humansCapacity {
    [super init];
    self.mutableHumans = [NSMutableArray array];
    self.mutableHumansCapacity = humansCapacity;
    return self;
}

- (instancetype)init {
    [super init];
    self.mutableHumans = [NSMutableArray array];
    self.mutableHumansCapacity = AZDefaultHumansCount;
    return self;
}

#pragma mark -
#pragma mark Getters

- (NSArray *)humans {
    return [[self.mutableHumans copy] autorelease];
}

- (NSUInteger)humansCapacity {
    return self.mutableHumansCapacity;
}

#pragma mark -
#pragma mark Public methods

- (void)sayHi {
    NSLog(@"Hi! I am %@ with humansCapacity - %lu", [self class], (unsigned long)self.mutableHumansCapacity);
}

- (void)addHuman:(AZHuman *)human {
    if (!human) {
        NSLog(@"Achtung!!!");
    }
    [self.mutableHumans addObject:human];
}

- (void)removeHuman:(AZHuman *)human {
    if (!human) {
        NSLog(@"Achtung!!!");
    }
    [self.mutableHumans removeObject:human];
}

@end
