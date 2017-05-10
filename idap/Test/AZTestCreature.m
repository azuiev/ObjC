//
//  TestCreature.m
//  idap
//
//  Created by Aleksey Zuiev on 21/04/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AZTestCreature.h"
#import "AZCreatureMale.h"
#import "AZCreatureFemale.h"
#import "NSObject+AZObjectExtension.h"
#import "NSNumber+AZRandomNumber.h"

static const NSUInteger AZCreaturesCount = 10;
static const NSUInteger AZParentalDependenciesCount = 40;


@implementation AZTestCreature

+ (void)performTest {
    NSArray *creatures = [NSObject objectsWithCount:AZCreaturesCount block:^id {
        return (randomNumberWithMaxValue(1)) ? [AZCreatureFemale object] : [AZCreatureMale object];
    }];
    
    for (NSUInteger i = 0; i < AZParentalDependenciesCount; i += 1) {
        AZCreature *parent = creatures[randomNumberWithMaxValue(AZCreaturesCount - 1)];
        AZCreature *child = creatures[randomNumberWithMaxValue(AZCreaturesCount - 1)];
        [parent addChild:child];
        
    }
    
    for (AZCreature *creature in creatures) {
        [creature performGenderSpecificOperation];
        [creature sayHi];
    }
}

@end
