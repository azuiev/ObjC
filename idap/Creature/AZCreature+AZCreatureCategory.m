//
//  Creature+CreatureCategory.m
//  idap
//
//  Created by Aleksey Zuiev on 21/04/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "AZCreature+AZCreatureCategory.h"

@implementation AZCreature (AZCreatureCategory)

+ (AZCreature *)create {
    AZCreature *creature = [[[self alloc] init] autorelease];
    [creature create];
    return creature;
}

@end
