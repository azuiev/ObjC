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
@property (nonatomic, assign) NSUInteger        humansCapacity;
@end

@implementation AZRoom
@dynamic humans;

#pragma mark -
#pragma mark Initialization and Deallocation

+ (instancetype)roomWithHumansCapacity:(NSUInteger)humansCapacity {
   return [[[self alloc] initWithHumansCapacity:humansCapacity] autorelease];
}

- (instancetype)initWithHumansCapacity:(NSUInteger)humansCapacity {
    self = [super init];
    self.mutableHumans = [NSMutableArray array];
    self.humansCapacity = humansCapacity;
    [self sayHi];
    
    return self;
}

- (instancetype)init {
    return [self initWithHumansCapacity:AZDefaultHumansCount];
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)humans {
    return [[self.mutableHumans copy] autorelease];
}

#pragma mark -
#pragma mark Public

- (void)sayHi {
    NSLog(@"Hi! I am %@ with humansCapacity - %lu", [self class], self.humansCapacity);
}

- (void)addHuman:(AZHuman *)human {
    if (!human) {
        NSLog(@"Achtung!!!");
        
        return;
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
