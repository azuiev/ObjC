//
//  AZCar.m
//  idap
//
//  Created by Aleksey Zuiev on 26/04/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "AZCar.h"

@implementation AZCar

#pragma mark -
#pragma mark Initialization

+ (instancetype)init{
    return [[[self alloc] init] autorelease];
}

- (instancetype)init{
    [super init];
    self.mark = [self randomMark];
    self.money = 5000.0;
    [self sayHi];
    return self;
}

#pragma mark -
#pragma mark Private Methods

- (NSString *)randomMark {
    NSArray *listOfMarks = [NSArray arrayWithObjects:
                           @"Alfa-romeo",
                           @"Bugatti",
                           @"Ferrary",
                           @"Ford",
                           @"Lamborgini",
                           @"Mazeratti",
                           @"Opel",
                           @"Porshe",
                           @"Toyota",
                           nil];
    return [listOfMarks objectAtIndex:arc4random_uniform((uint32_t)[listOfMarks count])];
                           
}

#pragma mark -
#pragma mark Implements methods

- (void)sayHi{
    NSLog(@"HI! I am %@ - %@. I have %4.2f dollars",[self class],self.mark,self.money);
}

@end
