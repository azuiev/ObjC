//
//  AZHuman.m
//  idap
//
//  Created by Aleksey Zuiev on 26/04/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "AZHuman.h"

@implementation AZHuman

#pragma mark -
#pragma mark Initialization

+ (instancetype)init{
    return [[[self alloc] init] autorelease];
}

- (instancetype)init{
    [super init];
    self.name = @"aaa";
    self.salary = 5000.0;
    self.expirience = 10.0;
    return self;
}

#pragma mark -
#pragma mark Implements methods

- (void)sayHi{
    NSLog(@"HI! I am %@ - %@, salary - %4.2f, expirience - %2.1f",[self class],self.name,self.salary,self.expirience);
}

@end
