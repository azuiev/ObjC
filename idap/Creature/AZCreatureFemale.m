//
//  CreatureFemale.m
//  idap
//
//  Created by Aleksey Zuiev on 21/04/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "AZCreatureFemale.h"

@implementation AZCreatureFemale

- (void)performGenderSpecificOperation{
    NSLog(@"%@ went to give birth to children", [self name]);
}

@end
