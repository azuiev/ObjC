	//
//  Creature.m
//  idap
//
//  Created by Aleksey Zuiev on 20/04/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Creature.h"

@implementation Creature
@synthesize gender = _gender;

+(Creature *)create {
    Creature *creature = [[[self alloc] init] autorelease];
    [creature setChildren:[[NSMutableArray alloc] init]];
    return creature;

}

-(NSString *)genderAsString {
    return male == [self gender] ? @"male" : @"female";
}
-(void)goToWar {
    NSLog(@"%@ went to war",[self name]);
}
-(void)bornChild {
    NSLog(@"%@ Went to give birth to children",[self name]);
}
-(void)remove {
    [self setChildren:nil];
    [self dealloc];
    [super dealloc];
}
-(void)sayHi {
    NSLog(@"HI. I`am %@ (%@) - %3.1f years old, %3.1f kilo",[self name],[self genderAsString],[self age],[self weight]);
}
-(void)addChild {
    
}
-(void)removeChild {
    
}

@end
