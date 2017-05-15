//
//  AZBuilding.m
//  idap
//
//  Created by Aleksey Zuiev on 26/04/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//
#import "AZBuilding.h"

#import "NSArray+AZExtension.h"

@interface AZBuilding ()
@property (nonatomic, copy)   NSMutableArray *mutableRooms;
@end

@implementation AZBuilding
@dynamic rooms;

#pragma mark -
#pragma mark Initialization and Deallocation

- (void)dealloc {
    self.mutableRooms = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    self.mutableRooms = [NSMutableArray array] ;
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)rooms {
    return [[self.mutableRooms copy] autorelease];
}

#pragma mark -
#pragma mark Public

- (NSArray *)findEmployeeByClass:(Class)cls {
    NSMutableArray *result = [NSMutableArray array];
    for (AZRoom *room in self.mutableRooms) {
        [result addObjectsFromArray:[[room humans] objectsWithClass:cls]];
    }
    
    return [NSArray arrayWithArray:result];
}

- (void)addRoom:(AZRoom *)room {
    if(!room) {
        NSLog(@"Achtung!!!");
        
        return;
    }
    
    [self.mutableRooms addObject:room];
}

- (void)removeRoom:(AZRoom *)room {
    [self.mutableRooms removeObject:room];
}

@end
