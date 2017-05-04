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

+ (instancetype)initWithHumansCapacity:(NSUInteger)humansCapacity {
    AZRoom *result = [[[self alloc] init] autorelease];
    result.mutableHumansCapacity = humansCapacity;
    return result;
}

- (instancetype)init {
    [super init];
    self.mutableHumans = [NSMutableArray array];
    self.mutableHumansCapacity = AZDefaultHumanCount;
    return self;
}

- (NSArray *) humans:(NSUInteger)humansCapacity {
    return [[self.mutableHumans copy] autorelease];
}

- (NSUInteger) humansCapacity:(NSUInteger)humansCapacity {
    return self.mutableHumansCapacity;
}

- (void) addHuman:(AZHuman *)human {
    if (!human) {
        NSLog(@"Achtung!!!");
    }
    [self.mutableHumans addObject:human];
}

- (void) removeHuman:(AZHuman *)human {
    if (!human) {
        NSLog(@"Achtung!!!");
    }
    [self.mutableHumans removeObject:human];
}

@end
