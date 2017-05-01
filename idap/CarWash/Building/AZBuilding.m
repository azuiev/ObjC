//
//  AZBuilding.m
//  idap
//
//  Created by Aleksey Zuiev on 26/04/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//
#import "AZBuilding.h"

@interface AZBuilding ()
@property (nonatomic, retain)   NSMutableArray *mutableRooms;
@end

@implementation AZBuilding
@dynamic rooms;

#pragma mark -
#pragma mark Initialization and Deallocation

+ (instancetype)init {
    return [[[self alloc] init] autorelease];
}

- (instancetype)init {
    self.mutableRooms = [NSMutableArray new] ;
    return self;
}

- (void)dealloc{
    [self.mutableRooms release];
    self.mutableRooms = nil;
    [super dealloc];
}

#pragma mark -
#pragma mark Getters

- (NSArray *)rooms {
    return [[self.mutableRooms copy] autorelease];
}

#pragma mark -
#pragma mark Getters

- (void)addRoom:(AZRoom *)room {
    if(!room){
        NSLog(@"Achtung!!!");
        return;
    }
    [self.mutableRooms addObject:room];
}



@end
