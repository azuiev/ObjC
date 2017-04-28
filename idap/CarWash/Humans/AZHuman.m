//
//  AZHuman.m
//  idap
//
//  Created by Aleksey Zuiev on 26/04/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "AZHuman.h"
#import "AZStringGenerator.h"

@implementation AZHuman

#pragma mark -
#pragma mark Initialization

+ (instancetype)init{
    return [[[self alloc] init] autorelease];
}

- (instancetype)init{
    [super init];
    self.name = [AZStringGenerator randomName];
    self.salary = [AZStringGenerator randomNumberInRangeFrom:1000 to:5000];
    self.experience = [AZStringGenerator randomNumberInRangeFrom:0 to:50];
    [self sayHi];
    return self;
}

#pragma mark -
#pragma mark Implements methods

- (void)sayHi{
    NSLog(@"HI! I am %@ - %@, salary - %4.2f, expirience - %2.1f", [self class], self.name, self.salary, self.experience);
}

@end
