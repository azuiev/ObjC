//
//  Creature+CreatureCategory.m
//  idap
//
//  Created by Aleksey Zuiev on 21/04/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "Creature+CreatureCategory.h"

@implementation Creature (CreatureCategory)

+(Creature *)create {
    Creature *creature = [[[self alloc] init] autorelease];
    [creature create];
    return creature;
}

@end
